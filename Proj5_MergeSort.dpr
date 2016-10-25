program Proj5_MergeSort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  Tarr = array of Integer;
var
  arr: Tarr;
  p,s: Integer;

function MergeSort(var arr: Tarr;p: Integer;s: Integer): Tarr;
var
  tmp,k1,k2,i,q,b: Integer;
  arrl,arrr,res: Tarr;
  a: Byte;
begin
  q:= (s+p) div 2;
  if length(arr) = 2 then
  begin
    if arr[1] < arr[0] then
    begin
      tmp:= arr[0];
      arr[0]:= arr[1];
      arr[1]:= tmp;
    end;
    res:= arr;
  end
  else
   if length(arr) = 1 then
   begin
     res:= arr;
   end
   else
   begin
     arrl:= Copy(arr,p,q);
     arrr:= Copy(arr,q,s);
     arrl:= MergeSort(arrl,0,high(arrl));
     arrr:= MergeSort(arrr,0,high(arrr));
     k1:= 0; k2:= 0; a:= 0; b:= 0;
     for i:=0 to length(arr) do
     begin
       if arrl[k1] < arrr[k2] then
       begin
         arr[i]:= arrl[k1];
         k1:= k1 + 1;
       end
       else
       begin
         arr[i]:= arrr[k2];
         k2:= k2 + 1;
       end;
       if (k1 > length(arrl) - 1) then begin a:= 1; b:= i; break; end;
       if (k2 > length(arrr) - 1) then begin a:= 2; b:= i; break; end;
     end;
     if a <> 0 then
      if a = 1 then
       for i:= k2 to length(arrr)-1 do
       begin
         b:= b + 1;
         arr[b]:= arrr[i];
       end
      else
       if a = 2 then
        for i:= k1 to length(arrl)-1 do
        begin
          b:= b + 1;
          arr[b]:= arrl[i];
        end;
     res:= arr;
   end;
  result:= res;
end;

function Input(): Tarr;
var
  arr: Tarr;
  i,n: Integer;
begin
  randomize;
  Write('Number of elements: ');
  Readln(n);
  Setlength(arr,n);
  for i:= 0 to n-1 do
   arr[i]:= random(200) - 100;
  result:= arr;
end;

procedure Output(arr: Tarr);
var
  i: Integer;
begin
  for i:= 0 to length(arr) - 1 do
   Write(arr[i],' ');
  Writeln;
end;

begin
  arr:= Input();
  Write('Unsorted: ');
  Output(arr);
  Write('  Sorted: ');
  arr:= MergeSort(arr,0,high(arr));
  Output(arr);
  readln;
end.
