

public class Cat extends Animal{
  Entity target;
  private int currentMils;
  private int previousMils;
  private int preferredType;
  
  
  private boolean canBreed;
  private boolean hasTarget;
  PImage cage;
  public Cat(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type, float weight, float health, String gender, boolean hasTarget, int preferredType){
    super(x, y, entityWidth, entityHeight, entityColor, opacity, name, type, weight, health, gender, hasTarget, preferredType);
    cage = loadImage("CageCropped.gif");
    imageMode(CENTER);
    this.preferredType = 1;
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
  public void getBreed(){
    currentMils = millis();
    if(currentMils - previousMils > 3500){
      canBreed = true;
      previousMils = currentMils;
    }
    else canBreed = false;
  }
  
  public void display(){
    fill(this.getColor(), 0);
    ellipse(getX(), getY(), getWidth()-25, getHeight()-25);
    stroke(0,0,0,0);
    image(cage, this.getX(), this.getY(),this.getWidth(),this.getHeight());
    
    textAlign(CENTER);
    textSize(10);
    fill(255);
    text(getName(), getX(), getY()-5);
    text(getType(), getX(), getY()+10);
  }
  //public void eat(ArrayList<Lasgna> list){
  //    for(int i = 0; i < list.size(); i++){
  //      if(hasLOSClose(list.get(i).getX(),list.get(i).getY())){
  //        //System.out.println("EEET");
  //          this.setHealth(getHealth()+list.get(i).getHealth());
  //          list.get(i).setHealth(0);
  //        }
  //      }
  //    }
}