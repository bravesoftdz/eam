{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit formCheckBoxTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, uEscriba, ExtCtrls;

type
  TfCheckBoxTree = class(TForm)
    grpBlocos: TGroupBox;
    grpTrial: TGroupBox;
    grpStm: TGroupBox;
    grpChk: TGroupBox;
    rbStm: TRadioButton;
    rbTrial: TRadioButton;
    rbBlc: TRadioButton;
    chkBox1: TCheckBox;
    seN: TSpinEdit;
    Label3: TLabel;
    seGap: TSpinEdit;
    seBeginAt: TSpinEdit;
    Label1: TLabel;
    seEndAt: TSpinEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure chkBox1Click(Sender: TObject);
    procedure seNKeyPress(Sender: TObject; var Key: Char);
    procedure grpChkClick(Sender: TObject);
    procedure seEndAtDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseEnter(Sender: TObject);
  private
    FChk : TCheckBox;
    FEscriba : TEscriba;
    FSeBlc : TSpinEdit;
    FOnBlcChange: TNotifyEvent;
    FOnTrialChange: TNotifyEvent;
    FSeTrial: TSpinEdit;
    FCbbStimulus: TComboBox;
    FOnStmChange: TNoTifyEvent;
    FSeNumComp: TSPinEdit;
    FThereIsForm12: Boolean;
    procedure BlcChange (Sender: TObject);
    procedure ChkEliminator (Grp : TGroupbox);
    procedure ChkBlcClick(Sender: TObject);
    procedure ChkMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ChkTrialClick (Sender: TObject);
    procedure ChkStmClick (Sender : TObject);
    procedure ChkStmGenerator;
    procedure RefreshChkBlc;
    procedure RefreshChkStm;
    procedure RefreshChkTrials(Trial: Integer);
    procedure StmChange (Sender: TObject);
    procedure TrialChange (Sender: TObject);
  public
    procedure ChkBlcGenerator;
    procedure ChkTrialGenerator;
    property Escriba : TEscriba read FEscriba write FEscriba;
    property SeBlc : TSpinEdit read FSeBlc write FSeBlc;
    property SeTrial : TSpinEdit read FSeTrial write FSeTrial;
    property SeNumComp : TSPinEdit read FSeNumComp write FSeNumComp;
    property CbbStimulus : TComboBox read FCbbStimulus write FCbbStimulus;
    property OnBlcChange : TNotifyEvent read FOnBlcChange write FOnBlcChange;
    property OnTrialChange : TNotifyEvent read FOnTrialChange write FOnTrialChange;
    property OnStmChange : TNoTifyEvent read FOnStmChange write FOnStmChange;
    property ThereIsForm12 : Boolean read FThereIsForm12 write FThereIsForm12 default False;
  end;

var
  fCheckBoxTree: TfCheckBoxTree;

implementation

uses formTools;

{$R *.dfm}

procedure TfCheckBoxTree.ChkBlcGenerator;
var blc, tp : integer;
begin
  tp := 20;
  for blc := 0 to Escriba.NumBlc - 1 do
    begin
      FChk := TCheckBox.Create (grpBlocos);
      FChk.Parent := grpBlocos;
      FChk.Name := 'Bloco' + IntToStr (blc + 1);
      FChk.Caption := 'Bloco' + #32 + IntToStr (blc + 1);
      FChk.Hint := Escriba.CfgBlc[blc].Name;
      FChk.ShowHint := True;
      FChk.Tag := blc + 1;
      FChk.Top := Tp;
      FChk.Left := 14;
      FChk.Height := 17;
      FChk.Width := 60;
      FChk.OnClick := ChkBlcClick;
      FChk.OnMouseUp := ChkMouseUp;
      if FChk.Tag = Seblc.Value then
        begin
          FChk.Checked := True;
          FChk.Font.Style := [fsUnderline];
        end;
      Inc (tp, 23);
    end;

    if grpBlocos.ComponentCount <= 5 then tp := 5 else tp := grpBlocos.ComponentCount;
    grpBlocos.Height := (tp * 23) + 20;
end;


procedure TfCheckBoxTree.chkBox1Click(Sender: TObject);
var i, seq : integer; Grp : TGroupBox;
begin
  if rbBlc.Checked then Grp := grpBlocos
    else
      if rbTrial.Checked then Grp := grpTrial
        else
        if rbStm.Checked then Grp := grpStm
          else Grp := nil;

  i:= seBeginAt.Value - 1;
  if Assigned(Grp) then
  if Grp.ComponentCount > 0 then
    while (i < Grp.ComponentCount) and (i <= seEndAt.Value - 1) do
      begin
        for seq := 0 to seN.Value -1 do
          begin
            if i < Grp.ComponentCount then
              if TCheckBox(Sender).Checked then
                TCheckBox(Grp.Components[i]).Checked := True
              else TCheckBox(Grp.Components[i]).Checked := False;
            Inc (i);
          end;
        Inc(i, seGap.Value);
      end;
end;

procedure TfCheckBoxTree.ChkEliminator(Grp: TGroupbox);
begin
  while Grp.ComponentCount > 0 do
    if Grp.Components[0] is TCheckBox then TCheckBox(Grp.Components[0]).Free;
end;

procedure TfCheckBoxTree.ChkTrialGenerator;
var trial, tp : integer;
begin
  tp := 20;
  for trial := 0 to Escriba.Cfgblc[FSeBlc.Value - 1].NumTrials - 1 do
    begin
      FChk := TCheckBox.Create (grpTrial);
      FChk.Parent := grpTrial;
      FChk.Name := 'T' + IntToStr (trial + 1);
      FChk.Caption := 'T' + IntToStr (trial + 1);
      FChk.Hint := Escriba.CfgBlc[FSeBlc.Value - 1].VetCfgTrial[trial].Name;
      FChk.ShowHint := True;
      FChk.Tag := trial + 1;
      FChk.Top := tp;
      FChk.Left := 14;
      FChk.Height := 17;
      FChk.Width := 60;
      FChk.OnClick := ChkTrialClick;
      FChk.OnMouseUp := ChkMouseUp;
      if FChk.Tag = SeTrial.Value then
        begin
          FChk.Font.Style := [fsUnderline];
          FChk.Checked := True;
        end;
      Inc (tp, 23);
    end;

    if grpTrial.ComponentCount <= 5 then tp := 5 else tp := grpTrial.ComponentCount;
    grpTrial.Height := (tp * 23) + 20;
end;

procedure TfCheckBoxTree.FormCreate(Sender: TObject);
begin
  Self.Width := 319;
  Self.Height := 291;
  OnBlcChange := BlcChange;
  OnTrialChange := TrialChange;
  OnStmChange := StmChange;
end;

procedure TfCheckBoxTree.FormDestroy(Sender: TObject);
begin
  FEscriba := nil;
  FSeBlc := nil;
  FSeTrial := nil;
  FCbbStimulus := nil;
  FSeNumComp := nil;
end;

procedure TfCheckBoxTree.FormMouseEnter(Sender: TObject);
begin
  Self.Show;
end;

procedure TfCheckBoxTree.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position:= VertScrollBar.ScrollPos + VertScrollBar.Increment;
end;

procedure TfCheckBoxTree.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position:= VertScrollBar.ScrollPos - VertScrollBar.Increment;
end;

procedure TfCheckBoxTree.grpChkClick(Sender: TObject);
begin
  if rbBlc.Checked then seEndAt.Value := FEscriba.NumBlc;
  if rbTrial.Checked then seEndAt.Value := FEscriba.Blcs[FSeBlc.Value -1].NumTrials;
  if rbStm.Checked then seEndAt.Value := StrToIntDef(FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values ['NumComp'], 1);
end;

procedure TfCheckBoxTree.ChkStmGenerator;
var stm, tp : integer;
begin
  tp := 20;
  for stm := 0 to SeNumComp.Value - 1 do
    begin
      FChk := TCheckBox.Create (grpStm);
      FChk.Parent := grpStm;
      FChk.Name := 'C' + IntToStr (stm + 1);
      FChk.Caption := 'C' + IntToStr (stm + 1);
      //FChk.Hint := Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values ['C' + IntToStr (stm + 1) + 'Stm'];
      FChk.ShowHint := True;
      FChk.Tag := stm + 1;
      FChk.Top := tp;
      FChk.Left := 14;
      FChk.Height := 17;
      FChk.Width := 60;
      FChk.OnClick := ChkStmClick;
      FChk.OnMouseUp := ChkMouseUp;

      if (FChk.Tag = (CbbStimulus.ItemIndex + 1)) then
        begin
          FChk.Font.Style := [fsUnderline];
          FChk.Checked := True;
        end;
      Inc (tp, 23);
    end;

    if grpStm.ComponentCount <= 5 then tp := 5 else tp := grpStm.ComponentCount;
    grpStm.Height := (tp * 23) + 20;
end;

procedure TfCheckBoxTree.ChkBlcClick(Sender: TObject);
begin
  if Sender = TCheckBox(grpBlocos.Components[SeBlc.Value - 1]) then TCheckBox(Sender).Checked := True;
end;

procedure TfCheckBoxTree.ChkStmClick(Sender: TObject);
begin
  if CbbStimulus.ItemIndex = -1 then
    begin
      CbbStimulus.ItemIndex := TCheckBox(Sender).ComponentIndex;
      if assigned (fTools.OnStmChange) then fTools.OnStmChange(sender);
    end;
  if Sender = TCheckBox(grpStm.Components[CbbStimulus.ItemIndex]) then TCheckBox(Sender).Checked := True;
end;

procedure TfCheckBoxTree.ChkTrialClick(Sender: TObject);
begin
  if Sender = TCheckBox(grpTrial.Components[SeTrial.Value - 1]) then TCheckBox(Sender).Checked := True;
end;

procedure TfCheckBoxTree.ChkMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var i : integer;
begin
  if ssCtrl in Shift then
    begin
      for  i := 0 to TCheckBox(sender).Parent.ComponentCount -1 do
        begin
          //if TCheckBox(TCheckBox(sender).Parent.Components[i]).Checked then
          //  TCheckBox(TCheckBox(sender).Parent.Components[i]).Checked := False;
          if TCheckBox(TCheckBox(sender).Parent.Components[i]).Font.Style = [fsUnderline] then
            TCheckBox(TCheckBox(sender).Parent.Components[i]).Font.Style := [];
        end;
      TCheckBox(Sender).Checked := True;
      TCheckBox(Sender).Font.Style := [fsUnderline];

      if TCheckBox(Sender).Parent = grpBlocos then
        begin
          SeBlc.Value := TCheckBox(Sender).ComponentIndex + 1;
          if assigned (fTools.OnBlcChange) then fTools.OnBlcChange(sender);
        end;
      if TCheckBox(sender).Parent = grpTrial then
        begin
          SeTrial.Value := TCheckBox(Sender).ComponentIndex + 1;
          if assigned (fTools.OnTrialChange) then fTools.OnTrialChange(sender);
        end;
      if TCheckBox(sender).Parent = grpStm then
        begin
          CbbStimulus.ItemIndex := TCheckBox(Sender).ComponentIndex;
          CbbStimulus.OnChange(sender);
          if assigned (fTools.OnStmChange) then fTools.OnStmChange(sender);
        end;
    end;
end;

procedure TfCheckBoxTree.RefreshChkBlc;
var i : integer;
begin
  for i := 0 to grpBlocos.ComponentCount - 1 do
    begin
      if grpBlocos.Components[i] is TCheckBox  then
        begin
          TCheckBox(grpBlocos.Components[i]).Caption := 'Bloco' + #32 + IntToStr (i + 1);
          TCheckBox(grpBlocos.Components[i]).Hint := FEscriba.CfgBlc[i].Name;
          if i = Seblc.Value - 1 then
            begin
              TCheckBox(grpBlocos.Components[i]).Checked := True;
              TCheckBox(grpBlocos.Components[i]).Font.Style := [fsUnderline];
            end
          else
            begin
              TCheckBox(grpBlocos.Components[i]).Checked := False;
              TCheckBox(grpBlocos.Components[i]).Font.Style := [];
            end;
        end;
    end;
end;

procedure TfCheckBoxTree.RefreshChkStm;
var i : integer;
begin
  for i := 0 to grpStm.ComponentCount - 1 do
    begin
      if grpStm.Components[i] is TCheckBox  then
        begin
          TCheckBox(grpStm.Components[i]).Caption := 'C' + IntToStr (i + 1);
          TCheckBox(grpStm.Components[i]).Hint := Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values ['C' + IntToStr (i + 1) + 'Stm'];
          if i = CbbStimulus.ItemIndex then
            begin
              TCheckBox(grpStm.Components[i]).Checked := True;
              TCheckBox(grpStm.Components[i]).Font.Style := [fsUnderline];
            end
          else
            begin
              TCheckBox(grpStm.Components[i]).Checked := False;
              TCheckBox(grpStm.Components[i]).Font.Style := [];
            end;
        end;
    end;
end;

procedure TfCheckBoxTree.RefreshChkTrials(Trial: Integer);
var i : integer;
begin
  for i := 0 to grpTrial.ComponentCount - 1 do
    begin
      if grpTrial.Components[i] is TCheckBox  then
        begin
          TCheckBox(grpTrial.Components[i]).Caption := 'T' + IntToStr (i + 1);
          TCheckBox(grpTrial.Components[i]).Hint := FEscriba.Blcs[FSeBlc.Value -1].VetCfgTrial[i].Name;
          if i = SeTrial.Value - 1 then
            begin
              TCheckBox(grpTrial.Components[i]).Checked := True;
              TCheckBox(grpTrial.Components[i]).Font.Style := [fsUnderline];
            end
          else
            begin
              TCheckBox(grpTrial.Components[i]).Checked := False;
              TCheckBox(grpTrial.Components[i]).Font.Style := [];
            end;
        end;
    end;
end;

procedure TfCheckBoxTree.seEndAtDblClick(Sender: TObject);
begin
  if Escriba.IsLoaded then
    seEndAt.Value := Escriba.CfgBlc[SeBlc.Value - 1].NumTrials;
end;

procedure TfCheckBoxTree.seNKeyPress(Sender: TObject; var Key: Char);
begin
  if CharInSet (Key, ['0'..'9', #8]) then key := #0;
end;

procedure TfCheckBoxTree.StmChange(Sender: TObject);
var num : boolean;
begin
  if Length(Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial) > 0 then
    begin
      num := (Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].NumComp > 0);
        if (Assigned (CbbStimulus)) and
           (CbbStimulus.ComponentIndex > -1) and (num) {NumComp > 0} then
            if grpStm.ComponentCount > 0 then
              begin
                  ChkEliminator (grpStm);
                  ChkStmGenerator;
              end
            else ChkStmGenerator;
    end;
end;

procedure TfCheckBoxTree.TrialChange(Sender: TObject);
var num : boolean; NumTrials, NumComp : integer;
begin
  if Length(Escriba.Blcs) > 0 then
    begin
      NumTrials := Escriba.CfgBlc[SeBlc.Value - 1].NumTrials;
      num := NumTrials > 0;
      if (Assigned (SeTrial)) and
         (SeTrial.Value > 0) and
         (num) {NumTrials > 0} then
          if grpTrial.ComponentCount > 0 then
            begin
              ChkEliminator (grpTrial);
              ChkTrialGenerator;
            end
          else ChkTrialGenerator;
      if Length(Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial) > 0 then
        begin
          NumComp := Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].NumComp;
          num := (NumComp > 0);
          if (Assigned (CbbStimulus)) and
             (CbbStimulus.ComponentIndex > -1) and
             (num) {NumComp > 0} then
              if grpStm.ComponentCount > 0 then
                begin
                  ChkEliminator (grpStm);
                  ChkStmGenerator;
                end
              else ChkStmGenerator;
        end;
    end;
end;

procedure TfCheckBoxTree.BlcChange(Sender: TObject);
var num : boolean; NumComp : integer;
begin
  num := Escriba.NumBlc > 0;
  if (Assigned (SeBlc)) and
     (SeBlc.Value > 0) and
     (num) then
      begin
        if (grpBlocos.ComponentCount <> Escriba.NumBlc) then
          begin
           ChkEliminator (grpBlocos);
           ChkBlcGenerator;
          end
        else RefreshChkBlc;
      end
  else
    begin
      ChkEliminator (grpBlocos);
      ChkEliminator (grpTrial);
      ChkEliminator (grpStm);
    end;
  if Length(Escriba.Blcs) > 0 then
    begin
      num := Escriba.CfgBlc[SeBlc.Value - 1].NumTrials > 0;
      if (Assigned (SeTrial)) and
         (SeTrial.Value > 0) and
         (num) then
          if grpTrial.ComponentCount <> Escriba.CfgBlc[SeBlc.Value - 1].NumTrials then
            begin
              ChkEliminator (grpTrial);
              ChkTrialGenerator;
            end
          else RefreshChkTrials (SeTrial.Value - 1);
      if FThereIsForm12 and
         (Length(Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial) > 0) then
        begin
          NumComp := StrToIntDef (Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values ['NumComp'], 0);
          num := (NumComp > 0);
          if (Assigned (CbbStimulus)) and
             (CbbStimulus.ComponentIndex > -1) and
             (num) then
              if grpStm.ComponentCount <> NumComp then
                begin
                  ChkEliminator (grpStm);
                  ChkStmGenerator;
                end
              else RefreshChkStm;
        end;
    end;
end;

end.
