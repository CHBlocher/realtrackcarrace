package car;


import net.phys2d.raw.Body;


public class CarPhys{

        public Float curX = 500.0f;
        public Float curY = 400.0f;
        public Float Width  = 32.0f;
        public Float Height = 57.0f;
        public Body body;
        private String owner;

        public void setOwner(String name){
            owner = name;
        }

        public String getOwner(){
            return owner;
        }


        public CarPhys(Float x, Float y){
            curX = x;
            curY = y;
            
            body = new Body
                (new net.phys2d.raw.shapes.Box(Width,Height), 10);

            body.setPosition(curX, curY);

            body.setUserData(this);
            //body.setRestitution(0.0);
            //body.setFriction(20.0);
            //body.setMaxVelocity(120.0f,120.0f);
            body.setRotDamping(170);
            //__moBody.setRotatable(false);  
        }

}
