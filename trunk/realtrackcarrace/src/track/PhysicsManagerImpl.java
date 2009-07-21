package track;



import car.CarPhys;
import java.net.MalformedURLException;
import java.rmi.*;
import java.rmi.server.*;
import java.rmi.registry.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.phys2d.math.Vector2f;
import net.phys2d.raw.Body;
import net.phys2d.raw.World;
import net.phys2d.raw.Joint;
import net.phys2d.raw.StaticBody;
import net.phys2d.raw.shapes.Line;
import net.phys2d.raw.strategies.QuadSpaceStrategy;


public class PhysicsManagerImpl extends UnicastRemoteObject
                             implements PhysicsManager {

    float dampingAccelleration = 0.01f;
    float dampingNotAccelleration = 0.15f;
    float dampingRotationAccelleration = 0.04f;
    float dampingRotationNotAccelleration = 0.2f;
    float frictionBorder = 5f;

    float factorOutTrack[] = new float[10];


    /*
     *  Physic world
    */
    public World world;

    /*
     *  Server name
    */
    private String nameServer;

    /*
     *  Map name
    */
    private String nameMap;

    /*
     *  If flagGo is true, than active accellerations and rotations control
    */
    private boolean flagGo = false;

    /*
     *  All physic cars
    */
    public CarPhys[] cars = new CarPhys[10];

    /*
     *  All actived user cars
    */
    private boolean[] carsUser = new boolean[10];

    /*
     *  If server is start for lanch all users loading manager
    */
    private Boolean running = false;

    /*
     *  If all users load scene
    */
    private Boolean[] readyUsers = new Boolean[10];

    /*
     *  Accelleration and rotation users
    */
    private Accelleration[] accellerations = new Accelleration[10];
    private Rotation[] rotations = new Rotation[10];

    /*
     *  User position and check point
    */
    private ArrayList checkPoint;
    private int[] userCheckPoint = new int[10];

    /*
     *  Classifica
     */
    private Integer[] pos = new Integer[10];
    private Integer updateNum = 0 ;

    /*
     *  Car style
    */
    private int[] carStyle =  new int[10];

    /*
     *  vector coordinates
    */
    private ArrayList points;
    private ArrayList special_points;
    private ArrayList streetNames;

    private float[] lastDamping = new float[10];

    public PhysicsManagerImpl() throws RemoteException {
        world = new World(new Vector2f(0.0f, 0.0f), 10, new QuadSpaceStrategy(20,5));
    }

    @Override
    public void update() throws RemoteException {
       for (int i = 0; i < 5; i++) {
            world.step();
            //System.out.println("update");
       }
    }

    @Override
    public void add(Body body) throws RemoteException {
        world.add(body);
    }

    @Override
    public void add(Joint j) throws RemoteException {
        world.add(j);
    }

    @Override
    public void addStaticBox(float start_x,float start_y,float end_x,float end_y) throws RemoteException{
        Line line = new Line(end_x-start_x,end_y-start_y);
        StaticBody body = new StaticBody(line);
        body.setPosition(start_x, start_y);
        body.setFriction(frictionBorder);
        System.out.println(start_x +" "+ start_y +" "+ end_x+" "+ end_y + " - "+line.getStart().getX()+" "+line.getStart().getY()+" - "+body.getPosition().getX()+" "+body.getPosition().getY());
        this.add(body);
    }

    @Override
    public void remove(Body body) throws RemoteException {
        world.remove(body);
    }

    @Override
    public void remove(Joint joint) throws RemoteException {
        world.remove(joint);
    }

    @Override
    public Float getX(int i) throws RemoteException{
        return cars[i].body.getPosition().getX();
    }

    @Override
    public Float getY(int i) throws RemoteException{
        return cars[i].body.getPosition().getY();
    }

    @Override
    public Float getWidth(int i) throws RemoteException{
        return cars[i].Width;
    }

    @Override
    public Float getHeight(int i) throws RemoteException{
        return cars[i].Height;
    }

    @Override
    public Float getRotation(int i) throws RemoteException{
        return cars[i].body.getRotation();
    }


    @Override
    public void accellera(int i, float par_forza) throws RemoteException{
            synchronized(this){
                cars[i].body.setDamping(dampingAccelleration * factorOutTrack[i]);
                if(accellerations[i].running == false){
                    accellerations[i].par_forza = par_forza;
                    accellerations[i].running = true;
                }
            }
    }


    @Override
    public void accelleraStop(int i) throws RemoteException{
        //if(this.flagGo!=false){
            synchronized(this){
                accellerations[i].running = false;
                cars[i].body.setDamping(dampingNotAccelleration * factorOutTrack[i]);
            }
        //}
    }

    @Override
    public void setRotation(int i, float velocitaRotazione) throws RemoteException{
           if(rotations[i].rotation == false){
                rotations[i].velocitaRotazione = velocitaRotazione;
                rotations[i].rotation = true;                
            }
    }

    /*
    * Initial rotation angle
    */
    @Override
    public void setInitialRotation(int i,float angle) throws RemoteException{
        this.cars[i].body.setRotation(angle);
    }

    @Override
    public void setRotationStop(int i) throws RemoteException{
            synchronized(this){
                this.rotations[i].rotation = false;
                cars[i].body.setDamping(0.02f);
            }
    }

    @Override
    public String getName() throws RemoteException{
        return this.nameServer;
    }

    @Override
    public String getMapName() throws RemoteException{
        return this.nameMap;
    }

    @Override
    /*
     *  Insert physic car and set user name in this
    */
    public boolean setCar(String name, int num) throws RemoteException{
        if(carsUser[num]==false){
            carsUser[num] = true;
            cars[num].setOwner(name);
            return true;
        }else{
            return false;
        }
    }

    @Override
    /*
     *  Insert physic car and set user name in this
    */
    public String getUserName(int num) throws RemoteException{
        return  this.cars[num].getOwner();
    }

    @Override
    public boolean getCarState(int num) throws RemoteException{
        return this.carsUser[num];
    }

    @Override
    public String getOwnerCar(int num) throws RemoteException{
        if(carsUser[num]==true){
            return cars[num].getOwner();
        }else{
            return null;
        }
    }

    @Override
    public void setRunning(boolean value) throws RemoteException {
        for(int i = 0; i<10; i++){
            if(this.carsUser[i]==true){
                this.add(cars[i].body);
            }
        }
        running = value;
        // init position 
        initPosition();
    }

    @Override
    public boolean getRunning() throws RemoteException{
        return this.running;
    }

    @Override
    public void setReady(int i) throws RemoteException{
        this.readyUsers[i] = true;
    }

    @Override
    public int getAllReady() throws RemoteException{
        int ready = -1;
        for(int i=0;i<10;i++){
            if(carsUser[i]==true){
                if(this.readyUsers[i]==false){
                    return i;
                }
            }
        }
        return ready;
    }

    @Override
    public void stopServer() throws Exception{
        this.init();
        Naming.unbind("//localhost/SAMPLE-SERVER");
        System.out.println("Stop server!");
    }

    /*
     *  Set flag for GO!
    */
    @Override
    public void setFlagGo(boolean flag) throws RemoteException{
        this.flagGo = flag;
    }

    /*
     *  Set check point
    */
    @Override
    public synchronized void setChekPoint(Integer cp, Integer numCar) throws RemoteException{
        cp++;
        if(cp != userCheckPoint[numCar]){
            this.userCheckPoint[numCar] = cp;
            if(this.checkPoint.size() <= cp){
                ArrayList list = new ArrayList();
                list.add(numCar);
                this.checkPoint.add(cp,list);
                System.out.println("Inserisco nuovo cp");
            }else{
                ArrayList list = (ArrayList)this.checkPoint.get(cp);
                list.add(numCar);
                System.out.println("Aggiungo item in cp: "+cp);
            }

            // Print
            int listt = 0;
            while(listt < this.checkPoint.size()){
                int item = 0;
                ArrayList subList = (ArrayList)this.checkPoint.get(listt);
                while(item < subList.size()){
                    System.out.print(subList.get(item)+" ");
                    item++;
                }
                System.out.print("| ");
                listt++;
            }
            System.out.println(" ");

            // Remove prev
            if(cp!=0){
                ArrayList prev = (ArrayList)this.checkPoint.get(cp-1);
                System.out.println("Rimuovo prev cp: "+cp);
                int indexPrev = prev.indexOf(numCar);
                System.out.println("prev: "+indexPrev);
                prev.remove(indexPrev);
            }

            // Print
            int list = 0;
            while(list < this.checkPoint.size()){
                int item = 0;
                ArrayList subList = (ArrayList)this.checkPoint.get(list);
                while(item < subList.size()){
                    System.out.print(subList.get(item)+" ");
                    item++;
                }
                System.out.print("| ");
                list++;
            }
            System.out.println(" ");
            updateNum++;
        }
    }

    /*
     *    Position manager
    */
    @Override
    public synchronized Integer[] getPositions() throws RemoteException{

        System.out.println("call position");
        
        // puntatore a classifica
        int cont = 0;
        // temp array
        int[] temp_pos = new int[10];

        // scorro lista
        int list = 0;
        while(list < this.checkPoint.size()){
            
            ArrayList subList = (ArrayList)this.checkPoint.get(list);
            int item = subList.size()-1;

            while(item >= 0){
                Object x =  subList.get(item);
                temp_pos[cont] = (Integer)x;
                cont++;
                item--;
            }
            list++;
        }
        /*
        System.out.print("classifica: ");
        for(int i = 0; i< 10; i++){
           System.out.print(pos[i]+" ");
        }
        System.out.println("");
        */
        int num = this.getNumActiveCar()-1;
        int invert=0;
        while(num>=0){
            pos[invert]=temp_pos[num];
            invert++;
            num--;
        }

        return pos;
    }

    /*
     *  Return update position status
    */
    @Override
    public int getUpdatePosition() throws RemoteException{
        return updateNum;
    }

    /*
     *  Init positions
    */
    public void initPosition() throws RemoteException{
        int cont = 0;
        ArrayList first = new ArrayList();
        for(int i=0;i<10;i++){
            if(this.carsUser[i]==true){
                first.add(i);
                //pos[cont]=i;
                cont++;
            }
        }
        checkPoint.add(first);
    }

    /*
     *  Ready user array
    */
    @Override
    public boolean[] getReadyUserArray() throws RemoteException{
        return this.carsUser;
    }

    /*
    * change damping if not intersect track
    */
    @Override
    public void changeDamping(float damping, int numCar) throws RemoteException{
        this.lastDamping[numCar] = this.cars[numCar].body.getDamping();
        this.factorOutTrack[numCar] = damping;
    }

    @Override
    public void brake(float damping, int numCar) throws RemoteException{
        this.factorOutTrack[numCar] = damping;
    }

    @Override
    public void create(String name,String map) throws RemoteException, MalformedURLException
    {

        this.nameServer = name;
        this.nameMap = map;

        try{
            LocateRegistry.createRegistry(1099);
        }catch(Exception e){
            System.out.println(e);
        }
        
        if (System.getSecurityManager() == null) {
            System.setSecurityManager(new RMISecurityManager());
        }

        //create a local instance of the object
        PhysicsManagerImpl Server = this;

        init();

        //put the local instance in the registry
        Naming.rebind("//localhost/SAMPLE-SERVER" , Server);
        System.out.println("Server waiting.....");
  }

  /*
   *    Return active player  num
  */
  int getNumActiveCar(){
      int cont = 0;
      for(int i=0;i<10;i++){
          if(this.carsUser[i]==true){
              cont++;
          }
      }
      return cont;
  }

    /*
     *   Set car style
    */
    @Override
    public void setCarStyle(int user, int car) throws RemoteException{
        this.carStyle[user] = car;
        System.out.println("select car "+car+" from user "+user);
    }

    /*
     *   Get car style
    */
    @Override
    public int getCarStyle(int user) throws RemoteException{
        return this.carStyle[user];
    }

    /*
     * Add new coordinate point in array list
    */
    @Override
    public void addAllPoint(float lat, float lon) throws RemoteException{
        points.add(new Point(lat,lon));
    }

    /*
     * Add new coordinate point in array list special point
    */
    @Override
    public void addSpecialPoint(float lat, float lon) throws RemoteException{
        special_points.add(new Point(lat,lon));
    }

    @Override
    public void addStreetName(String road) throws RemoteException{
        streetNames.add(road);
    }

    /*
     * get Latitude
    */
    @Override
    public float getLat(int indexPoint) throws RemoteException{
        Point point = (Point) this.points.get(indexPoint);
        return point.lat;
    }

    @Override
    public float getSpecialLat(int indexPoint) throws RemoteException{
        Point point = (Point) this.special_points.get(indexPoint);
        return point.lat;
    }

    /*
     * get Latitude
    */
    @Override
    public float getLon(int indexPoint) throws RemoteException{
        Point point = (Point) this.points.get(indexPoint);
        return point.lon;
    }

    @Override
    public float getSpecialLon(int indexPoint) throws RemoteException{
        Point point = (Point) this.special_points.get(indexPoint);
        return point.lon;
    }

    @Override
    public String getStreetName(int indexPoint) throws RemoteException{
        String point = (String) this.streetNames.get(indexPoint);
        return point;
    }

    /*
     * get coordinate size
    */
    @Override
    public int getCoordinateSize() throws RemoteException{
        return points.size();
    }

    @Override
    public int getSpecialCoordinateSize() throws RemoteException{
        return this.special_points.size();
    }

    @Override
    public int getStreetNameSize() throws RemoteException{
        return this.streetNames.size();
    }

  void init(){
      this.streetNames = new ArrayList();
        this.checkPoint = new ArrayList();
        this.points =  new ArrayList();
        this.special_points =  new ArrayList();
        this.updateNum = 0;
        for(int i = 0; i<10; i++){        
                CarPhys car = new CarPhys(500.0f,500.0f);
                accellerations[i] = new Accelleration(i);
                rotations[i] = new Rotation(i);
                accellerations[i].start();
                rotations[i].start();
                cars[i] = car;
                carsUser[i] = false;
                readyUsers[i] = false;
                this.flagGo = false;
                userCheckPoint[i]=-1;
                pos[i] = -1;
                carStyle[i]=0;
                factorOutTrack[i]=1;
                lastDamping[i] = 0.0f;
        }
  }

    @Override
    public float getDamping(int i) throws RemoteException {
        return this.lastDamping[i];
    }



   class Accelleration extends Thread
    {

        public boolean running = false;
        public float par_forza = 0;
        public int numero = 0;

        private Accelleration(int i) {
            numero = i;
        }

        @Override
        public void run()
        {
            while(true){
                try {
                    this.sleep(5);
                } catch (InterruptedException ex) {
                    Logger.getLogger(PhysicsManagerImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
                if(this.running == true){
                    if(flagGo!=false){
                        try {
                            float angolo = PhysicsManagerImpl.this.getRotation(numero);
                            PhysicsManagerImpl.this.cars[numero].body.addForce(new Vector2f((float)Math.sin(angolo)*par_forza,(float)-Math.cos(angolo)*par_forza));
                        }catch (RemoteException ex) {
                            Logger.getLogger(PhysicsManagerImpl.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            }
        }
    }

class Rotation extends Thread
    {

        public boolean rotation = false;
        public int numero = 0;
        public float velocitaRotazione = 0;

        private Rotation(int i) {
            numero = i;
        }

        @Override
        public void run()
        {
            while(true){
                try {
                    this.sleep(5);
                } catch (InterruptedException ex) {
                    Logger.getLogger(PhysicsManagerImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
                if(this.rotation == true){
                    if(flagGo!=false){
                        if(accellerations[numero].running==false){
                            cars[numero].body.setDamping(dampingRotationNotAccelleration * factorOutTrack[numero]);
                        }else{
                            cars[numero].body.setDamping(dampingRotationAccelleration * factorOutTrack[numero]);
                        }
                        float angolo = PhysicsManagerImpl.this.cars[numero].body.getRotation();
                        PhysicsManagerImpl.this.cars[numero].body.setRotation(angolo - velocitaRotazione);
                    }

                }
            }
        }
    }

    class Point{
        float lat;
        float lon;
        public Point(float lat, float lon){
            this.lat=lat;
            this.lon=lon;
        }
    }

}