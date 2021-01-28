public class MainScreen extends Screen
{
  int ax, ay, aw, ah; // amount placement and size
  int ux, uy, uw, uh; // user placement and size
  int mx, my, mw, mh; // matches placement and size
  
  TextBox bettingAmount;
  
  Button resultButton;
  int Odds;
  Odds odds_A;
  
  TripleButton tp;
  
  public MainScreen(){
    bettingAmount = new TextBox(new PVector(60, 600), new PVector(200, 60), true);
    resultButton = new Button(new PVector(1000, 600), new PVector(200, 60), "Resultat", color(0,200,200),color(0,255,255), color(0));
    ax=1030;  ay=20;  aw=170;  ah=60;
    ux=820;  uy=20;  uw=200;  uh=60;
    mx=50; my = 100; mw=1000; mh=70;
    
    
    tp = new TripleButton(new PVector(800,105), new PVector(200, 50), new String[]{"2","3","5"}, color(0,200,200),color(0,255,255),color(0));
  }
  
  public void update()
  {
    textSize(17);
    textAlign(CENTER, CENTER);
    Match[] match = matchDatabase.GetRoundMatches(currentUser.round+1);
    for(int i=0; i<6; i++){ // matches 
      fill(190, 250, 200);
      rect(50,my+75*i,1000,70);
      fill(0);
      text("Kamp "+(i+1)+": "+match[i].homeTeam+" - "+match[i].awayTeam, mx+mw/8,my+75*i+mh/2);
    }
    fill(190, 250, 200);
    rect(ax, ay, aw, ah);//amount
    fill(0);
    text("Penge: " + currentUser.money + " skejs", ax+aw/2,ay+ah/2);
    
    fill(190, 250, 200);
    rect(ux, uy, uw, uh);//user
    fill(0);
    text("Bruger: "+currentUser.username, ux+uw/2,uy+uh/2);    
    bettingAmount.update();
    resultButton.update();
    textSize(11);
    tp.update();
  }
  
  public void mouseReleased()
  {
    bettingAmount.mouseReleased();
    if (resultButton.tryPress())
    {
      currentScreen = new ResultScreen();
    }
  }
  
  public void keyPressed()
  {
    bettingAmount.keyPressed();
  }
}
