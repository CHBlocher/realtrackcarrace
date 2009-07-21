package track;

import java.net.MalformedURLException;
import java.rmi.*;


public class PhysicsManagerClient
{
   public static PhysicsManager getPhysicsManager(String address) throws NotBoundException, MalformedURLException, RemoteException, Exception
   {
      // set the security manager for the client
      System.setSecurityManager(new RMISecurityManager());
      //get the remote object from the registry

          System.out.println("Security Manager loaded");
          String url = "//"+address+":1099/SAMPLE-SERVER";
          PhysicsManager remoteObject = (PhysicsManager)Naming.lookup(url);
          System.out.println("Got remote object");
          //narrow the object down to a specific one
          //System.out.println("Location: " + System.getProperty("LOCATION"));
          // make the invocation

          return remoteObject;


   }
}