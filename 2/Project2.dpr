program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  f1:Text;
  n, x, y, i , j, l, ii, jj, flag:Integer;
  a:array[0..1000,0..1000] of Byte;
begin
  Assign(f1,'file1.txt');
  Reset(f1);
  read(f1, x);
  read(f1, y);
  for i:=0 to x-1 do
    for j:=0 to y-1 do
      read(f1, a[i,j]);
  Close(f1);
  l:=0;
  for i:=0 to x-1 do
    for j:=0 to y-1 do
    begin
      if a[i,j] = 1 then
      begin
        Inc(l);
      end
      else
      if (a[i,j] = 0) and (l<>0) then
      begin
        for jj:=j-(l+1) to j do
          for ii:=i-1 to i+l do            
          begin
            if (jj=j-(l+1)) or (jj=j) or (ii=i-1) or (ii=i+l) then
            begin
              if a[ii,jj] = 1 then
                Inc(flag);
            end
            else
            begin
              if a[ii,jj] = 0 then
                Inc(flag);
            end;
          end;
          if flag = 0 then
            Inc(n);
          flag:=0;
          l:=0;
      end;
      end;
  Writeln(n);
  Readln;
end.

