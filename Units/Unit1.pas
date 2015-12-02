{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit Unit1;

interface

uses
  SysUtils;
var
  jumbled, sequence, rotateS, signs: array of integer;
  square : array of array of integer;
  i, j, k, size, howmany : integer;
  s1 : string;
  a1 : integer;

implementation

  procedure SetArrayLength (aSize : integer);
  begin
    SetLength(signs, aSize);
    SetLength(rotateS, aSize);
    SetLength(jumbled, aSize);
    SetLength(sequence, aSize);
    SetLength(square, aSize, aSize);
  end;

  procedure Shuffle(var array1 : array of integer ; aSize : integer);   //embaralhar lista
  var v, aTemp, aRandom : integer;
  begin
    for v := 0 to aSize - 1 do array1[v] := v + 1;

    for v := 0 to aSize - 1 do
      begin
        aRandom := Round(Random * (aSize - 1));
        aTemp := array1[aRandom];
        array1[aRandom] := array1[v];
        array1[v] := aTemp;
      end;
  end;

  procedure Rotate(var array2 : array of integer; aSize, aTimes : integer);   //primeiro elemento torna-se último, elementos restantes para esquerda n vezes
  var aTemp, v, x : integer;
  begin
    for x := 0 to aTimes - 1 do
      begin
        aTemp := array2[0];
        for v := Low(array2) to High(array2) do array2[v] := array2[v + 1];
        array2[aSize - 1] := aTemp;
      end;
  end;

begin
  try
    Randomize;
    a1:= 0;
    //Readln(Size);
    //Readln(HowMany);
    SetArrayLength(Size);

    while (size <> 0) do
      begin
        shuffle(jumbled, size);                      //gerar lista de referência; aleatória
        shuffle(rotateS, size);                      //gerar lista de rotações; aleatória
        for i := 0 to size - 1 do signs[i] := i + 1; //gerar lista de elementos; ordenada

        for i := 0 to size - 1 do
          begin
            for k := 0 to size - 1 do sequence[k] := jumbled[k]; //gerar lista de trabalho a partir da lista de referência
            rotate(sequence, size, rotateS[i]);                  //mover elementos da lista de trabalho
            for j := 0 to size - 1 do square[j, sequence[j] - 1] := signs[i]; //preencher Latin Square
          end;

        s1 := '';
        for i := 0 to size - 1 do                            //
          for j := 0 to size - 1 do                          //
            s1 := s1 + IntToStr(square[i, j]) + #32;         //
       // WriteLn(s1);                                         //plotar latin square
       // RegData.SaveData(s1 + #13#10);                       //salvar em arquivo

        for i := 0 to size - 1 do
          for j := 0 to size - 1 do square[i, j] := 0;       //zerar valores do quadrado

        //ReadLn;
        Inc(a1);
        if a1 = HowMany then Break;
      end;
      //ReadLn;

  except
    on E: Exception do Writeln(E.ClassName, ': ', E.Message);
  end;
end.
