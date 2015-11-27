unit formRandPosition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, ExtCtrls, uEscriba, Menus, StdCtrls, Grids, Vcl.Themes;

type

  TCStringGrid = class(Grids.TStringGrid)
  private
    FHideFocusRect: Boolean;
  protected
    //procedure DrawCell(ACol, ARow: Longint; ARect: TRect;AState: TGridDrawState); override;
    procedure Paint;override;
  public
    constructor Create(AOwner: TComponent); override;
    property HideFocusRect:Boolean Read FHideFocusRect Write FHideFocusRect;
  end;

  TfRandPosition = class(TForm)
    btnApp: TButton;
    pmApp: TPopupMenu;
    pmRand: TPopupMenu;
    N1: TMenuItem;
    btnImport: TButton;
    appBlocoUnd: TMenuItem;
    N2: TMenuItem;
    seGap: TSpinEdit;
    btnExport: TButton;
    lbl2: TLabel;
    lbl3: TLabel;
    seSeqToWrite: TSpinEdit;
    btnRand: TButton;
    pSpan: TMenuItem;
    chkAllDifferent: TCheckBox;
    pRand: TMenuItem;
    seBeginAt: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    seEndAt: TSpinEdit;
    lbLine: TLabel;
    pBalanced: TMenuItem;
    pnlNumPos: TPanel;
    lblNumPos: TLabel;
    lblTrial: TLabel;
    procedure strngrd1KeyPress(Sender: TObject; var Key: Char);
    procedure strngrd1SetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
    procedure strngrd1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure strngrd1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure btnRandClick(Sender: TObject);
    procedure pmRandPopup(Sender: TObject);
    procedure seGapChange(Sender: TObject);
    procedure chkAllDifferentClick(Sender: TObject);
    procedure btnAppClick(Sender: TObject);
    procedure pRandClick(Sender: TObject);
    procedure seGapKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    strngrd1 : TCStringGrid;
    FHasSample : Boolean;
    FBlackList : TStringList;
    FWhiteList : TStringList;
    FPosX : Integer;
    FPosY : Integer;
    FPosArray : TStringList;
    FLatinSquare : array of array of integer;
    FBlc: integer;
    //FSpin : TSpinEdit;
    FEscriba : TEscriba;
    FOnBlcChange: TNotifyEvent;
    FOnTrialChange: TNotifyEvent;
    function SeekForMTSTrial : Boolean;
    function SeekIsMTSTrial(Trial : integer): Boolean;
    procedure CellsEliminator;
    procedure PutOnGrid (Trial, NRand, Adj : integer; var aSquareLine : integer);
    procedure Rand;
    procedure RandLatinSquareBalanced;
    procedure RandSequence;
    procedure RandWhiteBlackTable;
    procedure SetSpin;
    procedure SetPositionsOnChessTable;
  public
    procedure CellsGenerator (Blc : Integer);
    property Escriba : TEscriba read FEscriba write FEscriba;
    property OnBlcChange : TNotifyEvent read FOnBlcChange write FOnBlcChange;
    property OnTrialChange : TNotifyEvent read FOnTrialChange write FOnTrialChange;
  end;

var
  fRandPosition: TfRandPosition;

implementation

{$R *.dfm}

{ TForm14 }

procedure TfRandPosition.btnAppClick(Sender: TObject);
var trial, c : integer;
begin
  for trial := 0 to (Escriba.CfgBlc[FBlc].NumTrials -1) do
    begin
      for c := 0 to Escriba.NumPos - 1 do
        begin
          if (c + 1) <= FEscriba.CfgBlc[FBlc].VetCfgTrial[trial].NumComp then
          Escriba.Blcs[FBlc].VetCfgTrial[trial].SList.Values['C' + IntToStr (c + 1) + 'Bnd'] := strngrd1.Cells[(c + 1), (trial + 1)];
          if SeekIsMTSTrial(trial) and
          (c = (Escriba.NumPos - 1)) then
          FEscriba.CfgBlc[Fblc].VetCfgTrial[trial].SList.Values ['SBnd'] := strngrd1.Cells[(c + 2), (trial + 1)];
        end;
    end;
    strngrd1.Repaint;
end;

procedure TfRandPosition.btnRandClick(Sender: TObject);
var NRand, i, seq, SquareLine: integer;
begin
  SquareLine := 0;
  i:= seBeginAt.Value - 1;
  while (i < strngrd1.RowCount -1) and (i <= seEndAt.Value - 1) do
    begin
      NRand := Round (random * 1);
      if not chkAllDifferent.Checked then Rand;
      for seq := 0 to seSeqToWrite.Value -1 do
        begin
          if chkAllDifferent.Checked then Rand;
          PutOnGrid (i + 1, NRand, seq, SquareLine);
          Inc (i);
        end;
      Inc(i, seGap.Value);
    end;
    strngrd1.Repaint;
end;

procedure TfRandPosition.CellsEliminator;
var i, j : integer;
begin
  for i := 0 to (FEscriba.Blcs[FBlc].NumTrials - 1) do
    begin
      for j := 0 to FEscriba.Blcs[FBlc].VetCfgTrial[i].NumComp - 1 do
        begin
          strngrd1.Cells[(j + 1), (i + 1)] := '';
        end;
    end;
  strngrd1.ColCount := 2;
  strngrd1.RowCount := 2;
end;

procedure TfRandPosition.CellsGenerator(Blc : Integer);
var i, j, Col: integer;
  procedure CreateLists;
  begin
    FPosArray := TStringList.Create;
    FPosArray.Sorted:= False;
    FPosArray.Duplicates := dupIgnore;
    FBlackList := TStringList.Create;
    FBlackList.Sorted:= False;
    FBlackList.Duplicates := dupIgnore;
    FWhiteList := TStringList.Create;
    FWhiteList.Sorted:= False;
    FWhiteList.Duplicates := dupIgnore;
  end;
begin
  //c:= 0;
  pnlNumPos.Caption := IntToStr(Escriba.NumPos);

  FBlc := blc;
  SetSpin;
  Col := 1;
  if SeekForMTSTrial then
    begin
      FHasSample := True;
      Col := 2;
    end;

  CreateLists;
  SetPositionsOnChessTable;

  strngrd1.ColCount := (FEscriba.NumPos + Col);     //+1 if not MTS // +2 if MTS
  strngrd1.RowCount := (FEscriba.Blcs[blc].NumTrials + 1);
  strngrd1.Cells[0,0] := 'Tent\Stm';
  for j := 0 to (FEscriba.NumPos - 1) do
    begin
      strngrd1.Cells[(j + 1), 0] := 'C' + IntToStr (j + 1);
      FPosArray.Add (IntToStr(j + 1));
      if (FHasSample) and
       (j = (FEscriba.NumPos - 1)) then strngrd1.Cells[(j + 2), 0] := 'Modelo';
    end;
  for i := 0 to (FEscriba.Blcs[blc].NumTrials - 1) do
    begin
      strngrd1.Cells[0, (i + 1)] := 'T' + IntToStr (i + 1);
      strngrd1.Cells[1, (i + 1)] := 'T' + IntToStr (i + 1);
    end;
  for i := 0 to (FEscriba.Blcs[blc].NumTrials - 1) do
    begin
      for j := 0 to FEscriba.NumPos - 1 do
        begin
          //Inc (c);
          if (j + 1) <= FEscriba.CfgBlc[blc].VetCfgTrial[i].NumComp then
          strngrd1.Cells[(j + 1), (i + 1)] := FEscriba.CfgBlc[blc].VetCfgTrial[i].SList.Values ['C' + IntToStr(j + 1) + 'Bnd'];
          if SeekIsMTSTrial(i) and
          (j = (FEscriba.NumPos - 1)) then
          strngrd1.Cells[(j + 2), (i + 1)] := FEscriba.CfgBlc[blc].VetCfgTrial[i].SList.Values ['SBnd'];
        end;
       //c := 0;
    end;
    strngrd1.Repaint;
end;

procedure TfRandPosition.chkAllDifferentClick(Sender: TObject);
begin
  if chkAllDifferent.Checked then chkAllDifferent.Hint := 'Desmarque se quiser n sequências iguais ao aleatorizar.'
  else chkAllDifferent.Hint := 'Marque se quiser n sequências diferentes ao aleatorizar.'
end;


procedure TfRandPosition.FormCreate(Sender: TObject);
begin
  strngrd1 := TCStringGrid.Create(Self);
  with strngrd1 do
    begin
      OnDrawCell := strngrd1DrawCell;
      OnSetEditText := strngrd1SetEditText;
      OnSelectCell := strngrd1SelectCell;
      OnKeyPress := strngrd1KeyPress;
      Parent := Self;
    end;
end;

procedure TfRandPosition.FormDestroy(Sender: TObject);
begin
  FPosArray.Free;
  FBlackList.Free;
  FWhiteList.Free;
  CellsEliminator;
end;

procedure TfRandPosition.pmRandPopup(Sender: TObject);
begin
  FPosX := TPopUpMenu(Sender).PopupPoint.X;
  FPosY := TPopUpMenu(Sender).PopupPoint.Y;
end;

procedure TfRandPosition.pRandClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := True;
  if TMenuItem(Sender).Name = pSpan.Name then
  else pSpan.Checked := False;

  if TMenuItem(Sender).Name = pRand.Name then
  else pRand.Checked := False;

  if TMenuItem(Sender).Name = pBalanced.Name then
    seSeqToWrite.Value := Escriba.NumPos

  else pBalanced.Checked := False;
  pmRand.Popup(FPosX, FPosY);
end;

procedure TfRandPosition.PutOnGrid(Trial, NRand, Adj : integer; var aSquareLine : integer);
var r, n, i, j, c1, c2, NumComp: integer;
  aux1 : string;
begin
  if Trial <= FEscriba.Blcs[FBlc].NumTrials then
    begin
      i := Escriba.Row;
      j := Escriba.Col;
      NumComp := FEscriba.Blcs[FBlc].VetCfgTrial[Trial - 1].NumComp;
      if pSpan.Checked then
        begin
          if (i > 1) and (j > 1) then
            begin
              for n := 0 to (NumComp - 1) do
                begin
                  if ((i mod 2 = 1) and (j mod 2 = 1)) then //white less than black
                    begin
                      c1 := 0;
                      c2 := 0;
                      while c1 < (NumComp div 2) do
                        begin
                          strngrd1.Cells[c1 + 1, Trial] := FWhiteList.Strings[c1];
                          Inc(c1);
                        end;
                      while c1 < (NumComp) do
                        begin
                          strngrd1.Cells[c1 + 1, Trial] := FBlackList.Strings[c2];
                          Inc(c1);
                          Inc(c2);
                        end;
                    end;
                  if ((i mod 2 = 0) and (j mod 2 = 1)) or
                     ((j mod 2 = 0) and (i mod 2 = 1)) then //white equals black
                    begin
                      c1 := 0;
                      c2 := 0;
                      if (NRand mod 2 = 0) then
                        begin
                          while c1 < (NumComp div 2) do
                            begin
                              strngrd1.Cells[c1 + 1, Trial] := FWhiteList.Strings[c1];
                              Inc(c1);
                            end;
                          while c1 < (NumComp) do
                            begin
                              strngrd1.Cells[c1 + 1, Trial] := FBlackList.Strings[c2];
                              Inc(c1);
                              Inc(c2);
                            end;
                        end
                      else
                        begin
                          while c1 < (NumComp div 2) do
                            begin
                              strngrd1.Cells[c1 + 1, Trial] := FBlackList.Strings[c1];
                              Inc(c1);
                            end;
                          while c1 < (NumComp) do
                            begin
                              strngrd1.Cells[c1 + 1, Trial] := FWhiteList.Strings[c2];
                              Inc(c1);
                              Inc(c2);
                            end;
                        end;
                    end;
                end;
              if adj > 0 then
                begin
                  aux1 := strngrd1.Cells[1, Trial -1];
                  strngrd1.Cells[1, Trial -1] := strngrd1.Cells[adj + 1, Trial - 1];
                  strngrd1.Cells[adj + 1, Trial - 1] := aux1;
                end;
            end;
        end;
      if pRand.Checked then
        begin
          c1 := 0;
          for n := 0 to NumComp - 1 do
            begin
              strngrd1.Cells[n + 1, Trial] := FPosArray.Strings[c1];
              Inc(c1);
              if (n = (NumComp - 1)) and
                 (SeekIsMTSTrial(Trial -1)) then
                  begin
                    if FPosArray.Count > 1 then
                      begin
                        r := Round (Random * (FPosArray.Count - 1));
                        strngrd1.Cells[Escriba.NumPos + 1, Trial] := FPosArray[r];
                      end
                    else strngrd1.Cells[Escriba.NumPos + 1, Trial] := '1';
                  end;
            end;
        end;
      if pBalanced.Checked then
        begin
          for n := 0 to NumComp - 1 do
            begin
              strngrd1.Cells[n + 1, Trial] := IntToStr(FLatinSquare[n, aSquareLine]);
              if (n = (NumComp - 1)) and
                 (SeekIsMTSTrial(Trial -1)) then
                  begin
                    if FPosArray.Count > 1 then
                      begin
                        r := FLatinSquare[Escriba.NumPos - 1, aSquareLine];
                        strngrd1.Cells[Escriba.NumPos + 1, Trial] := IntToStr(r);
                      end
                    else strngrd1.Cells[Escriba.NumPos + 1, Trial] := '1';
                  end;
            end;
          if aSquareLine = (Escriba.NumPos - 1) then
            aSquareLine := 0
          else Inc (aSquareLine);
        end;
    end;
end;

procedure TfRandPosition.Rand;
begin
  Randomize;
  if pRand.Checked then RandSequence;
  if pSpan.Checked then RandWhiteBlackTable;
  if pBalanced.Checked then RandLatinSquareBalanced;
end;

procedure TfRandPosition.RandLatinSquareBalanced;
var   jumbled, sequence, rotateS, signs: array of integer;
      i, j, k, size : integer;
//      s1 : string;
//      a1 : integer;

  procedure SetArrayLength (aSize : integer);
  begin
    SetLength(signs, aSize);
    SetLength(rotateS, aSize);
    SetLength(jumbled, aSize);
    SetLength(sequence, aSize);
    SetLength(FLatinSquare, aSize, aSize);
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
  //how many?: 1 for each NumPos cicle on seSeqToWrite.
  Size := Escriba.NumPos;
  SetArrayLength(Size);

  shuffle(jumbled, size);                      //gerar lista de referência; aleatória
  shuffle(rotateS, size);                      //gerar lista de rotações; aleatória
  for i := 0 to size - 1 do signs[i] := i + 1; //gerar lista de elementos; ordenada

  for i := 0 to size - 1 do
    begin
      for k := 0 to size - 1 do sequence[k] := jumbled[k]; //gerar lista de trabalho a partir da lista de referência
      rotate(sequence, size, rotateS[i]);                  //mover elementos da lista de trabalho
      for j := 0 to size - 1 do FLatinSquare[j, sequence[j] - 1] := signs[i]; //preencher Latin Square
    end;
end;


procedure TfRandPosition.RandSequence;
var r, n, ArraySize : integer;
aux : string;
begin
  ArraySize := FPosArray.Count;
  for n := 0 to ArraySize - 1 do
    begin
      if ArraySize > 1 then
        begin
          r := Round (Random * (ArraySize - 1));
          //if ArraySize > 2 then
          //  while r = n do r := Round (Random * (ArraySize - 1));
          aux := FPosArray.Strings [n];
          FPosArray.Strings [n]:= FPosArray.Strings [r];
          FPosArray.Strings [r] := aux;
        end
      else;
    end;
end;

procedure TfRandPosition.RandWhiteBlackTable;
  var r, n : integer;
  aux : string;
begin
  if (Escriba.Col > 1) and (Escriba.Row > 1) then
    begin
      for n := 0 to FBlackList.Count -1 do
        begin
          r := Round (Random * (FBlackList.Count -1));
          while r = n do r := Round (Random * (FBlackList.Count -1));
          aux := FBlackList.Strings [n];
          FBlackList.Strings [n]:= FBlackList.Strings [r];
          FBlackList.Strings [r] := aux;
        end;
      for n := 0 to FWhiteList.Count -1 do
        begin
          r := Round (Random * (FWhiteList.Count -1));
          while r = n do r := Round (Random * (FWhiteList.Count -1));
          aux := FWhiteList.Strings [n];
          FWhiteList.Strings [n]:= FWhiteList.Strings [r];
          FWhiteList.Strings [r] := aux;
        end;
    end;
end;

function TfRandPosition.SeekForMTSTrial: Boolean;
var trial : integer; HasMTS : Boolean;
begin
  HasMTS := False;
  for trial := 0 to (Escriba.Blcs[FBlc].NumTrials -1) do
    begin
      if Escriba.Blcs[FBlc].VetCfgTrial[trial].Kind = 'MTS' then
        begin
          HasMTS := True;
          Break;
        end;
    end;
  Result := HasMTS;
end;

function TfRandPosition.SeekIsMTSTrial(Trial: integer): Boolean;
begin
  if Escriba.Blcs[FBlc].VetCfgTrial[Trial].Kind = 'MTS' then Result := True
  else Result := False;
end;

procedure TfRandPosition.seGapChange(Sender: TObject);
begin
  if seGap.Value = 1 then lbLine.Caption := 'linha.' else lbLine.Caption := 'linhas.';
end;

procedure TfRandPosition.seGapKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet (Key, ['0'..'9', #8, #9]) then Key := #0;
end;

procedure TfRandPosition.SetPositionsOnChessTable;
var Matriz : array of array of integer;
    n, i, j : integer;
begin
      FBlackList.Clear;
      FWhiteList.Clear;
      SetLength(Matriz,Escriba.Row, Escriba.Col);
      n := 0;
      for i := 0 to Escriba.Row - 1 do
        for j := 0 to Escriba.Col - 1 do
          begin
            Inc(n);
            Matriz[i,j] := n;
          end;
      for i := 0 to Escriba.Row - 1 do
        begin
          if (i mod 2 = 0) then j := 0 else j := 1;  //if Odd(i) then j := 1 else j := 0;
          while j < Escriba.Col do
            begin
              FBlackList.Add(IntToStr(Matriz[i,j]));
              Inc(j, 2);
            end;
        end;
      for i := 0 to Escriba.Row - 1 do
        begin
          if (i mod 2 = 0) then j := 1 else j := 0;
            while j < Escriba.Col do
              begin
                FWhiteList.Add(IntToStr(Matriz[i,j]));
                Inc(j, 2);
              end;
        end;
end;

procedure TfRandPosition.SetSpin;
begin
  seSeqToWrite.MaxValue := FEscriba.Blcs[FBlc].NumTrials;
  seSeqToWrite.MinValue := 1;
  if seSeqToWrite.MaxValue = seSeqToWrite.MinValue then seSeqToWrite.Increment := 0
  else seSeqToWrite.Increment := 1;
  seSeqToWrite.Value := 1;

  seGap.MaxValue := FEscriba.Blcs[FBlc].NumTrials - 1;
  seGap.MinValue := 0;
  if seGap.MaxValue = seGap.MinValue then seGap.Increment := 0
  else seGap.Increment := 1;
  seGap.Value := 0;

  seBeginAt.MaxValue := FEscriba.Blcs[FBlc].NumTrials;
  seBeginAt.MinValue := 1;
  if seBeginAt.MaxValue = seBeginAt.MinValue then seBeginAt.Increment := 0
  else seBeginAt.Increment := 1;
  seBeginAt.Value := 1;

  seEndAt.MaxValue := FEscriba.Blcs[FBlc].NumTrials;
  seEndAt.MinValue := 1;
  if seEndAt.MaxValue = seEndAt.MinValue then seEndAt.Increment := 0
  else seEndAt.Increment := 1;
  seEndAt.Value := FEscriba.Blcs[FBlc].NumTrials;
end;

procedure TfRandPosition.strngrd1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var j : Integer;
  procedure PaintBlack;
  var aRect : TRect;
  begin
    aRect := Rect;
    with TStringGrid(Sender) do
    begin
      Canvas.Brush.Color := clBlack;
      Canvas.FillRect(Rect);
      Canvas.Font.Color := clWhite;
      InflateRect(aRect, -2, -2);
      DrawText(Canvas.Handle, 'NA', Length('NA'), aRect, DT_CENTER);
    end;
    State := [gdFixed];
  end;

  procedure PaintFocus;
  var     aRect : TRect;
  begin
    aRect := Rect;
    with TStringGrid(Sender) do
    begin
      Canvas.Brush.Color := clRed;
      Canvas.FillRect(Rect);
      Canvas.Font.Color := clBlack;
      InflateRect(aRect, -2, -2);
      DrawText(Canvas.Handle, Cells[ACol,ARow], Length(Cells[ACol,ARow]), aRect, DT_CENTER);
    end;
  end;

  procedure PaintNormal;
  var     aRect : TRect;
  begin
    aRect := Rect;
    with TStringGrid(Sender) do
    begin
      Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.Font.Color := clBlack;
      InflateRect(aRect, -2, -2);
      DrawText(Canvas.Handle, Cells[ACol,ARow], Length(Cells[ACol,ARow]), aRect, DT_LEFT);
    end;
  end;

  procedure PaintFixed;
  var     aRect : TRect;
  begin
    aRect := Rect;
    with TStringGrid(Sender) do
    begin
      Canvas.Brush.Color := FixedColor;
      Canvas.FillRect(Rect);
      Canvas.Font.Color := clBlack;
      InflateRect(aRect, -2, -2);
      DrawText(Canvas.Handle, Cells[ACol,ARow], Length(Cells[ACol,ARow]), aRect, DT_CENTER);
    end;
  end;
begin
  with TStringGrid(Sender) do
    if Cells[ACol,ARow] = '' then PaintBlack
    else
      begin
        if gdFixed in State then PaintFixed
        else PaintNormal;

        for j := 1 to ColCount - 1 do
          begin
            //ShowMessage(Cells[ACol,ARow] + ' ' + Cells[j,ARow]);
            if not (ACol = j) then
              if (Cells[ACol,ARow] = Cells[j,ARow]) then PaintFocus;
          end;
      end;
end;

procedure TfRandPosition.strngrd1KeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet (Key, ['0'..'9', #8, #9]) then Key := #0;
  strngrd1.Repaint;
end;

procedure TfRandPosition.strngrd1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  with TStringGrid(Sender) do
    if Cells[ACol,ARow] = '' then CanSelect := False;
  strngrd1.Repaint;
end;

procedure TfRandPosition.strngrd1SetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
//var i : integer;
begin
  with TStringGrid(Sender) do
    begin
      if (value <> '')
        and (FPosArray.IndexOf(value) = -1) then Cells [ACol, ARow] := '1';
      Repaint;
    end;
end;

{ TStringgrid }

constructor TCStringGrid.Create(AOwner: TComponent);
begin
  inherited;
    Anchors:= [akTop, akRight, akLeft, akBottom];
    BorderStyle := bsNone;
    DefaultDrawing := False;
    FixedCols := 1;
    FixedRows := 1;
    Height := 131;
    HideFocusRect:= True;
    Left := 8;
    Options:= [goEditing, goFixedHorzLine,goHorzLine, goFixedVertLine,goVertLine, goAlwaysShowEditor];
    TabOrder := 2;
    Top:= 70;
    Width:= 791;
end;

procedure TCStringGrid.Paint;
var
 L_Rect:Trect;
begin
  inherited;
   if HideFocusRect then
      begin
        L_Rect := CellRect(Col,Row);
        if DrawingStyle = gdsThemed then InflateRect(L_Rect,-1,-1);
        DrawFocusrect(Canvas.Handle,L_Rect)
      end;
end;

end.
