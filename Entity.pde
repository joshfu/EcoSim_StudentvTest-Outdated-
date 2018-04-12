/*
Entity class defines the top level object in EcoSim.

Any attributes or functionality that can be used by
children classes should be implemented here.

*/
public class Entity
{

  //INSTANCE VARIABLES
  //x and y coordinates
  private float x;
  private float y;

  //size parameters
  private float entityWidth;
  private float entityHeight;
  private float health;

  //color and opacity
  private color entityColor;
  private float opacity;

  //Entity name and type
  private String name;
  private String type;


  
  //CONSTRUCTOR
  public Entity(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type, float health)
  {
    this.x = x;
    this.y = y;

    this.entityWidth=entityWidth;
    this.entityHeight = entityHeight;

    this.entityColor = entityColor;
    this.opacity = opacity;

    this.name = name;
    this.type = type; 
    this.health = health;
    
  }
  public boolean die(){
    if(this.health <= 0){
      tint(random(255), random(255), random(255));
      return true;
    }
    return false;
  }
  
  //ACCESSOR METHODS
    public float getHealth(){
    return health;
  }
  
  public float getX() 
  {
    return x;
  }
  public float getY() 
  {
    return y;
  }

  public float getWidth() 
  {
    return entityWidth;
  }
  public float getHeight() 
  {
    return entityHeight;
  }

  public color getColor() 
  {
    return entityColor;
  }
  public float getOpacity() 
  {
    return opacity;
  }

  public String getName() 
  {
    return name;
  }
  
  public String getType()
  {
    return type;
  }

  //SETTER METHODS

  public void setHealth(float health){
  this.health = health;
  }
  
  public void setX(float x) 
  {
    this.x = x;
  }
  public void setY(float y) 
  {
    this.y = y;
  }
  
  public void setWidth(float entityWidth) 
  {
    this.entityWidth = entityWidth;
  }
  public void setHeight(float entityHeight) 
  {
    this.entityHeight = entityHeight;
  }
  
  public void setColor(color entityColor)
  {
    this.entityColor = entityColor;
  }
  public void setName(String name)
  {
    this.name=name;
  }
  public void setType(String type)
  {
    this.type=type;
  }

  //toString
  public String toString()
  {
    
    return name + " is a " + type;
  }
  
  //Basic display
  //Should probably be overriden in children classes
  //to give a unique look to each subclass
  public void display()
  {
    fill(entityColor, opacity);
    ellipse(x, y, entityWidth, entityHeight);
    textAlign(CENTER);
    textSize(10);
    fill(255);
    text(name, x, y-5);
    text(type, x, y+10);
    
    if(dist(mouseX, mouseY, x, y) > 50){
      text(health,x,y);
      textSize(20);
      fill(255);
    }
  }
}