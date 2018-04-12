
public class Lasgna extends Entity{
  PImage meat;
  public Lasgna(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type, float health){
    super(x, y, entityWidth, entityHeight, entityColor, opacity, name, type, health); 
    meat = loadImage("Meat.gif");
    imageMode(CENTER);


}
    
    
    public void display(){
    fill(this.getColor(), 0);
    ellipse(getX(), getY(), getWidth()-25, getHeight()-25);
    stroke(0,0,0,0);
    image(meat, this.getX(), this.getY(),this.getWidth(),this.getHeight());
    
    textAlign(CENTER);
    textSize(10);
    fill(255);
    text(getName(), getX(), getY()-5);
    text(getType(), getX(), getY()+10);
}}