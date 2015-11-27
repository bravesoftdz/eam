unit formRandTrialIndex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  uEscriba, uCfgSes, StdCtrls, Grids, ImgList, Menus, ExtCtrls, CheckLst;

type
  TfRandTrialIndex = class(TForm)
    btnRand: TButton;
    btnApp: TButton;
    strngrd1: TStringGrid;
    pmRand: TPopupMenu;
    pRand: TMenuItem;
    pSpan: TMenuItem;
    rgConditionalFormat: TRadioGroup;
    clbTrialNames: TCheckListBox;
    pnlFormatColor: TPanel;
    dlgColor1: TColorDialog;
    chkShortNames: TCheckBox;
    chkCellEditing: TCheckBox;
    procedure ConditionalFormatBy_HitAtC1;
    procedure ConditionalFormatBy_ChkName(Sender: TObject; Trial : Integer);
    procedure DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure btnAppClick(Sender: TObject);
    procedure btnRandClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgConditionalFormatClick(Sender: TObject);
    procedure pnlFormatColorDblClick(Sender: TObject);
    procedure strngrd1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure clbTrialNamesClickCheck(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);

  private
    //FString : string;
    //FRect: TRect;
    //FHint : String;
    //FHintWindow: THintWindow;
    FHasSample : Boolean;
    //FPosX : Integer;
    //FPosY : Integer;
    //FOldIndex : array of integer;
    //FNewIndex : array of integer;
    FBlc: integer;
    FEscriba : TEscriba;
    FOnBlcChange: TNotifyEvent;
    FOnTrialChange: TNotifyEvent;
    function SeekForMTSTrial : Boolean;
    function SeekIsMTSTrial(Trial : integer): Boolean;
    procedure CellsEliminator;
    procedure Rand;
    procedure RandOrder;
    procedure FillclbTrialNames;
  public
    procedure CellsGenerator (Blc : Integer);
    property Escriba : TEscriba read FEscriba write FEscriba;
    property OnBlcChange : TNotifyEvent read FOnBlcChange write FOnBlcChange;
    property OnTrialChange : TNotifyEvent read FOnTrialChange write FOnTrialChange;
  end;

var
  fRandTrialIndex: TfRandTrialIndex;

implementation

{$R *.dfm}

{ TForm16 }

procedure TfRandTrialIndex.btnAppClick(Sender: TObject);
var i , k : integer;
    s1 : string;                 //Nome da tentativa na célula da matriz
    aux : TCfgTrial;             //Elemento auxiliar para a evitar perda de informação durante o reordenamento
    RefVet : array of integer;   //Vetores de referência que determina a nova ordem das tentativas
begin
  SetLength(RefVet, FEscriba.Blcs[FBlc].NumTrials);
  for i := 0 to FEscriba.Blcs[FBlc].NumTrials - 1 do
    begin
      s1 := strngrd1.Cells[0, i + 1];
      Delete (s1, Pos('T', s1), 1);
      RefVet[i] := StrToIntDef(s1, 1) - 1;
      FEscriba.Blcs[FBlc].VetCfgTrial[i].Id := i;
    end;

  for i := 0 to (FEscriba.Blcs[FBlc].NumTrials - 2) do
    begin
      if (RefVet[i] <> FEscriba.Blcs[FBlc].VetCfgTrial[i].Id) then
        begin
          for k := (i + 1) to (FEscriba.Blcs[FBlc].NumTrials - 1) do
            begin
              if (RefVet[i] = FEscriba.Blcs[FBlc].VetCfgTrial[k].Id) then
                begin
                  aux := FEscriba.Blcs[FBlc].VetCfgTrial[i];
                  FEscriba.Blcs[FBlc].VetCfgTrial[i] :=  FEscriba.Blcs[FBlc].VetCfgTrial[k];
                  FEscriba.Blcs[FBlc].VetCfgTrial[k] := aux;
                  Break;
                end;
            end;
          //showmessage(IntToStr(RefVet[i]) + ' <> ' + IntToStr(FEscriba.Blcs[FBlc].VetCfgTrial[i].Id) + ' [' +  IntToStr(i) + ']');
        end;
    end;
  for i := 0 to (FEscriba.Blcs[FBlc].NumTrials - 1) do
    begin
      strngrd1.Cells[0, (i + 1)] := 'T' + IntToStr (i + 1);
      //FOldIndex[i] := i + 1;
      //FNewIndex[i] := i + 1;
    end;
end;

procedure TfRandTrialIndex.btnRandClick(Sender: TObject);
begin
  Rand;
end;

procedure TfRandTrialIndex.CellsEliminator;
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

procedure TfRandTrialIndex.CellsGenerator(Blc: Integer);
var i, j, Col: integer;
begin
  FBlc := blc;
  Col := 1;
  if SeekForMTSTrial then
    begin
      FHasSample := True;
      Col := 2;
    end
  else FHasSample := False;
  //SetLength(FOldIndex, FEscriba.Blcs[blc].NumTrials);
  //SetLength(FNewIndex, FEscriba.Blcs[blc].NumTrials);

  strngrd1.ColCount := (FEscriba.NumPos + Col);     //+1 if not MTS // +2 if MTS
  strngrd1.RowCount := (FEscriba.Blcs[blc].NumTrials + 1);
  strngrd1.Cells[0,0] := 'Tent\Stm';
  for j := 0 to (FEscriba.NumPos - 1) do
    begin
      strngrd1.Cells[(j + 1), 0] := 'C' + IntToStr (j + 1);
      if (FHasSample) and
       (j = (FEscriba.NumPos - 1)) then strngrd1.Cells[(j + 2), 0] := 'Modelo';
    end;
  for i := 0 to (FEscriba.Blcs[blc].NumTrials - 1) do
    begin
      strngrd1.Cells[0, (i + 1)] := 'T' + IntToStr (i + 1);
      //strngrd1.Cells[1, (i + 1)] := 'T' + IntToStr (i + 1);
      //FOldIndex[i] := i + 1;
      //FNewIndex[i] := i + 1;
    end;
  for i := 0 to (FEscriba.Blcs[blc].NumTrials - 1) do
    begin
      for j := 0 to FEscriba.NumPos do
        begin
          if chkShortNames.Enabled then
            begin
              if (j + 1) <= FEscriba.CfgBlc[blc].VetCfgTrial[i].NumComp then
              strngrd1.Cells[(j + 1), (i + 1)] := Copy(FEscriba.CfgBlc[blc].VetCfgTrial[i].SList.Values ['C' + IntToStr(j + 1) + 'Stm'],0,2);
              if SeekIsMTSTrial(i) and
              (j = (FEscriba.NumPos - 1)) then
              strngrd1.Cells[(j + 2), (i + 1)] := Copy(FEscriba.CfgBlc[blc].VetCfgTrial[i].SList.Values ['SStm'],0,2);
            end
          else
            begin
              if (j + 1) <= FEscriba.CfgBlc[blc].VetCfgTrial[i].NumComp then
              strngrd1.Cells[(j + 1), (i + 1)] := FEscriba.CfgBlc[blc].VetCfgTrial[i].SList.Values ['C' + IntToStr(j + 1) + 'Stm'];
              if SeekIsMTSTrial(i) and
              (j = (FEscriba.NumPos - 1)) then
              strngrd1.Cells[(j + 2), (i + 1)] := FEscriba.CfgBlc[blc].VetCfgTrial[i].SList.Values ['SStm'];
            end;
        end;
       //c := 0;
    end;
end;

procedure TfRandTrialIndex.clbTrialNamesClickCheck(Sender: TObject);
//var Trial, i : integer;
begin
  strngrd1.Refresh;
  {
  for Trial:= Low(FEscriba.Blcs[FBlc].VetCfgTrial) to High(FEscriba.Blcs[FBlc].VetCfgTrial) do
    for i := 0 to clbTrialNames.Count -1 do
      if clbTrialNames.Checked[i] then
        begin
          if FEscriba.Blcs[FBlc].VetCfgTrial[Trial].Name = clbTrialNames.Items[i] then
          ConditionalFormatBy_ChkName(Sender, Trial);
        end;    }
end;

procedure TfRandTrialIndex.ConditionalFormatBy_ChkName(Sender: TObject; Trial : Integer);
var
 // s1 : string;
  GridDrawState : TGridDrawState;
begin
  GridDrawState := [gdFixed];
  chkCellEditing.Checked := True;
  strngrd1DrawCell(Self, 0, Trial + 1, strngrd1.CellRect(0, Trial + 1), GridDrawState);
  rgConditionalFormat.ItemIndex := -1;
  chkCellEditing.Checked := False;
end;

procedure TfRandTrialIndex.ConditionalFormatBy_HitAtC1;
var
  i : integer;
  GridDrawState : TGridDrawState;
begin
  GridDrawState := [gdFixed];
  chkCellEditing.Checked := True;
    for i := 0 to FEscriba.Blcs[FBlc].NumTrials - 1 do
      begin
        if FEscriba.Blcs[FBlc].VetCfgTrial[i].SList.Values ['C1Res'] = 'HIT' then
          begin
            strngrd1DrawCell(Self, 0, i + 1, strngrd1.CellRect(0, i + 1), GridDrawState);
          end;
      end;
  rgConditionalFormat.ItemIndex := -1;
  chkCellEditing.Checked := False;
end;

procedure TfRandTrialIndex.DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
//var i, j : integer;
begin
 { for i := 0 to (FEscriba.Blcs[FBlc].NumTrials - 1) do
    begin
      for j := 0 to FEscriba.Blcs[FBlc].VetCfgTrial[i].NumComp - 1 do
        begin
          strngrd1.Cells[(j + 1), (i + 1)] := '';
        end;
    end;
  strngrd1.ColCount := 2;
  strngrd1.RowCount := 2;  }
end;

procedure TfRandTrialIndex.FillclbTrialNames;
var
  s: string;
  i: Integer;
begin
  if clbTrialNames.Count < 1 then
  begin
    for i := 0 to (FEscriba.Blcs[FBlc].NumTrials - 1) do
        clbTrialNames.Items.Add(FEscriba.Blcs[FBlc].VetCfgTrial[i].Name);
    s := '';
    i := 0;
    while i < clbTrialNames.Count do
    begin
      if s = clbTrialNames.Items[i] then
      begin
        clbTrialNames.Items.Delete(i);
      end
      else
      begin
        s := clbTrialNames.Items[i];
        Inc(i);
      end;
    end;
  end;
end;

procedure TfRandTrialIndex.FormCreate(Sender: TObject);
begin
  chkCellEditing.Checked := False;
end;

procedure TfRandTrialIndex.FormDestroy(Sender: TObject);
begin
  CellsEliminator;
end;

procedure TfRandTrialIndex.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position:= VertScrollBar.ScrollPos + VertScrollBar.Increment;
end;

procedure TfRandTrialIndex.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position:= VertScrollBar.ScrollPos - VertScrollBar.Increment;
end;

procedure TfRandTrialIndex.pnlFormatColorDblClick(Sender: TObject);     //utilizado para a formatação condicional
begin
  if dlgColor1.execute then
    begin
      pnlFormatColor.Color := dlgColor1.Color;
      pnlFormatColor.Hint := IntToStr (dlgColor1.Color) + ': Duplo clique para modificar a cor';
    end;
end;

procedure TfRandTrialIndex.Rand;
begin
  if pRand.Checked then RandOrder;
  //Preparado para diferentes tipos de randomização
end;

procedure TfRandTrialIndex.RandOrder;
var i, NumTrials, RandLine: integer;
    InCell : string;
    StrArray : array of string;
  procedure SaveLine (Line : integer);
  var j : integer;
  begin
    for j := 0 to strngrd1.ColCount - 1 do
      begin
        InCell := strngrd1.Cells[(j), (Line)];
        StrArray[j] := InCell;
      end;
  end;
  procedure SendToLine (Line : integer);
  var j : integer;
  begin
    for j := 0 to strngrd1.ColCount - 1 do
      begin
        InCell := StrArray[j];
        strngrd1.Cells[(j), (Line)] := InCell;
      end;
  end;
  procedure ChangeLines (New, Old : integer);
  var j : integer;
  begin
    for j := 0 to strngrd1.ColCount - 1 do
      begin
        InCell := strngrd1.Cells[(j), (Old)];
        strngrd1.Cells[(j), (New)] := InCell;
      end;
  end;
begin
  Randomize;
  SetLength(StrArray, strngrd1.ColCount);
  NumTrials := Escriba.Blcs[FBlc].NumTrials;
  for i := 0 to NumTrials - 1 do
    begin
      if NumTrials > 1 then
        begin
          RandLine := Round (Random * (NumTrials - 1));
          //if ArraySize > 2 then
          //  while r = n do r := Round (Random * (ArraySize - 1));
          SaveLine (i + 1);
          ChangeLines (i + 1, RandLine + 1);
          SendToLine (RandLine + 1);
        end
      else;
    end;
end;

procedure TfRandTrialIndex.rgConditionalFormatClick(Sender: TObject);
begin
  case rgConditionalFormat.ItemIndex of
    0: begin
      clbTrialNames.Visible:= True;
      FillclbTrialNames;
    end;

    1:  begin
      clbTrialNames.Visible:= False;
      ConditionalFormatBy_HitAtC1;
    end;

    2:  begin

    end;
  end;
end;

function TfRandTrialIndex.SeekForMTSTrial: Boolean;
var trial : integer; HasMTS : Boolean;
begin
  HasMTS := False;
  for trial := 0 to (Escriba.Blcs[FBlc].NumTrials -1) do
    begin
      if Escriba.Blcs[FBlc].VetCfgTrial[trial].Kind = 'MTS' then HasMTS := True;
    end;
  Result := HasMTS;
end;

function TfRandTrialIndex.SeekIsMTSTrial(Trial: integer): Boolean;
begin
  if Escriba.Blcs[FBlc].VetCfgTrial[Trial].Kind = 'MTS' then Result := True
  else Result := False;
end;

procedure TfRandTrialIndex.strngrd1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var trial, i : integer;
    s1 : string;
    vFormat : TTextFormat;

  procedure PaintPlease(aColor : integer; atype: byte);
  begin
    strngrd1.Canvas.Font.Color := strngrd1.Canvas.Font.Color XOR aColor;
    strngrd1.Canvas.Brush.Color := aColor;
    case aType of
      0 : strngrd1.Canvas.FillRect(Rect);
      1 : strngrd1.Canvas.TextRect(Rect, s1,vFormat);
    end;
    strngrd1.Canvas.FillRect(Rect);
    State := [gdFixed];
  end;
begin
  if chkCellEditing.Checked = True then
    begin
      s1 := strngrd1.Cells[ACol,ARow];
      vFormat := [tfCenter];
      for Trial:= Low(FEscriba.Blcs[FBlc].VetCfgTrial) to High(FEscriba.Blcs[FBlc].VetCfgTrial) do
        for i := 0 to clbTrialNames.Count -1 do
          if clbTrialNames.Checked[i] then
            begin
              if FEscriba.Blcs[FBlc].VetCfgTrial[Trial].Name = clbTrialNames.Items[i] then
                begin
                  if strngrd1.Cells[ACol,ARow] = 'T' + IntToStr(Trial + 1) then
                    begin
                      PaintPlease(pnlFormatColor.Color,1);
                    end;
                end;
            end;
    end;
  if strngrd1.Cells[ACol,ARow] = '' then PaintPlease(clBlack,0);
end;

end.
