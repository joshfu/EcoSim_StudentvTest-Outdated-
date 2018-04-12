public class Predator extends Animal{
  public Predator(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type, float weight, float health, String gender, boolean hasTarget, int preferredType){
      super(x, y, entityWidth, entityHeight, entityColor, opacity, name, type, weight, health, gender, hasTarget, preferredType);
     
      imageMode(CENTER);
    }
    

    
    public void display(){
      fill(this.getColor(), 0);
      ellipse(getX(), getY(), getWidth()-25, getHeight()-25);
      stroke(0,0,0,0);
      
      
      textAlign(CENTER);
      textSize(10);
      fill(255);
      text(getName(), getX(), getY()-5);
      text(getType(), getX(), getY()+10);
  }
}