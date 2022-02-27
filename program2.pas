uses graphabc;
const max=10;
speed = 10;

var a:array[1..max,1..4] of integer;
active:integer;

procedure picture(x:integer; y:integer);//отображение снаряда
begin
  circle(x,y,10);
  FloodFill(x,y,clBlack);
end;

procedure arr();
var variant:integer;
begin
  variant := 100;
  if active < max then
  begin
    variant := random(100);
    if variant<10 then
      for var i:=1 to max do
        if a[i,1]=0 then
        begin
          a[i,1]:=1;
          a[i,2]:=WindowWidth+10;
          a[i,3]:=random(WindowHeight);
          a[i,4]:=random(speed)+1;
          active:=active+1;
          break;
        end;
  end;
  for var i:=1 to max do
  begin
    if a[i,1]=1 then
    begin
      picture(a[i,2],a[i,3]);
      a[i,2]:=a[i,2]-a[i,4];
      if (a[i,2]<-10) then
      begin
        a[i,1]:=0;
        active:=active-1;
      end;
    end;
  end;
end;

begin
  LockDrawing;
  repeat
    ClearWindow;
    arr();
    sleep(50);
    Redraw;
  until false;
  
end.
