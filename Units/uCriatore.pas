unit uCriatore;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Math, Forms, Dialogs, uCfgSes;

type


  TPointer = class (TObject)
    public
    FPIndex : ShortInt;
    FP : array [0..1] of TPoint;
    FCapturing : Boolean;
    FFocused : Boolean;
    FMouseDownSpot : TPoint;
  end;

  TDrawCoordenates = class(TObject)
    strict private
        FPointer : TPointer;
        FResolution : TPointer;
        FPanel      : TPanel;
        FDistribuir : Boolean;
        fH          : Integer; // Altura do Monitor
        fW          : Integer; // Comprimento do Monitor
        Distx       : Integer; // Distância horizontal;
        Disty       : Integer; // Distância vertical entre estímulos;
        sH          : Integer; // Altura do S
        sW          : Integer; // Comprimento do S
        ni          : Integer; // n Linhas
        nj          : Integer; // n Colunas
        Yk          : Integer; // Coordenada Left
        Xv          : Integer; // Coordenada Top
    protected
        FOnDraw : TNotifyEvent;
        FOnChange : TNotifyEvent;
        FString     : TStringList;
    strict protected
        procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
        procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure DblClick(Sender: TObject);
        procedure SetPanelSizePosition (X, Y, W, H : Integer);
        procedure SetPanelFeatures (Count : Integer);
    public
        destructor Destroy; override;
        procedure ClearAll;
        procedure SetVariables (SDistx, SDisty, SsW, SsH, Sni, Snj, SLeft, STop: string);
        procedure DrawStmFromCoordenates;
        property Distribuido : Boolean read FDistribuir write FDistribuir;
        property Items : TStringList read FString write FString;
        property OnDraw : TNotifyEvent read FOnDraw write FOnDraw;
        property OnChange : TNotifyEvent read FOnChange write FOnChange;
  end;

  TPositions = array of TCoordenates;

  TAleatorizator  = class (TDrawCoordenates)
    strict private
        FPositions : TPositions;
        procedure GetPositionsFromForm (Sender: TObject);
        procedure GetCoordenatesFromForm (Sender: TObject);
        procedure DrawPositionsToForm (ArraySize : Integer);
    public
        constructor Create;
        destructor Destroy; override;
        //procedure SetWriter (Escritor : TEscriba);
        function GetPositions : TPositions;
        procedure SendTrialToWriter;
        procedure RandomizePositions (CanDraw : Boolean);
  end;

implementation

uses formBackGround, formPositionGetter;

procedure TDrawCoordenates.ClearAll;
var k : Integer;
begin
  K := 0;
  with  fBackGround do
    while ComponentCount > 0 do
      if Components[k] is TPanel then TPanel(Components[k]).Free;
end;

procedure TDrawCoordenates.DrawStmFromCoordenates;

var v, k, p : integer;
begin
  begin
    p   := 0;
    if FDistribuir then
      begin
        for v  := 1 to ni do
          begin
            Xv := (Disty * v) - Round (sH / 2);
            for  k   := 1 to nj do
              begin
                Yk  := (Distx * k) - Round (sW / 2);
                Inc (p);
                SetPanelFeatures (p);
                SetPanelSizePosition (Xv, Yk, sW, sH);
              end;
          end;
      end
    else
      begin
        for v  := 0 to ni - 1 do
          begin
            Xv :=  ((sH + Disty) * v) +
              Round (fH / 2) -
              Round (((sH + Disty) * ni) / 2) +
              Round ((Disty) / 2);
            for  k   := 0 to nj - 1 do
              begin
                Yk  := ((sW + Distx) * k) +
                  Round (fW / 2) -
                  Round (((sW + Distx) * nj) / 2) +
                  Round ((Distx) / 2);
                Inc(p);
                SetPanelFeatures (p);
                SetPanelSizePosition (Xv, Yk, sW, sH);
              end;
          end;

      end;
    if Assigned (OnDraw) then FOnDraw (Self);
  end;
end;

procedure TDrawCoordenates.SetPanelFeatures(Count: Integer);
begin
  FPanel := TPanel.Create(fBackGround);
  FPanel.Visible := False;
  FPanel.Parent := fBackGround;
  FPanel.ParentBackground := False;
  FPanel.OnMouseDown := MouseDown;
  FPanel.OnMouseMove := MouseMove;
  FPanel.OnMouseUp := MouseUp;
  FPanel.OnDblClick := DblClick;
  FPanel.BevelInner := bvNone;
  FPanel.BevelOuter := bvNone;
  FPanel.Constraints.MinWidth := 1;
  FPanel.Constraints.MinHeight := 1;
  FPanel.Name := 's' + IntToStr(Count);
  FPanel.Tag := Count;
end;

procedure TDrawCoordenates.SetPanelSizePosition(X, Y, W, H : Integer);
begin
  FPanel.Top := X;
  FPanel.Left := Y;
  FPanel.Width := W;
  FPanel.Height := H;
  FPanel.Color := RGB (179, 207, 104);
  FPanel.ShowHint := True;
  FPanel.Hint := IntToStr(X) + #32 + IntToStr(Y) + #32 + IntToStr(W) + #32 + IntToStr(H);
  FPanel.Visible := True;

  FString.Add(Format('%d %d %d %d', [X, Y, W, H]));
end;

procedure TDrawCoordenates.SetVariables (SDistx, SDisty, SsW, SsH, Sni, Snj, SLeft, STop: string);
begin
    FString := TStringList.Create;
    FPointer := TPointer.Create;
    FResolution := TPointer.Create;

    with fBackGround do
      begin
        if SLeft = '-1' then
          begin
            fW  := ClientWidth    //Comprimento do monitor
          end
        else fW := StrToInt(SLeft);

        if STop = '-1' then
          fH  := ClientHeight   //Altura do Monitor
        else fH := StrToInt(STop);

        FResolution.FP[0].SetLocation(0, 0); //LeftTop
        FResolution.FP[1].SetLocation(fW, fH); //RightBottom
        FResolution.FFocused := True;
        Editing(FPointer, FResolution);
        Invalidate;
      end;

    ni  := Abs (StrToInt (Sni)); // n Linhas
    nj  := Abs (StrToInt (Snj));  // n Colunas
    sW  := Abs (StrToInt (SsW));  // Comprimento do S
    sH  := Abs (StrToInt (SsH)); // Altura do S

    if FDistribuir = False then
      begin
        Disty    := Abs (StrToInt (SDisty)); //Distância vertical entre estímulos;
        Distx    := Abs (StrToInt (SDistx)); //Distância horizontal;
      end
    else
      begin
        Disty := Round (fH / (ni + 1));
        Distx := Round (fW / (nj + 1));
      end;
end;

procedure TDrawCoordenates.DblClick(Sender: TObject);
begin
    TPanel(Sender).Height := TPanel(Sender).Width;
end;

destructor TDrawCoordenates.Destroy;
begin
  FPointer.Free;
  inherited Destroy;
end;

procedure TDrawCoordenates.MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
if Sender is TPanel then
  begin
    if Button = mbLeft then
      begin
        FPointer.FCapturing := true;
        FPointer.FFocused := True;
        FPointer.FMouseDownSpot.X := X;
        FPointer.FMouseDownSpot.Y := Y;
        MouseMove(Sender, Shift, X, Y);
      end;
  end;
end;

procedure TDrawCoordenates.MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var i: integer; s1 : string;
begin
  if Sender is TPanel then
    begin
      if FPointer.FCapturing then
        begin

          TPanel(Sender).Left := TPanel(Sender).Left -(FPointer.FMouseDownSpot.X -X);
          TPanel(Sender).Top := TPanel(Sender).Top - (FPointer.FMouseDownSpot.Y -Y);
          s1 := IntToStr(TPanel(Sender).Top)    + #32 +
                IntToStr(TPanel(Sender).Left)   + #32 +
                IntToStr(TPanel(Sender).Width)  + #32 +
                IntToStr(TPanel(Sender).Height) + '*';
          TPanel(Sender).Hint := s1;
          fPositionGetter.lbCoordenadas.Items.Strings [TPanel(Sender).Tag - 1] := s1;

              FPointer.FP[0].X := TPanel(Sender).Left;
              FPointer.FP[0].Y := TPanel(Sender).Top;
              FPointer.FP[1].X := TPanel(Sender).Left + TPanel(Sender).Width;
              FPointer.FP[1].Y := TPanel(Sender).Top + TPanel(Sender).Height;

          if ssCtrl in Shift then
          begin
            with fBackGround do
              for i := 0 to ComponentCount -1 do
                begin
                  if Components[i] is TPanel then
                      TPanel(Components[i]).Left := TPanel(Sender).Left;
                  if Components[i] is TPanel then
                      TPanel(Components[i]).Top := TPanel(Sender).Top;
                end;
                //  MouseMove(Sender, Shift, X, Y);
          end;
          //fBackGround.Invalidate;
        end;
    end;
end;

procedure TDrawCoordenates.MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
if Sender is TPanel then
  begin
    if FPointer.FCapturing then
      begin
        fBackGround.SetPanel(TPanel(Sender));
        FPointer.FCapturing := false;
        if Assigned (OnChange) then FOnChange (Sender);
      end;
  end;
end;
{
procedure TDrawCoordenates.DrawLinesFromCoordenates;
var v, k : Integer;
begin
      Self.Canvas.Pen.Width := 1;
      Self.Canvas.Pen.Style := psSolid;

      if FDistribuir = False then
        begin

          Self.Canvas.Pen.Color := RGB (255 , 0 , 255); //Rosa
          for v := 0 to ni -1 do
            begin
                Yv := ((sH + Disty) * v) +
                  Round (Self.ClientHeight/ 2) -
                  Round (((sH + Disty)* ni) / 2) +
                  Round ((Disty) / 2);

                Self.Canvas.MoveTo (0, Yv);
                Self.Canvas.LineTo (Self.ClientWidth, Yv);
            end;

          Self.Canvas.Pen.Color := RGB (51 , 152 , 255); //Azul
          for k := 0 to nj -1 do
            begin
              Xk  := ((sW + Distx) * k) +
                Round (Self.ClientWidth / 2) -
                Round (((sW + Distx) * nj) / 2) +
                Round ((Distx) / 2);

              Self.Canvas.MoveTo (Xk, 0);
              Self.Canvas.LineTo (Xk, Self.ClientHeight);
              end;

          for v  := 0 to ni -1 do
            begin
              Yv :=  ((sH + Disty) * v) +
                Round (Self.ClientHeight/ 2) -
                Round (((sH + Disty)* ni) / 2) +
                Round ((Disty) / 2);

              for  k   := 0 to nj -1 do
                begin
                  Xk  :=  ((sW + Distx) * k) +
                    Round (Self.ClientWidth / 2) -
                    Round (((sW + Distx) * nj) / 2) +
                    Round ((Distx) / 2);

                end;
            end;
        end
      else
        begin

          Self.Canvas.Pen.Color := RGB (255 , 0 , 255); //Rosa
          for v := 1 to ni do
            begin
              Yv := (Disty * v) - Round (sH / 2);
              Self.Canvas.MoveTo (0, Yv);
              Self.Canvas.LineTo (Self.ClientWidth, Yv);
            end;

          Self.Canvas.Pen.Color := RGB (51 , 152 , 255); //Azul
          for k := 1 to nj do
            begin
              Xk  := (Distx * k) - Round (sW / 2);
              Self.Canvas.MoveTo (Xk, 0);
              Self.Canvas.LineTo (Xk, Self.ClientHeight);
            end;

          for v  := 1 to ni do
            begin
              Yv := (Disty * v) - Round (sH / 2);

              for  k   := 1 to nj do
                begin
                  Xk  := (Distx * k) - Round (sW / 2);
                end;
            end;
        end;
end;
}
{ TAleatorizator }

procedure TAleatorizator.RandomizePositions (CanDraw : Boolean);
var rnd1, ArraySize, n  : cardinal; Aux : TCoordenates;
begin
  ArraySize := Length(FPositions);
  if ArraySize > 1 then
    begin
      ClearAll;
      Randomize;
      for n := 0 to ArraySize - 1 do
        begin
          rnd1 := Round (Random * (ArraySize -1));
          while rnd1 = n do rnd1 := Round (Random * (ArraySize -1));
          Aux := FPositions [n];
          FPositions [n]:= FPositions [rnd1];
          FPositions [rnd1] := Aux;
        end;
      if CanDraw then DrawPositionsToForm(ArraySize);
    end;
end;

procedure TAleatorizator.SendTrialToWriter;
begin

end;

constructor TAleatorizator.Create;
begin
  OnDraw := GetPositionsFromForm;
  OnChange := GetCoordenatesFromForm;
  FPositions := TPositions.Create();
end;

destructor TAleatorizator.Destroy;
begin
  FString.Free;
  ClearAll;
  inherited Destroy;
end;

procedure TAleatorizator.GetCoordenatesFromForm (Sender: TObject);
var i, count: Cardinal;
begin
  count := 0;
  with fBackGround do
    for i := 0 to ComponentCount - 1 do
        if Components[i] is TPanel then
          begin
            FPositions[count].Index := Components[i].Tag;
            FPositions[count].Top := TPanel(Components[i]).Top;
            FPositions[count].Left := TPanel(Components[i]).Left;
            FPositions[count].Width := TPanel(Components[i]).Width;
            FPositions[count].Height := TPanel(Components[i]).Height;
            Inc(count);
          end;
  end;

function TAleatorizator.GetPositions: TPositions;
begin
  Result := FPositions;
end;

procedure TAleatorizator.GetPositionsFromForm (Sender: TObject);
var i, count: Cardinal;
begin
  fPositionGetter.lbCoordenadas.Items := FString;
  FString.Clear;
  count := 0;
  with fBackGround do
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TPanel then Inc (Count);
  if Count > 0 then
    begin
      SetLength(FPositions, Count);
      if Assigned (OnChange) then FOnChange (Sender);
    end;
end;

procedure TAleatorizator.DrawPositionsToForm(ArraySize: Integer);
var n : Integer;
begin
  for n := 0 to ArraySize - 1 do
  begin
    SetPanelFeatures (n + 1);
    SetPanelSizePosition (FPositions[n].Top,
                          FPositions[n].Left,
                          FPositions[n].Width,
                          FPositions[n].Height);
  end;

  if Assigned (OnDraw) then FOnDraw (Self);
end;

end.
