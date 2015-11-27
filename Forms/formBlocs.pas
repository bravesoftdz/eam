unit formBlocs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, ExtCtrls,
  uEscriba, Menus, Buttons, ComCtrls, ToolWin;

type
  TfBlocs = class(TForm)
    pnl1: TPanel;
    grp1: TGroupBox;
    grp2: TGroupBox;
    edtName: TEdit;
    grpTrial: TGroupBox;
    grp4: TGroupBox;
    edtITI: TEdit;
    milisegundos: TLabel;
    grp5: TGroupBox;
    pnlBkGnd: TPanel;
    dlgColor1: TColorDialog;
    edtTrials: TEdit;
    pm1: TPopupMenu;
    prmBlcUnd: TMenuItem;
    prmBlcChk: TMenuItem;
    prmNames: TMenuItem;
    N3: TMenuItem;
    prmBlcAll: TMenuItem;
    Parameters: TMenuItem;
    N2: TMenuItem;
    GroupBox1: TGroupBox;
    edtMaxCorrection: TEdit;
    GroupBox2: TGroupBox;
    edtCsqCriterion: TEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    pmWrite: TPopupMenu;
    Escrever1: TMenuItem;
    N1: TMenuItem;
    pBlcUnd: TMenuItem;
    pBlcChk: TMenuItem;
    pBlcAll: TMenuItem;
    ToolButton2: TToolButton;
    BitBtn1: TBitBtn;
    pMain: TMenuItem;
    pPositions: TMenuItem;
    btnPlusTrial: TButton;
    btnMinusTrial: TButton;
    btnShowTrials: TButton;
    btn3: TToolButton;
    btn2: TToolButton;
    grpBlcs: TGroupBox;
    edtBlcs: TEdit;
    btnPlusBlc: TButton;
    btnMinusBlc: TButton;
    pnlSaved: TPanel;
    tmrSaved: TTimer;
    lbledtCrtHitConsc: TLabeledEdit;
    lbledtCrtMaxTrial: TLabeledEdit;
    lbledtCrtMissConsec: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure pnlBkGndDblClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure prmBlcUndClick(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure prmNamesClick(Sender: TObject);
    procedure btnMinusPlusTrialClick(Sender: TObject);
    procedure btnShowTrialsClick(Sender: TObject);
    procedure btnMinusPlusBlcClick(Sender: TObject);
    procedure edtBlcsKeyPress(Sender: TObject; var Key: Char);
    procedure tmrSavedTimer(Sender: TObject);
    procedure edtNameExit(Sender: TObject);
    procedure FormMouseEnter(Sender: TObject);
  private
    FPosX : integer;
    FPosY : integer;
    FEscriba : TEscriba;
    FSeBlc : TSpinEdit;
    FGrpBlocos : TGroupbox;
    FOnBlcChange : TNotifyEvent;
    FSeTrial: TSpinEdit;
    FOnTrialChange: TNotifyEvent;
    FOnStmChange: TNotifyEvent;
    procedure SetPnlColor (cColor : Integer);
    procedure SaveParameters (Blc : Integer);
    procedure RefreshParameters (Blc : Integer);
    procedure SeBlcChange (Sender: TObject);
    procedure SeTrialChange (Sender : TObject);
    procedure CbbStmChange  (Sender : TObject);
  public
    procedure SetStandardParameters (Blc : Integer);
    property Escriba : TEscriba read FEscriba write FEscriba;
    property GrpBlocos : TGroupBox read FGrpBlocos write FGrpBlocos;
    property SeBlc : TSpinEdit read FSeBlc write FSeBlc;
    property SeTrial : TSpinEdit read FSeTrial write FSeTrial;
    property OnBlcChange : TNotifyEvent read FOnBlcChange write FOnBlcChange;
    property OnTrialChange : TNotifyEvent read FOnTrialChange write FOnTrialChange;
    property OnStmChange : TNotifyEvent read FOnStmChange write FOnStmChange;
  end;

var
  fBlocs: TfBlocs;

implementation

uses formMain, formTools;

{$R *.dfm}

procedure TfBlocs.prmBlcUndClick(Sender: TObject);
var
  i : integer;
  CfgStmSet : set of 1..3;
  CfgStmSet2 : set of 4..6;
begin
  CfgStmSet := [1, 2, 3];
  CfgStmSet2 := [4, 5, 6];
  if TMenuItem (Sender).Checked then
    begin
      if TMenuItem (Sender).Tag in CfgStmSet then
        begin
          //ShowMessage (TMenuItem (Sender).Caption);
          for i := 0 to Pm1.Items.Count -1 do
            if (Pm1.Items[i].Name <> TMenuItem (Sender).Name) and
               (Pm1.Items[i].Tag in CfgStmSet) then
                Pm1.Items[i].Checked := False;
        end;
      if TMenuItem (Sender).Tag in CfgStmSet2 then
        begin
          //ShowMessage (TMenuItem (Sender).Caption);
          for i := 0 to PmWrite.Items.Count -1 do
            if (PmWrite.Items[i].Name <> TMenuItem (Sender).Name) and
               (PmWrite.Items[i].Tag in CfgStmSet2) then
                PmWrite.Items[i].Checked := False;
        end;
    end;
  if prmBlcChk.Checked or prmBlcAll.Checked then prmNames.Enabled := True;
  if (not prmBlcChk.Checked) and (not prmBlcAll.Checked) then
    begin
      prmNames.Enabled := False;
      prmNames.Checked := False;
    end;

  if TMenuItem(Sender).GetParentMenu = pm1 then pm1.Popup(FPosX, FPosY);
  if TMenuItem(Sender).GetParentMenu = pmWrite then pmWrite.Popup(FPosX, FPosY);
end;

procedure TfBlocs.prmNamesClick(Sender: TObject);
begin
    if TMenuItem(Sender).GetParentMenu = pm1 then pm1.Popup(FPosX, FPosY);
  if TMenuItem(Sender).GetParentMenu = pmWrite then pmWrite.Popup(FPosX, FPosY);
end;

procedure TfBlocs.btnAplicarClick(Sender: TObject);
var i, a1 : integer; OldName, NewName : string;
begin

  if pMain.Checked then Escriba.SetMain;

  if pPositions.Checked then Escriba.SetPosWriteOnly;

  if prmNames.Checked then
    begin
      OldName := edtName.Text;
      a1 := 0;
      if prmBlcChk.Checked then
        for i := 0 to FgrpBlocos.ComponentCount - 1 do
          begin
            if FgrpBlocos.Components[i] is TCheckBox  then
              if TCheckBox(FgrpBlocos.Components[i]).Checked then
                begin
                  Inc (a1);
                  NewName := OldName;
                  NewName := NewName + #32 + IntToStr (a1);
                  edtName.Text := NewName;
                  SaveParameters (i);
                end;
          end;
      if prmBlcAll.Checked then
        for i := 0 to SeBlc.MaxValue - 1 do
          begin
            Inc (a1);
            NewName := OldName;
            NewName := NewName + #32 + IntToStr (a1);
            edtName.Text := NewName;
            SaveParameters (i);
          end;
    end
  else
    begin

      if prmBlcUnd.Checked then SaveParameters (SeBlc.Value - 1);

      if prmBlcChk.Checked then
        for i := 0 to FgrpBlocos.ComponentCount - 1 do
          begin
            if FgrpBlocos.Components[i] is TCheckBox  then
              if TCheckBox(FgrpBlocos.Components[i]).Checked then SaveParameters (i);
          end;
      if prmBlcAll.Checked then
        for i := 0 to SeBlc.MaxValue - 1 do SaveParameters (i);
    end;

  if pBlcUnd.Checked then Escriba.SetBlc(SeBlc.Value - 1, true);

  if pBlcChk.Checked then
    for i := 0 to FgrpBlocos.ComponentCount - 1 do
      begin
        if FgrpBlocos.Components[i] is TCheckBox  then
          if TCheckBox(FgrpBlocos.Components[i]).Checked then Escriba.SetBlc(i, true);
      end;

  if pBlcAll.Checked then
    for i := 0 to Escriba.NumBlc -1 do Escriba.SetBlc(i, true);

  for i := 0 to pm1.Items.Count - 1 do TMenuItem(pm1.Items[i]).Checked := False;
  for i := 0 to pmWrite.Items.Count - 1 do TMenuItem(pmWrite.Items[i]).Checked := False;

  tmrSaved.Enabled:= True;
  with pnlSaved do
    begin
      Color:= clLime;
      Caption:= 'SALVO';
    end;
end;

procedure TfBlocs.btnMinusPlusBlcClick(Sender: TObject);
var blcOld, blcNew : integer;
begin
  blcOld := Escriba.NumBlc;
  blcNew := Escriba.NumBlc;
  if (TButton(Sender) = btnMinusBlc) then
    begin
      if (blcNew > 1) then Dec(blcNew)
      else Exit;
    end;
  if TButton(Sender) = btnPlusBlc then Inc(blcNew);
  Escriba.NumBlc := blcNew;
  Escriba.LengthVetBlc;
  if blcOld < blcNew then
    begin
      SetStandardParameters(blcNew - 1);
      Escriba.LengthVetTrial(blcNew - 1);
      if assigned(fTools.OnTrialUpDate) then fTools.OnTrialUpDate(Sender);       //Necessário atualizar a chave 'NumComp=' das tentativasPosPensar em um jeito de aplicar um padrão a essa nova tentativa
    end;
  if blcOld > blcNew then seBlc.Value := blcNew;
  if assigned (fTools.OnBlcChange) then fTools.OnBlcChange(sender);

  tmrSaved.Enabled:= True;
  with pnlSaved do
    begin
      Color:= clLime;
      Caption:= 'SALVO';
    end;
end;

procedure TfBlocs.btnMinusPlusTrialClick(Sender: TObject);
var trialOld, trialNew : integer;
begin
  trialOld := Escriba.Blcs[SeBlc.Value - 1].NumTrials;
  trialNew := Escriba.Blcs[SeBlc.Value - 1].NumTrials;
  if (TButton(Sender) = btnMinusTrial) then
    begin
      if (trialNew > 1 ) then
        Dec(trialNew)
      else Exit;
    end;
  if (TButton(Sender) = btnPlusTrial) then Inc(trialNew);
  Escriba.Blcs[SeBlc.Value - 1].NumTrials := trialNew;
  if trialOld < trialNew then
    begin
      Escriba.LengthVetTrial(SeBlc.Value - 1);
      if assigned(fTools.OnTrialUpDate) then fTools.OnTrialUpDate(Sender);       //Necessário atualizar a chave 'NumComp=' das tentativasPosPensar em um jeito de aplicar um padrão a essa nova tentativa
    end;
  if trialOld > trialNew then seTrial.Value := trialNew;
  if assigned (fTools.OnBlcChange) then fTools.OnBlcChange(sender);
  tmrSaved.Enabled:= True;
  with pnlSaved do
    begin
      Color:= clLime;
      Caption:= 'SALVO';
    end;
end;

procedure TfBlocs.btnShowTrialsClick(Sender: TObject);
begin
  fTools.btnTrialClick(Sender);
end;

procedure TfBlocs.CbbStmChange(Sender: TObject);
begin

end;

procedure TfBlocs.edtBlcsKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfBlocs.edtNameExit(Sender: TObject);
var Blc : integer; s1 : string;
begin
  Blc := SeBlc.Value - 1;
  if Sender = edtName then
    begin
      Escriba.Blcs[Blc].Name := edtName.Text;

      if edtTrials.Text = '' then edtTrials.Text := '0 0' else
        begin
          s1:= edtTrials.Text;
          Escriba.Blcs[Blc].NumTrials:= StrToIntDef(Copy(s1, 0, pos(' ', s1)-1), 0);
          Delete(s1, 1, pos(' ', s1)); If Length(s1)>0 then While s1[1]=' ' do Delete(s1, 1, 1);
          Escriba.Blcs[Blc].VirtualTrialValue:= StrToIntDef(s1, 0);
          Escriba.LengthVetTrial(Blc);
          if assigned(fTools.OnTrialUpDate) then fTools.OnTrialUpDate(fBlocs);
          if assigned (fTools.OnTrialChange) then fTools.OnTrialChange(fBlocs);
        end;
    end;
  if Sender = edtITI then
    begin
      Escriba.Blcs[Blc].ITI := StrToIntDef (edtITI.Text, 0);
    end;
  if Sender = pnlBkGnd then
    begin
      Escriba.Blcs[Blc].BkGnd := pnlBkgnd.Color;
    end;
  if Sender = lbledtCrtHitConsc then
    begin
      Escriba.Blcs[Blc].ConsecutiveHitCriterion := StrToIntDef (lbledtCrtHitConsc.Text, 0);
    end;
  if Sender = lbledtCrtMissConsec then
    begin
      Escriba.Blcs[Blc].ConsecutiveMissCriterion := StrToIntDef (lbledtCrtMissConsec.Text, 0);
    end;
  if Sender = lbledtCrtMaxTrial then
    begin
      Escriba.Blcs[Blc].MaxTrialCriterion := StrToIntDef (lbledtCrtMaxTrial.Text, 0);
    end;
  if Sender = edtMaxCorrection then
    begin
      Escriba.Blcs[Blc].NumCrt := StrToIntDef(edtMaxCorrection.Text, 0);
    end;
  if Sender = edtCsqCriterion then
    begin
      Escriba.Blcs[Blc].CsqHitCriterion := StrToIntDef(edtCsqCriterion.Text, 0);
    end;

  tmrSaved.Enabled:= True;
  with pnlSaved do
    begin
      Color:= clLime;
      Caption:= 'SALVO';
    end;
end;

procedure TfBlocs.FormCreate(Sender: TObject);
begin
  OnBlcChange := SeBlcChange;
  OnTrialChange := SeTrialChange;
  OnStmChange := cbbStmChange;
end;

procedure TfBlocs.FormMouseEnter(Sender: TObject);
begin
  Self.Show;
end;

procedure TfBlocs.pm1Popup(Sender: TObject);
begin
  FPosX := TPopUpMenu(Sender).PopupPoint.X;
  FPosY := TPopUpMenu(Sender).PopupPoint.Y;
end;

procedure TfBlocs.pnlBkGndDblClick(Sender: TObject);
begin
  pnlBkGnd.SetFocus;
  if dlgColor1.execute then
    begin
      SetPnlColor (dlgColor1.Color);
    end;
end;

procedure TfBlocs.RefreshParameters (Blc : Integer);
begin
  edtName.Text := Escriba.Blcs[Blc].Name;
  edtBlcs.Text := IntToStr(Escriba.NumBlc);
  edtTrials.Text := IntToStr (Escriba.Blcs[Blc].NumTrials) + #32 + IntToStr (Escriba.Blcs[Blc].VirtualTrialValue);
  edtITI.Text := IntToStr (Escriba.Blcs[Blc].ITI);
  SetPnlColor (Escriba.Blcs[Blc].BkGnd);
  lbledtCrtHitConsc.Text := IntToStr (Escriba.Blcs[Blc].ConsecutiveHitCriterion);
  lbledtCrtMissConsec.Text := IntToStr (Escriba.Blcs[Blc].ConsecutiveMissCriterion);
  lbledtCrtMaxTrial.Text := IntToStr (Escriba.Blcs[Blc].MaxTrialCriterion);

  edtMaxCorrection.Text := IntToStr (Escriba.Blcs[Blc].NumCrt);
  edtCsqCriterion.Text := IntToStr (Escriba.Blcs[Blc].CsqHitCriterion)
end;

procedure TfBlocs.SeBlcChange(Sender: TObject);
begin
  RefreshParameters (SeBlc.Value - 1);
end;

procedure TfBlocs.SaveParameters(Blc: Integer);
var s1 : string;
begin
  Escriba.Blcs[Blc].Name := edtName.Text;

  if edtTrials.Text = '' then edtTrials.Text := '0 0' else
    begin
      s1:= edtTrials.Text;
      Escriba.Blcs[Blc].NumTrials:= StrToIntDef(Copy(s1, 0, pos(' ', s1)-1), 0);
      Delete(s1, 1, pos(' ', s1)); If Length(s1)>0 then While s1[1]=' ' do Delete(s1, 1, 1);
      Escriba.Blcs[Blc].VirtualTrialValue:= StrToIntDef(s1, 0);
      Escriba.LengthVetTrial(Blc);
      if assigned(fTools.OnTrialUpDate) then fTools.OnTrialUpDate(fBlocs);
      if assigned (fTools.OnTrialChange) then fTools.OnTrialChange(fBlocs);
    end;
  Escriba.Blcs[Blc].ITI := StrToIntDef (edtITI.Text, 0);
  Escriba.Blcs[Blc].BkGnd := pnlBkgnd.Color;
  Escriba.Blcs[Blc].ConsecutiveHitCriterion := StrToIntDef (lbledtCrtHitConsc.Text, 0);
  Escriba.Blcs[Blc].ConsecutiveMissCriterion := StrToIntDef (lbledtCrtMissConsec.Text, 0);
  Escriba.Blcs[Blc].MaxTrialCriterion := StrToIntDef (lbledtCrtMaxTrial.Text, 0);
  Escriba.Blcs[Blc].NumCrt := StrToIntDef(edtMaxCorrection.Text, -1);
  Escriba.Blcs[Blc].CsqHitCriterion := StrToIntDef(edtCsqCriterion.Text, -1);
end;

procedure TfBlocs.SetPnlColor(cColor: Integer);
begin
  pnlBkGnd.Caption := IntToStr (cColor);
  pnlBkGnd.Color := cColor;
  pnlBkGnd.Hint := IntToStr (cColor) + ': Duplo clique para modificar a cor';
end;

procedure TfBlocs.SeTrialChange(Sender: TObject);
begin

end;

procedure TfBlocs.SetStandardParameters(Blc: Integer);
begin
  Escriba.Blcs[Blc].Name := 'Bloco' + #32 + IntToStr (Blc + 1);
  Escriba.Blcs[Blc].NumTrials := 24;
  Escriba.Blcs[Blc].VirtualTrialValue := 0;
  Escriba.Blcs[Blc].ITI := 0;
  Escriba.Blcs[Blc].BkGnd := 0;
  Escriba.Blcs[Blc].ConsecutiveHitCriterion := 6;
  Escriba.Blcs[Blc].ConsecutiveMissCriterion := -1;
  Escriba.Blcs[Blc].MaxTrialCriterion := -1;
  Escriba.Blcs[Blc].NumCrt := 0;
  Escriba.Blcs[Blc].CsqHitCriterion := 0;
end;

procedure TfBlocs.tmrSavedTimer(Sender: TObject);
begin
  tmrSaved.Enabled:= False;
  with pnlSaved do
    begin
      Color:= clBtnFace;
      Caption:= '';
    end;
end;

end.
