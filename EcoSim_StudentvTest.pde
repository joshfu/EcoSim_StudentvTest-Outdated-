
public ArrayList<Eagle> birds;
public ArrayList<Cat> cats;
public ArrayList<Lasgna> meats;
public ArrayList<Entity> ecosystem;
public ArrayList<Animal> animals;

public boolean chaseConsume;
public boolean breedConsume;



public int initialMeat=10;
public int initialCat=10;
public int initialBird=3;
public int temp;
public float runningTime;
public float previousTime;
public ArrayList<ArrayList> preferredType;

/******************************************************************************************************************************************************************************************/

public void brredCat(float x,float y){
  Cat tempCat=new Cat(x,y,50,50,#FF4646,255,"Wincent","Swaggarwal ",200,200,"Male",false,1);
  cats.add(tempCat);
  //ecosystem.add(tempCat);
  animals.add(tempCat);
}

public void ccokLasgna(){
  Lasgna tempLas=new Lasgna(random(500),random(500),100,100,#FF4646,255,"Chris","Nesquick ",200);
  meats.add(tempLas);
  //ecosystem.add(tempLas);
}

public void brredEagle(float x,float y) {
  Eagle tempEagle = new Eagle(x,y,25,25,#FF4646,255,"Sebastien","Villalobos ",200,200,null,false, 0);
  birds.add(tempEagle);
  //ecosystem.add(tempEagle);
  animals.add(tempEagle);
}
  
public void setup() {
    //frameRate(60);

    size(1000,500);
    //Create a basic entity at a random location on the canvas
    //ent=new Entity(random(width),random(height),50,50,color(random(255),random(255),random(255)),255,"Default","Animal",200);
    cats=new ArrayList<Cat>();
    birds=new ArrayList<Eagle>();
    animals = new ArrayList<Animal>();
    //ecosystem=new ArrayList<Entity>();

    meats=new ArrayList<Lasgna>();
    
    preferredType = new ArrayList<ArrayList>();
    preferredType.add(cats);
    preferredType.add(meats);

    for(int i=0;i<initialMeat; i++){
      ccokLasgna();
    }

    for(int i=0;i<initialCat; i++){
      brredCat(random(1000),random(500));
    }

    for(int i=0;i<initialBird; i++){
      brredEagle(random(1000),random(500));
    }

    //System.out.println(ent.toString());
}


private void log(String t) {
  System.out.println(t);
}


public void draw() {
          Animal currentAnimal;
          //CCOK LASGNA
          runningTime=millis();
          if(runningTime-previousTime>3500){
            ccokLasgna();
            previousTime=runningTime;
          }
          //END CCOK LASGNA
          //System.out.println(cats.get(3).getHealth());
          background(255);
          fill(0);
          textSize(20);
          text(frameRate,750,250);
          
          //CAT
  
          for(int i=0;i<animals.size();i++){
    
            //CONSUME
            currentAnimal = animals.get(i);
            Entity target = currentAnimal.target;
            int preferredTypeInt = currentAnimal.getPreferred();
            //Entity preferredTypeEntity = animals.get( preferredTypeInt );
            ArrayList<Entity> preferredTypeList = preferredType.get(preferredTypeInt);
            boolean weGud;
            int numPreferredEntities = preferredTypeList.size();
            
            //currentAnimal.blah();
            
            log(numPreferredEntities);
            
            currentAnimal.eat( preferredTypeList );
            
            //END CONSUME
    
            //MEAT 
            
              for(int j=0;j<numPreferredEntities;j++) {
                
                Entity preyInstance = preferredTypeList.get(j);
              
                //TRACKING 
                log("calling hasTarget for "+ currentAnimal.getName());
                weGud = currentAnimal.hasTarget();
                log(weGud?"we gud":"null");
                weGud = currentAnimal.hasTargetBool;
                log(weGud?"we gud2":"null2");
                weGud = target != null;
                log(weGud?"we gud3":"null3");

                //weGud = weGud;
                //System.out.println(weGud?"we gud":"null");
                
                if (weGud) {
                  System.out.println("WEEEEEEEWLAD");
                  if (currentAnimal.hasLOS(target.getX(),target.getY())) {
                    currentAnimal.move(target.getX(),target.getY());
                    //cats.get(i).setType("true");
                  }
                  //if(currentAnimal.hasLOS(birds.get(0).getX(),birds.get(0).getY())){
                  //  currentAnimal.move(-birds.get(0).getX(),-birds.get(0).getY());
                  //}
                  if (preyInstance.die()){
                    // log("CONSUME");
                    preferredTypeList.remove(preyInstance);
                    j--;
                    currentAnimal.resetTarget();
                  }
                  else { preyInstance.display(); }
              }
              else if ( currentAnimal.hasLOS( preyInstance.getX(), preyInstance.getY() )) {
                log("setting target: "+preyInstance.getName());
                currentAnimal.setTarget(preyInstance);
              }
              
            }
              
              
            //END MEAT CODE
            //BREEDING 
            //for(int j=0;j<cats.size();j++){
            //  if(cats.get(i).hasLOS(cats.get(j).getX(),cats.get(j).getY())){
            //    cats.get(i).move(cats.get(j).getX(),cats.get(j).getY());
            //  }
            //  if(cats.get(i).hasLOSClose(cats.get(j).getX(),cats.get(j).getY())&&cats.get(i).canBreed==true){
            //    brredCat(cats.get(j).getX(),cats.get(j).getY());
            //    previousTime=runningTime;
            //    System.out.println("BREEEEED");
            //  }
            //}
    
            //END BREEDING
    
            if(currentAnimal.die()){
              System.out.println("DIE");
              animals.remove(currentAnimal);
              i--;
            }
            else currentAnimal.display();
            for (int k=0;k<cats.size();k++) {
              animals.get(k).eat(preferredType.get(animals.get(k).getPreferred()));
            }
          }
          
          
          /*************************************************************************************************************************************************************/
          
          
          //EAGLE 
          //for(int i=0;i<birds.size();i++){
    
          //  //CONSUME
          //  birds.get(i).eat(preferredType.get(birds.get(i).getPreferred()));
          //  //END CONSUME
    
          //  //MEAT 
          //  for(int j=0;j<cats.size();j++){
          //    //birds.get(i).setTarget(cats.get(j));
              
          //    //TRACKING 
              
          //    if(birds.get(i).hasTarget()){
          //      if(birds.get(i).hasLOS(birds.get(i).target.getX(),birds.get(i).target.getY())){
          //        birds.get(i).move(birds.get(i).target.getX(),birds.get(i).target.getY());
          //        birds.get(i).setType("true");
          //        System.out.println("TYPE SET TRUE");
          //      }
          //      else cats.get(j).display();
          //      birds.get(i).setType("false");
          //      System.out.println("TYPE SET FAlSE");
          //    }
          //    else{
          //      if(birds.get(i).hasLOS(cats.get(j).getX(),cats.get(j).getY()));{
          //        birds.get(i).setTarget(cats.get(j));
          //      }
          //    }
          //  }
            
          //  //END MEAT CODE
            
          //  //BREEDING 
            
          //  for(int j=0;j<birds.size();j++){
          //    if(birds.get(i).hasLOS(birds.get(j).getX(),birds.get(j).getY())&&birds.get(i).getType()=="false"){
          //      birds.get(i).move(birds.get(j).getX(),birds.get(j).getY());
          //    }
          //    if(birds.get(i).hasLOSClose(birds.get(j).getX(),birds.get(j).getY())&&runningTime-previousTime>3500){
          //      brredEagle(birds.get(j).getX(),birds.get(j).getY());
          //      previousTime=runningTime;
          //      System.out.println("BREEEEED");
          //    }
          //  }
    
          //  //END BREEDING
    
          //  if(birds.get(i).die()){
          //    System.out.println("BIRD DIE");
          //    birds.get(i).resetTarget();
          //    birds.remove(birds.get(i));
          //    i--;
          //  }
          //  else{
          //    birds.get(i).display();
          //  }
          //}
  
          ////for(int i=0;i<birds.size();i++){
          ////  birds.get(i).eat(cats);
  
          ////}
      }