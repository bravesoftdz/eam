unit formTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEscriba, Spin, ExtCtrls;

type
  TfTools = class(TForm)
    grpMain: TGroupBox;
    grpBlc: TGroupBox;
    grpTrial: TGroupBox;
    seBlc: TSpinEdit;
    seTrial: TSpinEdit;
    btnNewSession: TButton;
    grpStm: TGroupBox;
    edtStimulus: TEdit;
    btnGerarPosicoes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGerarPosicoesClick(Sender: TObject);
    procedure btnNewSessionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnBlcClick(Sender: TObject);
    procedure seBlcChange(Sender: TObject);
    procedure btnTrialClick(Sender: TObject);
    procedure seTrialChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtStimulusKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseEnter(Sender: TObject);
  private
    FEscriba : TEscriba;
    FOnBlcCfg : TNotifyEvent;
    FOnBlcChange: TNotifyEvent;
    FOnTrialChange: TNotifyEvent;
    FOnStmchange: TNotifyEvent;
    FOnTrialUpDate: TNotifyEvent;
    FCbbStimulus: TComboBox;
    procedure MountBlc(Sender: TObject);
    procedure MountTrial(Sender: TObject);
    procedure NewFromBegin(Sender: TObject);
    procedure MountMain(Sender: TObject);
    procedure PosCfg (Sender: TObject);
    procedure BlcChange (Sender: TObject);
    procedure TrialChange (Sender: TObject);
    procedure TrialUpDate(Sender: TObject);
    procedure StmChange (Sender: TObject);

  public
    property Escriba : TEscriba read FEscriba write Fescriba;
    property OnPosCfg : TNotifyEvent read FOnBlcCfg write FOnBlcCfg;
    property OnBlcChange : TNotifyEvent read FOnBlcChange write FOnBlcChange;
    property OnTrialChange : TNotifyEvent read FOnTrialChange write FOnTrialChange;
    property OnStmChange : TNotifyEvent read FOnStmchange write FOnStmChange;
    property OnTrialUpDate : TNotifyEvent read FOnTrialUpDate write FOnTrialUpDate;
    property CbbStimulus : TComboBox read FCbbStimulus write FCbbStimulus;
    procedure Mount(Sender: TObject);
  end;
var
  fTools: TfTools;

implementation

uses  formMain, formBackGround, formPositionGetter, formNewSession,
      formBlocs, formTrials, formCheckBoxTree, formRandPosition,
      formRandTrialIndex;

{$R *.dfm}

procedure TfTools.btn1Click(Sender: TObject);
begin
  //ShowMessage (IntToStr (Fescriba.NumBlc));
end;

procedure TfTools.btnBlcClick(Sender: TObject);
begin
  if FEscriba.NumBlc > 0 then MountBlc(sender);
end;

procedure TfTools.btnTrialClick(Sender: TObject);
begin
  if FEscriba.NumBlc > 0 then
    if FEscriba.NumPos > 0 then MountTrial(sender)
end;

procedure TfTools.edtStimulusKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfTools.btnGerarPosicoesClick(Sender: TObject);
begin
  if not Assigned (fPositionGetter) then
    begin
      fMain.Visible   := False;
      fPositionGetter := TfPositionGetter.Create(fMain);
      fPositionGetter.OnPosCfg := PosCfg;
      if not Assigned (fBackGround) then
        begin
          fBackGround := TfBackGround.Create(fMain);
          fBackGround.Cursor := 0;
          fBackGround.Show;
        end;
      fPositionGetter.Show;
    end
  else
    begin
      if Assigned(fPositionGetter) then FreeAndNil (fPositionGetter);
      if Assigned(fBackGround) then FreeAndNil (fBackGround);
      btnGerarPosicoesClick (sender);
    end;
end;


procedure TfTools.btnNewSessionClick(Sender: TObject);
begin
  if FEscriba.RichEdit.Text = '' then
    begin
      if not Assigned (fNewSession) then
        begin
          fNewSession := TfNewSession.Create(fMain);
          try

            if fNewSession.ShowModal = mrOK then MountMain(sender);
          finally
            if Assigned(fNewSession) then
              begin
                fNewSession.Close;
                FreeAndNil(fNewSession);
              end;
          end;
        end
    end
  else
    begin
      if MessageDlg ('O editor de texto foi editado, reiniciar mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes then
        begin
          FEscriba.RichEdit.Text := '';
          NewFromBegin(sender);
        end;
    end;
end;

procedure TfTools.FormCreate(Sender: TObject);
begin
  Top:= 0;
  Left:=0;

  OnBlcChange := BlcChange;
  OnTrialChange := TrialChange;
  OnStmChange := StmChange;
  OnTrialUpDate := TrialUpDate;
  FEscriba := TEscriba.Create(fTools);
end;

procedure TfTools.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FEscriba);
end;

procedure TfTools.FormMouseEnter(Sender: TObject);
begin
  Self.Show;
end;

procedure TfTools.FormShow(Sender: TObject);
begin
  FEscriba.SetVariables;
end;

procedure TfTools.Mount(Sender: TObject);
begin
  MountBlc(sender);
  MountTrial(sender);
end;

procedure TfTools.MountBlc(Sender: TObject);
var blc : integer;
begin
  if not assigned (fBlocs) then
    begin
      if not FEscriba.IsLoaded then FEscriba.LengthVetBlc;
      fBlocs := TfBlocs.Create(fMain);
      with fBlocs do
        begin
          Escriba := FEscriba;
          SeBlc := Self.seBlc;
          SeTrial := Self.seTrial;
          GrpBlocos := fCheckBoxTree.grpBlocos;
          Top := Self.Top;
          Left := Self.Left + Self.Width + 1;
        end;

      if not Escriba.IsLoaded then
        for blc := 0 to Escriba.NumBlc - 1 do fBlocs.SetStandardParameters(blc);
      seBlc.Enabled := True;
      seBlc.Value := 1;
      with fCheckBoxTree do
        if WindowState = wsMinimized then begin
          WindowState := wsNormal;
          Show;
        end;
    end
  else
    begin
      with fBlocs do
        begin
          Top := Self.Top;
          Left := Self.Left + Self.Width + 1;
          Show;
        end;
    end;
  if not Escriba.IsLoaded then MountTrial(sender) else fTrials.NewPositions;
end;

procedure TfTools.MountMain(Sender: TObject);
begin
  FEscriba.SetMain;
  btnGerarPosicoesClick (sender);
end;

procedure TfTools.MountTrial(Sender: TObject);  //Escriba.IsLoaded é específico para o botão "Nova sessão"
var blc : integer;
begin
  if not Assigned (fTrials) then
    begin
      if not FEscriba.IsLoaded then
        for blc := 0 to FEscriba.NumBlc - 1 do FEscriba.LengthVetTrial (blc);
      fTrials := TfTrials.Create(fMain);
      with fTrials do
        begin
          Escriba := FEscriba;
          SeBlc := Self.seBlc;
          SeTrial := Self.seTrial;
          GrpBlc := fCheckBoxTree.grpBlocos;
          GrpTrial := fCheckBoxTree.grpTrial;
          GrpStm := fCheckBoxTree.grpStm;
          Top := Self.Top + 25;
          Left := Self.Left + Self.Width + 1;
        end;

      fCheckBoxTree.SeNumComp := fTrials.seNumComp;
      //seNumComp := Form13.SeNumComp;
      //seNumComp.Value := 1;

      fCheckBoxTree.CbbStimulus := fTrials.cbbStimulus;
      cbbStimulus := fTrials.cbbStimulus;

      if not FEscriba.IsLoaded then
        for blc := 0 to FEscriba.NumBlc - 1 do fTrials.SetStandardParameters(blc);
      if not (Escriba.HootMedia = '') then fTrials.SetHootMedia else
        begin
          Escriba.HootMedia := CurPath + '\Estímulos\';
          fTrials.SetHootMedia;
        end;
      fCheckBoxTree.ThereIsForm12 := True;
      seTrial.Enabled := True;
      seTrial.Value := 1;
      with fCheckBoxTree do
        if WindowState = wsMinimized then begin
          WindowState := wsNormal;
          Show;
        end;
    end
  else
    begin
      with fTrials do
        begin
          Top := Self.Top + 25;
          Left := Self.Left + Self.Width + 1;
          Show;
        end;
    end;
    if not Escriba.IsLoaded then
      begin
        Escriba.IsLoaded := True;
        fBlocs.Show;
        btnGerarPosicoes.Enabled := True;
      end;
end;

procedure TfTools.NewFromBegin(Sender: TObject);
begin
  if Assigned (fMain.OnNewFromBegin) then fMain.OnNewFromBegin(Sender);
end;

procedure TfTools.TrialUpDate(Sender: TObject);
var blc : integer;
begin
  for blc := 0 to FEscriba.NumBlc - 1 do fTrials.SetStandardParameters(blc);
end;

procedure TfTools.PosCfg(Sender: TObject);
begin
  btnBlcClick(Sender);
end;

procedure TfTools.seBlcChange(Sender: TObject);
begin
  if (seBlc.Value > 0) and (seBlc.Value <= FEscriba.NumBlc) then
    OnBlcChange (sender);
end;

procedure TfTools.seTrialChange(Sender: TObject);
begin
  if (seTrial.Value > 0) and (seTrial.Value <= FEscriba.CfgBlc[seBlc.Value - 1].NumTrials) then
    OnTrialChange (Sender);
end;

procedure TfTools.StmChange(Sender: TObject);
begin
  if Assigned (fBlocs) then fBlocs.OnStmChange (Sender);
  if Assigned (fTrials) then fTrials.OnStmChange (Sender);
  if Assigned (fCheckBoxTree) then fCheckBoxTree.OnStmChange (Sender);
  if Assigned(CbbStimulus) then
    edtStimulus.Text:= CbbStimulus.Items.Strings[CbbStimulus.ItemIndex];
end;

procedure TfTools.TrialChange(Sender: TObject);
var blc : integer;
begin
  //showmessage(Sender.ClassName);
  if (TButton(sender) = fBlocs.btnPlusTrial) or
     (TButton(sender) = fBlocs.btnMinusTrial) then
    begin
     for blc := 0 to FEscriba.NumBlc - 1 do fTrials.SetStandardParameters (blc);
     with seTrial do
        begin
          MaxValue := FEscriba.CfgBlc[seBlc.Value - 1].NumTrials;
          MinValue := 1;
          if (MinValue = 1) and (MaxValue = 1) then increment := 0 else increment := 1;
        end;
    end;
  if (TSpinEdit(Sender) = seTrial) and
     (FEscriba.NumBlc > 0) and
     (FEscriba.CfgBlc[seBlc.Value - 1].NumTrials > 0) then
    begin
      with seTrial do
        begin
          MaxValue := FEscriba.CfgBlc[seBlc.Value - 1].NumTrials;
          MinValue := 1;
          if (MinValue = 1) and (MaxValue = 1) then increment := 0 else increment := 1;
        end;
    end;
  {if Length (Escriba.CfgBlc[seBlc.Value - 1].VetCfgTrial) > 0 then
    with seNumComp do
      begin
        MaxValue := Escriba.CfgBlc[seBlc.Value - 1].VetCfgTrial[seTrial.Value - 1].NumComp;
        MinValue := 1;
        if (MinValue = 1) and (MaxValue = 1) then increment := 0 else increment := 1;
      end;}

  if Assigned (fBlocs) then fBlocs.OnTrialChange (Sender);
  if Assigned (fTrials) then fTrials.OnTrialChange (Sender);
  if Assigned (fCheckBoxTree) then fCheckBoxTree.OnTrialChange (Sender);
end;

procedure TfTools.BlcChange(Sender: TObject);
begin
  if (TSpinEdit(Sender) = seBlc) and
     (FEscriba.NumBlc > 0) then
    begin
      with seBlc do
        begin
          MaxValue := FEscriba.NumBlc;
          MinValue := 1;
          if (MinValue = 1) and (MaxValue = 1) then Increment := 0 else Increment := 1;
        end;
    end;
  if Assigned (fBlocs) then fBlocs.OnBlcChange (Sender);
  if Assigned (fTrials) then fTrials.OnBlcChange (Sender);
  if Assigned (fCheckBoxTree) then fCheckBoxTree.OnBlcChange (Sender);
end;

end.
