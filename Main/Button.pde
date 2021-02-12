class Button
{
  PVector position;
  PVector dimensions;
  String text;
  
  // farver
  color col;
  color hoverCol;
  color textCol;
  
  public Button(PVector position, PVector dimensions, String text, color col, color hoverCol)
  {
    this.position = position;
    this.dimensions = dimensions;
    this.text = text;
    this.col = col;
    this. hoverCol = hoverCol;
    
    // hvis der ikke skrives en tekstfarve ind, vil den være sort eller hvid, afhængig af om baggrundsfarven er tættere på sort eller hvid
    if ((red(col)+green(col)+blue(col))/3 > 127)
      textCol = color(0);
    else
      textCol = color(255);
  }
  
  public Button(PVector position, PVector dimensions, String text, color col, color hoverCol, color textCol)
  {
    this.position = position;
    this.dimensions = dimensions;
    this.text = text;
    this.col = col;
    this. hoverCol = hoverCol;
  }
  
  public void update()
  {
    // skifter farve når musen er over knappen
    if (mouseX >= position.x && mouseX <= position.x + dimensions.x && 
      mouseY >= position.y && mouseY <= position.y + dimensions.y)
      fill(hoverCol);
    else
      fill(col);
    rect(position.x, position.y, dimensions.x, dimensions.y);
    
    // text på knappen
    fill(textCol);
    textAlign(CENTER, CENTER);
    text(text, position.x+(dimensions.x/2), position.y+(dimensions.y/2));
    
  }
  
  // forsøger at trykke på knappen. Returnerer true hvis musen er inden for knappen
  public boolean tryPress()
  {
    if (mouseX >= position.x && mouseX <= position.x + dimensions.x && 
        mouseY >= position.y && mouseY <= position.y + dimensions.y)
        return true;
        
    return false;
  }
  
}
