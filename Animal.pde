

public class Animal extends Entity
{
  public Entity target;
  //INSTANCE VARIABLES
  private float weight;
  public String gender;
  protected int previousMillis = millis();
  protected int currentMillis;
  protected int tempTracker;
  private int preferredType;
  public boolean hasTargetBool = false;
  
  //CONSTRUCTOR 
  public Animal(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type, float weight, float health, String gender, boolean hasTarget, int preferredType)
  {
    super(x, y, entityWidth, entityHeight, entityColor, opacity, name, type, health);
    this.preferredType = preferredType;
    this.weight = weight;
    this.gender = gender;
    this.setX(random(0,500));
    this.setY(random(0,500));
    int rand = (int)random(0,2);
      if (rand==0)
      gender="Male";
      else
      gender="Female";
    
    
  }
  
  ArrayList<Entity> collidable = new ArrayList<Entity>();
  
  public int getPreferred() {
    return preferredType;
  }
  
  private void log(String t) { System.out.println(t); }
  
  public void blah(){
  log("blaaah");
  }
  
  //ACCESSOR METHODS
  public void resetTarget() {
    setTarget(null);
  }
  public boolean hasTarget(){ 
    blah();
    log("hasTarget() called in Animal class");
    log(hasTargetBool? target.getName():"no target");
    return hasTargetBool;
  }
  
  //public Entity getTarget(){
  //  return target;
  //}
  public void setTarget(Entity _target){
    
    target = _target;
    hasTargetBool = target != null;
    if(hasTargetBool){
      log("setTarget: "+target.getName());
    }
    else log("Set to null");
  }
  
  
  public int getTemp(){
    return tempTracker;
  }
  public float getWeight()
  {
    return weight;
  }
  public String getGender()
  {
    return gender;
  }

  //SETTER METHODS
  public void setTemp(int temp){
    this.tempTracker = temp;
  }
  public void setWeight(int weight)
  {
    this.weight=weight;
  }
  
  //FUNCTIONAL METHODS
  public void move(float x, float y)
  {
    if(hasLOS(x,y)){
      //this.setX(10*((x-getX())/((y-getY())+(x-getX()))));
      //this.setY(10*((y-getY())/((y-getY())+(x-getX()))));
      this.setX((getX()+0.001*(x-getX())));
      this.setY((getY()+0.001*(y-getY())));
      //System.out.println("TRACK");
    }
    
    
    this.setX(getX()-random(0,1));
    
    this.setX(getX()+random(0,1));
    
    this.setY(getY()+random(0,1));
    
    this.setY(getY()-random(0,1));
    
    currentMillis = millis();
    if(currentMillis-previousMillis>5){
      this.setHealth(getHealth()-random(0.5,1)); 
      previousMillis = millis();
    }
    
    //method should move the animal
    //in a random direction on the X/Y plane
  }

  //public void eat(float amount)
  //{
  //  setWeight((int)(getWeight()+amount));
  //  //method should add to weight
  //}
  
    public void eat(ArrayList<Entity> list){
      for(int i = 0; i < list.size(); i++){
        if(hasLOSClose(list.get(i).getX(),list.get(i).getY())){
          //System.out.println("EEET");
            this.setHealth(getHealth()+list.get(i).getHealth());
            list.get(i).setHealth(0);
          }
        }
      }
  
  public boolean hasLOS(float x, float y)
  {
    if(dist(getX(),getY(),x,y)<300){
      return true;
    }
    //method should determine if animal has Line of Sight
    //to x and y by a distance of dist
    return false;
  }
  
  public boolean hasLOSClose(float x, float y)
  {
    if(dist(getX(),getY(),x,y)<55){
      //System.out.println("HASLOS");
      return true;
      
    }
    //method should determine if animal has Line of Sight
    //to x and y by a distance of dist
    return false;
  //}
  //  public boolean collide(ArrayList <Entity> list){
    
  //        for(int j = 0; j<list.size(); j++){
  //            if(dist(this.getX(),this.getY(),list.get(j).getX(),list.get(j).getY())<200){
  //            System.out.println("COLLIDE");
  //            return true;
  //            }
              
              
  //        }
    
  //  return false;
  //}
  
    
 
  

}
}