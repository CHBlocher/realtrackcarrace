package track;

import java.net.MalformedURLException;
import net.phys2d.raw.Body;
import net.phys2d.raw.Joint;
import java.rmi.Remote;
import java.rmi.RemoteException;


public interface PhysicsManager extends Remote {

    public void create(String name, String map) throws RemoteException, MalformedURLException;

    public String getName() throws RemoteException;

    public String getMapName() throws RemoteException;
    
    public void update() throws RemoteException;
    
    public void add(Body body) throws RemoteException;

    public void addStaticBox(float start_x,float start_y,float end_x,float end_y) throws RemoteException;
    
    public void add(Joint j) throws RemoteException;
    
    public void remove(Body body) throws RemoteException;
    
    public void remove(Joint joint) throws RemoteException;

    public Float getX(int i) throws RemoteException;

    public Float getY(int i) throws RemoteException;

    public Float getWidth(int i) throws RemoteException;

    public Float getHeight(int i) throws RemoteException;

    public void accellera(int i, float par_forza) throws RemoteException;

    public void accelleraStop(int i) throws RemoteException;

    public Float getRotation(int i) throws RemoteException;

    public void setRotation(int i,float velocitaRotazione) throws RemoteException;

    /*
    * Initial rotation angle
    */
    public void setInitialRotation(int i,float angle) throws RemoteException;

    public void setRotationStop(int i) throws RemoteException;

    /*
     *  Insert physic car and set user name in this
    */
    public boolean setCar(String name, int num) throws RemoteException;

    /*
     *  Insert physic car and set user name in this
    */
    public String getUserName(int num) throws RemoteException;

    public boolean getCarState(int num) throws RemoteException;

    public String getOwnerCar(int num) throws RemoteException;

    public void setRunning(boolean value) throws RemoteException;

    public boolean getRunning() throws RemoteException;

    public void setReady(int i) throws RemoteException;

    public int getAllReady() throws RemoteException;

    /*
     *  Stop server game
    */
    public void stopServer() throws Exception;

    /*
     *  Set flag for GO!
    */
    public void setFlagGo(boolean flag) throws RemoteException;

    /*
     *  Set check point
    */
    public void setChekPoint(Integer cp, Integer numCar) throws RemoteException;

    /*
     * Create position
    */
    public Integer[] getPositions() throws RemoteException;

    /*
     *  Return actual poition update
    */
    public int getUpdatePosition() throws RemoteException;

    /*
     *  Ready user array
    */
    public boolean[] getReadyUserArray() throws RemoteException;

    /*
     *   Set car style
    */
    public void setCarStyle(int user, int car) throws RemoteException;

    /*
     *   Get car style
    */
    public int getCarStyle(int user) throws RemoteException;

    /*
     * Add new coordinate point in array list
    */
    public void addAllPoint(float lat, float lon) throws RemoteException;
    public void addSpecialPoint(float lat, float lon) throws RemoteException;
    public void addStreetName(String road) throws RemoteException;

    /*
     * get Latitude
    */
    public float getLat(int indexPoint) throws RemoteException;
    public float getSpecialLat(int indexPoint) throws RemoteException;

    /*
     * get Latitude
    */
    public float getLon(int indexPoint) throws RemoteException;
    public float getSpecialLon(int indexPoint) throws RemoteException;

    public String getStreetName(int indexPoint) throws RemoteException;

    /*
     * get coordinate size
    */
    public int getCoordinateSize() throws RemoteException;
    public int getSpecialCoordinateSize() throws RemoteException;
    public int getStreetNameSize() throws RemoteException;

    /*
     * change damping if not intersect track
    */
    public void changeDamping(float damping, int numCar) throws RemoteException;
    public void brake(float damping, int numCar) throws RemoteException;

    public float getDamping(int i) throws RemoteException;
}
