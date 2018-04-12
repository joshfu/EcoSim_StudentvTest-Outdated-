

public class Eagle extends Animal{
    Entity target;
    private boolean hasTarget;
    private int preferredType = 0;
  PImage eag;
  public Eagle(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type, float weight, float health, String gender, boolean hasTarget, int preferredType){
    super(x, y, entityWidth, entityHeight, entityColor, opacity, name, type, weight, health, gender, hasTarget, preferredType);
    eag = loadImage("Eagllle.gif");
    imageMode(CENTER);
  }
  
  //public void move(){
  //  super.move();
  //  if(hasLosClose){
    
  //  }
  //}
    public int getPreferred(){
    return preferredType;
  }
  public boolean hasTarget(){
    return hasTarget;
  }
  
  public Entity getTarget(){
    return target;
  }
  public void setTarget(Entity target){
    this.target = target;
    hasTarget = true;
  }
  
  public void resetTarget(){
    this.hasTarget = false;
  }
  public void move(float x, float y)
  {
    if(hasLOS(x,y)){
      //this.setX(10*((x-getX())/((y-getY())+(x-getX()))));
      //this.setY(10*((y-getY())/((y-getY())+(x-getX()))));
      this.setX((getX()+0.005*(x-getX())));
      this.setY((getY()+0.005*(y-getY())));
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
  public boolean hasLOS(float x, float y)
  {
    if(dist(getX(),getY(),x,y)<500){
      return true;
    }
    //method should determine if animal has Line of Sight
    //to x and y by a distance of dist
    return false;
  }
  
  public void display(){
    fill(this.getColor(), 0);
    ellipse(getX(), getY(), getWidth()-25, getHeight()-25);
    stroke(0,0,0,0);
    image(eag, this.getX(), this.getY(),this.getWidth(),this.getHeight());
    
    textAlign(CENTER);
    textSize(10);
    fill(255);
    text(getName(), getX(), getY()-5);
    text(getType(), getX(), getY()+10);
  }
  
  //public void eat(ArrayList<Cat> list){
  //    for(int i = 0; i < list.size(); i++){
  //      if(hasLOSClose(list.get(i).getX(),list.get(i).getY())){
  //        //System.out.println("EEET");
  //          this.setHealth(getHealth()+list.get(i).getHealth());
  //          list.get(i).setHealth(0);
  //        }
  //      }
  //    }
  
}