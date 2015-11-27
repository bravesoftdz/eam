unit formTrials;

interface

uses
  uEscriba, uConstants, uKey,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, ExtDlgs, Menus,
  PlatformDefaultStyleActnCtrls, ActnPopup, ComCtrls, ToolWin, Buttons;

type
  TfTrials = class(TForm)
    pnl1: TPanel;
    pnlMTS: TPanel;
    pnlMsg: TPanel;
    pnlBkGnd: TPanel;
    lblmilisegundos: TLabel;
    lblCursor: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    rgAutoNxt: TRadioGroup;
    rgKind: TRadioGroup;
    mmoMsg: TMemo;
    seNumComp: TSpinEdit;
    seCursor: TSpinEdit;
    seWidth: TSpinEdit;
    seFontSize: TSpinEdit;
    seSBnd: TSpinEdit;
    pnlFont: TPanel;
    pnlSimple: TPanel;
    grp1: TGroupBox;
    grpTrialName: TGroupBox;
    grpTrialShow: TGroupBox;
    grp5: TGroupBox;
    grp6: TGroupBox;
    grp7: TGroupBox;
    grp8: TGroupBox;
    grp9: TGroupBox;
    grpSampName: TGroupBox;
    grpSampSch: TGroupBox;
    grpSampBnd: TGroupBox;
    grpSampMsg: TGroupBox;
    grpStmC: TGroupBox;
    grpSPic: TGroupBox;
    grpComparison: TGroupBox;
    edtDelay: TEdit;
    edtName: TEdit;
    edtCustomNxtValue: TEdit;
    rgCorrection: TRadioGroup;
    rgHasDelay: TRadioGroup;
    dlgColor1: TColorDialog;
    rgPrompt: TRadioGroup;
    picDlg: TOpenPictureDialog;
    pmStm: TPopupMenu;
    grpStmControl: TGroupBox;
    cbbStimulus: TComboBox;
    pmWrite: TPopupMenu;
    pmParameters: TPopupMenu;
    miStmLine2: TMenuItem;
    miStmUnd: TMenuItem;
    miStmChk: TMenuItem;
    miStmTrialUnd: TMenuItem;
    miStmTrialChk: TMenuItem;
    miStmBlcUnd: TMenuItem;
    miStmAll: TMenuItem;
    miStmBlcChk: TMenuItem;
    miStmStimulusParameters: TMenuItem;
    miStmLine3: TMenuItem;
    miPStm: TMenuItem;
    miPUsb: TMenuItem;
    miPCsq: TMenuItem;
    miPRes: TMenuItem;
    miPBnd: TMenuItem;
    miPSch: TMenuItem;
    miPMsg: TMenuItem;
    miPNxt: TMenuItem;
    mi1: TMenuItem;
    miPrmLine1: TMenuItem;
    mi4: TMenuItem;
    miPrmLine2: TMenuItem;
    mi2: TMenuItem;
    mi10: TMenuItem;
    miWriteBlcAll: TMenuItem;
    miWriteK: TMenuItem;
    miPrmUnd: TMenuItem;
    miPrmChk: TMenuItem;
    miPrmBlcUnd: TMenuItem;
    miPrmBlcChk: TMenuItem;
    miPrmAll: TMenuItem;
    miStmStandard: TMenuItem;
    miPrmLine3: TMenuItem;
    miPmPic: TMenuItem;
    miPmUsb: TMenuItem;
    miPmCsq: TMenuItem;
    miPmRes: TMenuItem;
    miPmBnd: TMenuItem;
    miPmSch: TMenuItem;
    miPmMsg: TMenuItem;
    miPmNxt: TMenuItem;
    miSPic: TMenuItem;
    miSBnd: TMenuItem;
    miSSch: TMenuItem;
    miSMsg: TMenuItem;
    miSDelay: TMenuItem;
    miSAll: TMenuItem;
    miPrmLine4: TMenuItem;
    miStmLine1: TMenuItem;
    miStmSampleParameters: TMenuItem;
    miStmLine4: TMenuItem;
    miSmPic: TMenuItem;
    miSmBnd: TMenuItem;
    miSmSch: TMenuItem;
    miSmMsg: TMenuItem;
    miSmAll: TMenuItem;
    miPmAll: TMenuItem;
    miPAll: TMenuItem;
    miMessenge: TMenuItem;
    miSStmStandard: TMenuItem;
    miPrmLine5: TMenuItem;
    miSmDelay: TMenuItem;
    miPrmUnd2: TMenuItem;
    miPrmChk2: TMenuItem;
    miPrmBlcUnd2: TMenuItem;
    miPrmBlcChk2: TMenuItem;
    miPrmAll2: TMenuItem;
    miStmLine5: TMenuItem;
    ToolBar1: TToolBar;
    btnStm: TToolButton;
    btnParameters: TToolButton;
    btnWrite: TToolButton;
    s1: TToolButton;
    btnRand2: TToolButton;
    ToolButton1: TToolButton;
    btnAplicar: TBitBtn;
    BalloonHint1: TBalloonHint;
    miMain: TMenuItem;
    miPositions: TMenuItem;
    btnTrialOrder: TToolButton;
    miPOut: TMenuItem;
    miWriteKplus: TMenuItem;
    miPmOut: TMenuItem;
    edtSStm: TEdit;
    edtSMsg: TEdit;
    edtSSch: TEdit;
    pnlSCol: TPanel;
    miWriteSessionAndSave: TMenuItem;
    mi9: TMenuItem;
    tbcStimulus: TTabControl;
    grpConsequence: TGroupBox;
    grpConseqUsb: TGroupBox;
    seUSB: TSpinEdit;
    grpConseqPPP: TGroupBox;
    seCsq: TSpinEdit;
    grpConseqOut: TGroupBox;
    edtOut: TEdit;
    grpConseqNxt: TGroupBox;
    seNxt: TSpinEdit;
    grpCompStm: TGroupBox;
    edtStm: TEdit;
    pnlCol: TPanel;
    grpCompSch: TGroupBox;
    edtSch: TEdit;
    grpCompBnd: TGroupBox;
    seBnd: TSpinEdit;
    grpCompMsg: TGroupBox;
    edtMsg: TEdit;
    grpConseqName: TGroupBox;
    edtConseqPic: TEdit;
    grpConseqPic: TGroupBox;
    miPmConseqPic: TMenuItem;
    miPCsqStm: TMenuItem;
    pnlCsqPic: TPanel;
    rgRes: TRadioGroup;
    pnlSaved: TPanel;
    btn1: TToolButton;
    tmrSaved: TTimer;
    chkAutoSave: TCheckBox;
    grpConseqTmn: TGroupBox;
    edtTmn: TEdit;
    btnPlayStopPreview: TBitBtn;
    btnAutoStm: TToolButton;
    procedure rgKindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlBkGndDblClick(Sender: TObject);
    procedure seNumCompChange(Sender: TObject);
    procedure rgAutoNxtClick(Sender: TObject);
    procedure edtCustomNxtValueKeyPress(Sender: TObject; var Key: Char);
    procedure cbbStimulusChange(Sender: TObject);
    procedure grpPicDblClick(Sender: TObject);
    procedure seCursorChange(Sender: TObject);
    procedure miStmUndClick(Sender: TObject);
    procedure btnRandClick(Sender: TObject);
    procedure pmStmPopup(Sender: TObject);
    procedure stmStandardClick(Sender: TObject);
    procedure rgHasDelayClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnTrialOrderClick(Sender: TObject);      //abrir Form14
    procedure FormClose(Sender: TObject; var Action: TCloseAction);     //Vazio
    procedure seUSBChange(Sender: TObject);
    procedure edtNameExit(Sender: TObject);
    procedure tmrSavedTimer(Sender: TObject);
    procedure grpComparisonMouseEnter(Sender: TObject);
    procedure grpComparisonMouseLeave(Sender: TObject);
    procedure btnPlayStopPreviewMouseEnter(Sender: TObject);
    procedure btnPlayStopPreviewMouseLeave(Sender: TObject);
    procedure grp1MouseEnter(Sender: TObject);
    procedure btnPlayStopPreviewClick(Sender: TObject);
    procedure FormMouseEnter(Sender: TObject);
    procedure pnl1MouseEnter(Sender: TObject);
    procedure edtOutKeyPress(Sender: TObject; var Key: Char);
    procedure btnAutoStmClick(Sender: TObject);

  private
    FPlayStopFocus : Boolean;
    FPosX : integer;
    FPosY : integer;
    FComparisonPreview : TKey;
    FSamplePreview : TKey;
    FConsequencePreview : TKey;
    FEscriba : TEscriba;
    FSeBlc : TSpinEdit;
    FSeTrial : TSpinEdit;
    FGrpBlc : TGroupbox;
    FGrpTrial : TGroupbox;
    FGrpStm : TGroupbox;
    FOnBlcChange : TNotifyEvent;
    FOnTrialChange: TNotifyEvent;
    FOnStmChange: TNotifyEvent;
    //get from form
    function GetAutonxt : String;
    function GetDelay : String;
    function GetRes : String;
    function GetKind : String;
    function GetPrompt : String;
    //set to form
    procedure SetStmPreview(GrpBox : ShortInt; FullPath : String);
    procedure SetAutoNxt(anxt : String);
    procedure SetPrompt(aprompt : string);
    procedure SetDelay(adelay: string);
    procedure SetNumComp(n : Integer);
    procedure SetPnlColor(Pnl : TPanel; cColor : string);
    procedure SetRgRes(stm : integer);
    procedure SetSeBnd(stm : integer);
    procedure SetSeSBnd(stm : integer);
    procedure SetSeCursor(cursor : string);
    procedure SetSeCsq(stm : integer);
    procedure SetSeNxt(stm : integer);
    procedure SetSeUSB(stm : integer);
    procedure SetTimeOut(stm : integer);
    procedure SetTrialKind(Kind : String);
    //set to memory
    procedure SaveStandardStmParameters(b, t, i : integer);
    procedure SaveStandardSStmParameters(b, t: integer);
    procedure SaveTrialParameters(blc, trial :  integer);
    procedure SaveStmParameters(b, t, i : integer);
    procedure RefreshStmParameters;
    procedure RefreshTrialParameters(Sender: TObject;Trial : Integer);
    //form control
    procedure SeBlcChange(Sender: TObject);
    procedure SeTrialChange(Sender: TObject);
    procedure StimulusChange(Sender: TObject);
    procedure SetStmParametersFrom(thisBlc, thisTrial, thisStm, toBlc, toTrial, toStm : integer);
    procedure Form14Close(Sender: TObject; var Action: TCloseAction);
    procedure Form15Close(Sender: TObject; var Action: TCloseAction);
    procedure Form16Close(Sender: TObject; var Action: TCloseAction);
    //conditional save

  public
    procedure SetHootMedia;
    procedure NewPositions;
    procedure SetStandardParameters (Blc : Integer);
    property Escriba : TEscriba read FEscriba write FEscriba;
    property SeBlc : TSpinEdit read FSeBlc write FSeBlc;
    property SeTrial : TSpinEdit read FSeTrial write FSeTrial;
    property GrpBlc : TGroupbox read FGrpBlc write FGrpBlc;
    property GrpTrial : TGroupbox read FGrpTrial write FGrpTrial;
    property GrpStm : TGroupbox read FGrpStm write FGrpStm;
    property OnBlcChange : TNotifyEvent read FOnBlcChange write FOnBlcChange;
    property OnTrialChange : TNotifyEvent read FOnTrialChange write FOnTrialChange;
    property OnStmChange : TNotifyEvent read FOnStmChange write FOnStmChange;
  end;

var
  fTrials: TfTrials;

implementation

uses formMain, formTools, formRandPosition, formRandTrialIndex, formRandStimuliSet;

{$R *.dfm}

procedure TfTrials.btnAplicarClick(Sender: TObject);
var HighStm, i, blc, trial : integer;
begin
  //Parâmetros das Tentativas
  if miPrmUnd.Checked or miPrmUnd2.Checked then
    begin
      SaveTrialParameters(SeBlc.Value -1, SeTrial.Value -1);
      if miStmStandard.Checked then
       begin
          HighStm := Escriba.Blcs[SeBlc.Value -1].VetCfgTrial[SeTrial.Value -1].NumComp;
          for i := 0 to HighStm - 1 do SaveStmParameters (SeBlc.Value -1, SeTrial.Value -1, i);
       end;
    end;

  if miPrmChk.Checked or miPrmChk2.Checked then
    begin
      for trial := 0 to GrpTrial.ComponentCount -1 do
        if GrpTrial.Components[trial] is TCheckBox  then
          if TCheckBox(GrpTrial.Components[trial]).Checked then
            begin
              SaveTrialParameters (SeBlc.Value -1, trial);
              if miStmStandard.Checked then
                begin
                  HighStm := Escriba.CfgBlc[SeBlc.Value -1].VetCfgTrial[trial].NumComp;
                  for i := 0 to HighStm -1 do SetStmParametersFrom (SeBlc.Value -1, SeTrial.Value -1, i, SeBlc.Value -1, trial, i);
                end;
            end;
    end;
  if miPrmBlcUnd.Checked or miPrmBlcUnd2.Checked then
    begin
      for trial := 0 to GrpTrial.ComponentCount -1 do
        begin
          SaveTrialParameters (SeBlc.Value -1, trial);
          if miStmStandard.Checked then
            begin
              HighStm := Escriba.CfgBlc[SeBlc.Value -1].VetCfgTrial[trial].NumComp;
              for i := 0 to HighStm -1 do SetStmParametersFrom (SeBlc.Value -1, SeTrial.Value -1, i, SeBlc.Value -1, trial, i);
            end;
        end;
    end;
  if miPrmBlcChk.Checked or miPrmBlcChk2.Checked then
    begin
      for blc := 0 to GrpBlc.ComponentCount -1 do
        if GrpBlc.Components[blc] is TCheckBox  then
          if TCheckBox(GrpBlc.Components[blc]).Checked then
            for trial := 0 to (Escriba.CfgBlc[blc].NumTrials -1) do
              begin
                SaveTrialParameters (blc, trial);
                if miStmStandard.Checked then
                  begin
                    HighStm := Escriba.CfgBlc[blc].VetCfgTrial[trial].NumComp;
                    for i := 0 to HighStm -1 do SetStmParametersFrom (SeBlc.Value -1, SeTrial.Value -1, i, blc, trial, i);
                  end;
              end;
    end;
  if miPrmAll.Checked or miPrmAll2.Checked then
    begin
      for blc := 0 to GrpBlc.ComponentCount -1 do
            for trial := 0 to (Escriba.CfgBlc[blc].NumTrials -1) do
              begin
                SaveTrialParameters (blc, trial);
                if miStmStandard.Checked then
                  begin
                    HighStm := Escriba.CfgBlc[blc].VetCfgTrial[trial].NumComp;
                    for i := 0 to HighStm -1 do SetStmParametersFrom (SeBlc.Value -1, SeTrial.Value -1, i, blc, trial, i);
                  end;
              end;
    end;
  //Configurações das Comparações
  if miStmUnd.Checked then SaveStmParameters(SeBlc.Value -1, SeTrial.Value -1, cbbStimulus.ItemIndex);
  if miStmChk.Checked then
    begin
      for i := 0 to GrpStm.ComponentCount -1 do
        if GrpStm.Components[i] is TCheckBox  then
          if TCheckBox(GrpStm.Components[i]).Checked then
            SaveStmParameters (SeBlc.Value -1, SeTrial.Value -1, i);
    end;
  if miStmTrialUnd.Checked then
    begin
      for i := 0 to GrpStm.ComponentCount -1 do
            SaveStmParameters (SeBlc.Value -1, SeTrial.Value -1, i);
    end;
  if miStmTrialChk.Checked then
    begin
      for trial := 0 to GrpTrial.ComponentCount -1 do
        if GrpTrial.Components[trial] is TCheckBox  then
          if TCheckBox(GrpTrial.Components[trial]).Checked then
            begin
              HighStm := Escriba.CfgBlc[SeBlc.Value -1].VetCfgTrial[trial].NumComp;
              for i := 0 to HighStm -1 do SaveStmParameters (SeBlc.Value -1, trial, i);
            end;
    end;
  if miStmBlcUnd.Checked then
    begin
      for trial := 0 to (Escriba.CfgBlc[SeBlc.Value -1].NumTrials -1) do
        begin
          HighStm := Escriba.CfgBlc[SeBlc.Value -1].VetCfgTrial[trial].NumComp;
          for i := 0 to HighStm - 1 do SaveStmParameters (SeBlc.Value -1, trial, i);
        end;
    end;
  if miStmBlcChk.Checked then
    begin
      for blc := 0 to GrpBlc.ComponentCount -1 do
        if GrpBlc.Components[blc] is TCheckBox  then
          if TCheckBox(GrpBlc.Components[blc]).Checked then
            for trial := 0 to (Escriba.CfgBlc[blc].NumTrials -1) do
              begin
                HighStm := Escriba.CfgBlc[blc].VetCfgTrial[trial].NumComp;
                for i := 0 to HighStm - 1 do SaveStmParameters (blc, trial, i);
              end;
    end;
  if miStmAll.Checked then
    begin
      for blc := 0 to GrpBlc.ComponentCount -1 do
        for trial := 0 to (Escriba.CfgBlc[blc].NumTrials -1) do
           for i := 0 to Escriba.Blcs[blc].VetCfgTrial[trial].NumComp -1 do
              SaveStmParameters (blc, trial, i);
    end;
  //Escrita
  if miWriteK.Checked then Escriba.SetK(True) else Escriba.SetK(False); //precisa ser o primeiro

  if miMain.Checked then Escriba.SetMain;

  if miPositions.Checked then Escriba.SetPosWriteOnly;

  if miWriteBlcAll.Checked then
    for blc := 0 to Escriba.NumBlc - 1 do
      begin
        Escriba.SetBlc(blc, True);
        for trial := 0 to Escriba.Blcs[blc].NumTrials - 1 do Escriba.SetTrial(trial);
      end;
  if miWriteSessionAndSave.Checked  then
    begin
      Escriba.CleanRichEditPlease;
      Escriba.SetMain;
      Escriba.SetPosWriteOnly;
      for blc := 0 to Escriba.NumBlc - 1 do
      begin
        Escriba.SetBlc(blc, True);
        for trial := 0 to Escriba.Blcs[blc].NumTrials - 1 do Escriba.SetTrial(trial);
      end;
    end;

  if miWriteKplus.Checked then Escriba.SetKplusAfterPositiveTrialOnly;  //deve ser a última chamada ao Escriba, pois substitui o texto final presente no editor;
  if miWriteSessionAndSave.Checked  then fMain.btnSalvarTextoClick(Sender); //repetição da condicionalidade miWriteSessionAndSave para evitar repetição do comando SetKplusAfterPositiveTrialOnly;

  for i := 0 to pmStm.Items.Count - 1 do TMenuItem(pmStm.Items[i]).Checked := False;
  for i := 0 to pmParameters.Items.Count - 1 do TMenuItem(pmParameters.Items[i]).Checked := False;
  for i := 0 to pmWrite.Items.Count - 1 do TMenuItem(pmWrite.Items[i]).Checked := False;

  tmrSaved.Enabled:= True;
  with pnlSaved do
    begin
      Color:= clLime;
      Caption:= 'SALVO';
    end;
end;

procedure TfTrials.btnAutoStmClick(Sender: TObject);
begin
  if not Assigned(fRandStimuliSet) then
  begin
    fRandStimuliSet := TfRandStimuliSet.Create(Self);        //aleatorizar posições dos estímulos
    with fRandStimuliSet do
      begin
        Escriba := FEscriba;
        SeBlc := FSeBlc;
        OnClose := Form15Close;
        SetControls;
        Show;
      end;
  end
  else fRandStimuliSet.Show;
end;

procedure TfTrials.btnPlayStopPreviewClick(Sender: TObject);
var i : integer;
begin
  for i := 0 to btnPlayStopPreview.Parent.ComponentCount - 1 do
    if btnPlayStopPreview.Parent.Components[i].ClassType = TKey then
      TKey(btnPlayStopPreview.Parent.Components[i]).Play;
end;

procedure TfTrials.btnPlayStopPreviewMouseEnter(Sender: TObject);
begin
  FPlayStopFocus := True;
end;

procedure TfTrials.btnPlayStopPreviewMouseLeave(Sender: TObject);
begin
  FPlayStopFocus := False;
end;

procedure TfTrials.btnRandClick(Sender: TObject);
begin
  if not Assigned(fRandPosition) then
  begin
    fRandPosition := TfRandPosition.Create(Self);        //aleatorizar posições dos estímulos
    with fRandPosition do
      begin
        Escriba := FEscriba;
        OnClose := Form14Close;
        WindowState := wsMaximized;
        CellsGenerator(seBlc.value -1);
        Show;
      end;
  end
  else fRandPosition.Show;
end;

procedure TfTrials.btnTrialOrderClick(Sender: TObject);
begin
  if not Assigned(fRandTrialIndex) then
  begin
    fRandTrialIndex := TfRandTrialIndex.Create (fMain);    //aleatorizar ordem das tentativas
    with fRandTrialIndex do
      begin
        Escriba := FEscriba;
        Onclose := Form16Close;
        WindowState := wsMaximized;
        CellsGenerator(seBlc.value -1);
        Show;
      end;
  end
  else fRandTrialIndex.Show;
end;

procedure TfTrials.edtCustomNxtValueKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet (Key, ['0'..'9', #8, #9]) then Key := #0;
end;

procedure TfTrials.edtNameExit(Sender: TObject);
var s1, s2, s3, s4 : string;
    b, t, c, i : integer;
  procedure _BeginEndUpDate(_Begin : Boolean);
  begin
    if (sender = pnlBkGnd) or (sender = seNxt) or (sender = rgCorrection) or
     (sender = seFontSize) or (sender = seWidth) or (sender = mmoMsg) or
     (sender = rgPrompt) or (sender = seBnd) or (sender = seCsq) or
     (sender = seUSB) or (sender = rgRes) or (sender = edtMsg) or
     (sender = edtSch) or (sender = edtOut) or (sender = edtConseqPic) or
     (sender = pnlCsqPic) or (sender = edtStm) or (sender = pnlCol) or
     (sender = seSBnd) or (sender = edtDelay) or (sender = rgAutoNxt) or
     (sender = edtCustomNxtValue) or (sender = seCursor) or (sender = edtSStm) or
     (sender = pnlSCol) or (sender = edtSSch) or (sender = edtSMsg) or
     (sender = rgHasDelay) or (sender = edtTmn) then
    begin
      if _Begin then FEscriba.Blcs[b].VetCfgTrial[t].SList.BeginUpdate
      else FEscriba.Blcs[b].VetCfgTrial[t].SList.EndUpdate;
    end;
  end;

  procedure SepStrings (var as1, as2, as3, as4 : string; csqEdt : string);
  var s0 : string;
  begin
    s0 := csqEdt;
    as1:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as2:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as3:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as4:= Copy(s0, 0, pos(#32, s0)-1);
  end;
begin
  if Escriba.IsLoaded and chkAutoSave.Checked then
  begin
    b := SeBlc.Value -1;
    t := SeTrial.Value -1;
    c := cbbStimulus.ItemIndex + 1;
    //Parâmetros da tentativa
    if sender = edtName then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].Name := edtName.Text;
      end;

    if sender = edtTmn then
      begin
        SepStrings(s1, s2, s3, s4,
                   FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cIET] + #32);
        s4 := edtTmn.Text;
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cIET] :=
                                                                s1 + #32 + s2 + #32 +  s3 + #32 +  s4;
        edtTmn.Text := s4;
        edtConseqPic.Text := FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cIET];
      end;

    if sender = rgKind then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].Kind:= GetKind;
      end;
    if sender = seNumComp then
      begin
        if FEscriba.Blcs[b].VetCfgTrial[t].Kind = T_Msg then
          FEscriba.Blcs[b].VetCfgTrial[t].NumComp := 1;

        if (FEscriba.Blcs[b].VetCfgTrial[t].Kind = T_Simple) or
           (FEscriba.Blcs[b].VetCfgTrial[t].Kind = T_MTS) then
          FEscriba.Blcs[b].VetCfgTrial[t].NumComp := seNumComp.Value;
      end;

    _BeginEndUpDate(True);
    if sender = pnlBkGnd then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_BkGnd] := IntToStr (pnlBkGnd.color);
      end;
    if (sender = rgAutoNxt) then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_AutoNxt] := GetAutoNxt;
      end;
    if sender = edtCustomNxtValue then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_CustomNxtValue] := edtCustomNxtValue.Text;
      end;
    if sender = seCursor then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Cursor] := IntToStr (seCursor.Value);
      end;
    //modelo
    if (sender = edtSStm) or (sender = pnlSCol) then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Samp + _cStm] := edtSStm.Text;
      end;
    if sender = edtSSch then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Samp + _cSch] := edtSSch.Text;
      end;
    if sender = edtSMsg then       //REVER ISSO AQUI
      begin
          if edtSMsg.Text = 'AUTO' then
            begin
              FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Samp + _cMsg] :=
                Copy(FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Samp + _cStm], 0, 2) +
                ' - ' +
                FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Samp + _cBnd];
              edtSMsg.Text:= FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Samp + _cMsg];
            end
          else FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Samp + _cMsg] := edtSMsg.Text;
      end;
    if sender = rgHasDelay then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Delayed] := GetDelay;
      end;
    if sender = edtDelay then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Delay] := edtDelay.Text;
      end;
    if sender = seSBnd then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Samp + _cBnd] := IntToStr(seSBnd.Value);
      end;
    //Comparação
    if (sender = edtStm) or (sender = pnlCol) then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cStm] := edtStm.Text;
      end;
    if (sender = edtConseqPic) or (sender = pnlCsqPic) then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cIET] := edtConseqPic.Text;
      end;
    if sender = edtOut then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cTO] := edtOut.Text;
      end;
    if sender = edtSch then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cSch] := edtSch.Text;
      end;
    if sender = edtMsg then
      begin
        if edtMsg.Text = 'AUTO' then
          begin
            FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cMsg] :=
              Copy(FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cStm], 0, 2) +
              ' - ' +
              FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cBnd];
            edtMsg.Text := FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cMsg];
          end
        else FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cMsg] := edtMsg.Text;
      end;
    if sender = rgRes then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cRes] := GetRes;
      end;
    if sender = seUSB then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cUsb] := IntToStr (seUSB.Value);
      end;
    if sender = seCsq then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cCsq] := IntToStr (seCsq.Value);
      end;
    if (sender = seNxt) or (sender = rgCorrection)then
      begin
        case rgCorrection.ItemIndex of
          0:  FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cNxt] := IntToStr (seNxt.Value);

          1:  begin
                for i := 1 to FEscriba.Blcs[b].VetCfgTrial[t].NumComp do
                  if i = 1 then FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(i) + _cNxt] := IntToStr (seNxt.Value)
                  else FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(i) + _cNxt] := T_REP;
              end;
        end;
      end;
    if sender = seBnd then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cBnd] := IntToStr (seBnd.Value);
      end;
    //Mensagem
    if sender = rgPrompt then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Prompt] := GetPrompt;
      end;
    if sender = mmoMsg then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_Msg] := mmoMsg.Text;
      end;
    if sender = seWidth then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_MsgWidth] := IntToStr (seWidth.Value);
      end;
    if sender = seFontSize then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_MsgFontSize] := IntToStr (seFontSize.Value);
      end;
    if sender = pnlFont then
      begin
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values[_MsgFontColor] := IntToStr (pnlFont.color);
      end;
    _BeginEndUpDate(False);
    tmrSaved.Enabled:= True;
    with pnlSaved do
      begin
        Color:= clLime;
        Caption:= 'SALVO';
      end;
  end;
end;

procedure TfTrials.edtOutKeyPress(Sender: TObject; var Key: Char);
begin
//
end;

function TfTrials.GetAutonxt: String;
begin
  case rgAutoNxt.ItemIndex of
    0 : Result := '-1';
    1 : Result := '0';
  end;
end;

function TfTrials.GetDelay: String;
begin
  case rgHasDelay.ItemIndex of
    0 : Result := '0';
    1 : Result := '-1';
  end;
end;

function TfTrials.GetKind: String;
begin
  case rgKind.ItemIndex of
    0 : Result := T_Msg;
    1 : Result := T_Simple;
    2 : Result := T_MTS;
  end;
end;

procedure TfTrials.SetStmPreview(GrpBox : ShortInt; FullPath: String);
var Key : TKey;
begin
  if FileExists (FullPath) then
    begin //showmessage('fileexists');
      case GrpBox of
        0: begin //showmessage(inttostr(0));
             if assigned (FSamplePreview)then
              begin //showmessage('filenamekey=' + FSamplePreview.FileName + #13#10 + 'filenameout=' + filename);
                if FSamplePreview.FullPath <> FullPath then
                  begin
                    FreeAndNil(FSamplePreview);
                    Key := TKey.Create(grpSPic);
                    Key.Parent:= grpSPic;
                  end
                else Exit;
              end
             else
              begin
                Key := TKey.Create(grpSPic);
                Key.Parent:= grpSPic;
              end;
           end;
        1: begin //showmessage(inttostr(1));
             if assigned (FComparisonPreview)then
              begin //showmessage('filenamekey=' + FComparisonPreview.FileName + #13#10 + 'filenameout=' + filename);
                if FComparisonPreview.FullPath <> FullPath then
                  begin
                    FreeAndNil(FComparisonPreview);
                    Key := TKey.Create(grpComparison);
                    Key.Parent := grpComparison;
                  end
                else Exit;
              end
             else
              begin
                Key := TKey.Create(grpComparison);
                Key.Parent := grpComparison;
              end;
           end;
        2: begin //showmessage(inttostr(2));
             if assigned (FConsequencePreview)then
              begin //showmessage('filenamekey=' + FConsequencePreview.FileName + #13#10 + 'filenameout=' + filename);
                if FConsequencePreview.FullPath <> FullPath then
                  begin
                    FreeAndNil(FConsequencePreview);
                    Key := TKey.Create(grpConseqPic);
                    Key.Parent := grpConseqPic;
                  end
                else Exit;
              end
             else
              begin
                Key := TKey.Create(grpConseqPic);
                Key.Parent := grpConseqPic;
              end;
           end;
      else Key := Nil;
      end;
      if Assigned(Key) then
      begin
        Key.EditMode := True;
        //FKey.OnResponse:= Response;
        Key.SetBounds(15, 15, 110, 110);
        Key.Cursor:= -21;
        Key.FullPath:= FullPath;
        Key.Schman.Kind := T_DRH + #32 + '2 1 0 0';
        Key.OnConsequence := grpPicDblClick;

        case GrpBox of
          0: FSamplePreview := Key;
          1: FComparisonPreview := Key;
          2: FConsequencePreview := Key;
        end;

        case GrpBox of
          0: FSamplePreview.Play;
          1: FComparisonPreview.Play;
          2: FConsequencePreview.Play;
        end;
      end;
    end
  else
    begin //showmessage('fileexists false');
      case GrpBox of
        0: if assigned (FSamplePreview) then FreeAndNil(FSamplePreview);
        1: if assigned (FComparisonPreview) then FreeAndNil(FComparisonPreview);
        2: if assigned (FConsequencePreview) then FreeAndNil(FConsequencePreview);
      end;
    end;
end;

function TfTrials.GetPrompt: String;
begin
  case rgPrompt.ItemIndex of
    0 : Result := '0';
    1 : Result := '-1';
  end;
end;

function TfTrials.GetRes: String;
begin
  case rgRes.ItemIndex of
    0 : Result := T_MISS;
    1 : Result := T_HIT;
    2 : Result := T_NONE;
  end;
end;

procedure TfTrials.grp1MouseEnter(Sender: TObject);
begin
  FPlayStopFocus := False;
  btnPlayStopPreview.Visible := False;
end;

procedure TfTrials.grpComparisonMouseEnter(Sender: TObject);
begin
  btnPlayStopPreview.Parent := TGroupBox(Sender);
  btnPlayStopPreview.BringToFront;
  btnPlayStopPreview.Left := 0;
  btnPlayStopPreview.Top := TGroupBox(Sender).Height - btnPlayStopPreview.Height;
  FPlayStopFocus := True;
  btnPlayStopPreview.Visible := True;
end;

procedure TfTrials.grpComparisonMouseLeave(Sender: TObject);
begin
  if not FPlayStopFocus then btnPlayStopPreview.Visible := False;
end;

procedure TfTrials.grpPicDblClick(Sender: TObject);
var s0,s1, s2, s3, s4 : string; stm : integer;
  procedure SetValuesToStrings(var as1, as2, as3, as4 : string);
  begin
    as1:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as2:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as3:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as4:= Copy(s0, 0, pos(#32, s0)-1);
  end;
  procedure SavedPrompt;
  begin
    with pnlSaved do
      begin
        Color:= clLime;
        Caption:= 'SALVO';
      end;
  end;
begin
  s0 := '';
  s1 := '';
  s2 := '';
  s3 := '';
  s4 := '';

  if (TGroupBox(Sender) = grpSPic) or
   (TKey(Sender) = FSamplePreview) or
   (TEdit(Sender) = edtSStm) then
  begin
    if picDlg.Execute then
      begin
        s0:= Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Samp + _cStm] + ' ';
        SetValuesToStrings(s1, s2, s3, s4);
        s1:= picDlg.FileName;
        SetStmPreview (0, s1);
        if s1 = '' then s1 := 'Escolher'; if s2 = '' then s2 := '0'; if s3 = '' then s3 := '255';
        edtSStm.Text := ExtractFileName(s1) + #32 + s2 + #32 + s3;
        Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.BeginUpdate;
        Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Samp + _cStm] := edtSStm.Text;
        Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.EndUpdate;
        SavedPrompt;
      end;
  end;

  if (TGroupBox(Sender) = grpComparison) or
     (TKey(Sender) = FComparisonPreview) or
     (TEdit(Sender) = edtStm) then
  begin
    if cbbStimulus.ItemIndex = -1 then ShowMessage('Selecione um Estímulo de Comparação no Controle de Estímulos')
    else
      if picDlg.Execute then
        begin
          stm := cbbStimulus.itemindex + 1;
          s0:= Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cStm] + ' ';
          SetValuesToStrings(s1, s2, s3, s4);
          s1:= picDlg.FileName;
          SetStmPreview (1, s1);
          if s1 = '' then s1 := 'Escolher'; if s2 = '' then s2 := '0'; if s3 = '' then s3 := '255';
          edtStm.Text := ExtractFileName(s1) + #32 + s2 + #32 + s3;
          Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.BeginUpdate;
          Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values [_Comp + IntToStr(stm) + _cStm] := edtStm.Text;
          Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.EndUpdate;
          SavedPrompt;
        end;
  end;

  if (TGroupBox(Sender) = grpConseqPic) or
   (TKey(Sender) = FConsequencePreview) or
   (TEdit(Sender) = edtConseqPic) then
  begin
    if cbbStimulus.ItemIndex = -1 then ShowMessage('Selecione um Estímulo de Comparação no Controle de Estímulos')
    else
      if picDlg.Execute then
      begin
        stm := cbbStimulus.itemindex + 1;
        s0:= Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cIET] + ' ';
        SetValuesToStrings(s1, s2, s3, s4);
        s1:= picDlg.FileName;
        SetStmPreview (2, s1);

        if s1 = '' then s1 := 'Escolher';
        if s2 = '' then s2 := '0';
        if s3 = '' then s3 := '255';
        if s4 = '' then s4 := '0';

        edtConseqPic.Text := ExtractFileName(s1) + #32 + s2 + #32 + s3 + #32 + s4;
        Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.BeginUpdate;
        Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values [_Comp + IntToStr(stm) + _cIET] := edtConseqPic.Text;
        Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.EndUpdate;
        SavedPrompt;
        //showmessage(Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values [_Comp + IntToStr(stm) + _cIET]);
      end;
  end;
end;

procedure TfTrials.pmStmPopup(Sender: TObject);
begin
  FPosX := TPopUpMenu(Sender).PopupPoint.X;
  FPosY := TPopUpMenu(Sender).PopupPoint.Y;
end;

procedure TfTrials.pnl1MouseEnter(Sender: TObject);
begin
  fTrials.Show;
end;

procedure TfTrials.pnlBkGndDblClick(Sender: TObject);
var cColor, stm : integer; s0, s1, s2, s3 : string;
  procedure PanelConfig (var Panel : TPanel);
  begin
    if Panel = pnlCsqPic then
      s0:= Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cIET] + ' ';
    if Panel = pnlcol then
      s0:= Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cStm] + ' ';
    if Panel = pnlScol then
      s0:= Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Samp + _cStm] + ' ';
    showmessage(s0);
    s1:= '';
    s2:= '';
    s3:= IntToStr(dlgColor1.Color);

    s1:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    s2:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    //s3:= Copy(s0, 0, pos(#32, s0)-1);

    if s1 = '' then s1 := 'Escolher';
    if s2 = '' then s2 := '0';
    if s3 = '' then s3 := '255';

    if Panel = pnlCsqPic then edtConseqPic.Text  := ExtractFileName(s1) + #32 + s2 + #32 + s3;
    if Panel = pnlcol       then edtStm.Text        := ExtractFileName(s1) + #32 + s2 + #32 + s3;
    if Panel = pnlScol      then edtSStm.Text       := ExtractFileName(s1) + #32 + s2 + #32 + s3;
  end;
begin
  if dlgColor1.execute then
    begin
      cColor := dlgColor1.Color;
      TPanel(Sender).Caption := IntToStr (cColor);
      TPanel(Sender).Color := cColor;
      TPanel(Sender).Hint := IntToStr (cColor) + ': Duplo clique para modificar a cor';
      if TPanel(Sender) = pnlCol then
        begin
          if cbbStimulus.ItemIndex = -1 then ShowMessage('Selecione um Estímulo de Comparação no Controle de Estímulos')
          else
            begin
              stm := cbbStimulus.itemindex + 1;
              PanelConfig(pnlCol);
              pnlCol.SetFocus;
            end;
        end;
      if TPanel(Sender) = pnlSCol then
        begin
          PanelConfig(pnlSCol);
          pnlSCol.SetFocus;
        end;
      if TPanel(Sender) = pnlCsqPic then
        begin
          PanelConfig(pnlCsqPic);
          pnlCsqPic.SetFocus;
        end;
      if TPanel(Sender) = pnlFont then
        begin
          pnlFont.SetFocus;
        end;
      if TPanel(Sender) = pnlBkGnd then
        begin
          pnlBkGnd.SetFocus;
        end;
    end;

end;

procedure TfTrials.RefreshStmParameters;
var stm : integer; s0, s1, s2, s3, s4 : string;
  procedure SetValuesToForm(GrpBox : shortint; Panel: TPanel);
  begin
    SetStmPreview
      (GrpBox, Escriba.HootMedia + Copy(s1, 0, pos(#32, s1)-1));
    Delete(s1, 1, pos(#32, s1)); If Length(s1)>0 then While s1[1]=#32 do Delete(s1, 1, 1);
    //SetLoop(Copy(s1, 0, pos(#32, s1)-1)       );
    Delete(s1, 1, pos(#32, s1)); If Length(s1)>0 then While s1[1]=#32 do Delete(s1, 1, 1);
    SetPnlColor(Panel,Copy(s1, 0, pos(#32, s1)-1));
  end;
  procedure SepStrings(var as1, as2, as3, as4 : string; edt : string);
  begin
    s1 := '';
    s2 := '';
    s3 := '';
    s4 := '';

    as1:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as2:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as3:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as4:= Copy(s0, 0, pos(#32, s0)-1);
  end;
begin
  if cbbStimulus.ItemIndex > -1 then
    begin
      stm := cbbStimulus.ItemIndex + 1;
      edtStm.Text := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values [_Comp + IntToStr(stm) + _cStm];
      edtConseqPic.Text := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values [_Comp + IntToStr(stm) + _cIET];
      edtMsg.Text := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values [_Comp + IntToStr(stm) + _cMsg];
      edtSch.Text := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values [_Comp + IntToStr(stm) + _cSch];
      SetSeBnd (stm);
      SetSeUSB (stm);
      SetSeCsq (stm);
      SetSeNxt (stm);
      SetRgRes (stm);
      SetTimeOut(stm);
      s1:= Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cStm] + #32;
      SetValuesToForm(1, pnlCol);
      s1:= Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cIET] + #32;
      SetValuesToForm(2, pnlCsqPic);
      SepStrings(s1,s2, s3, s4,Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cIET] + #32);
      edtTmn.Text := s4;
    end;
end;

procedure TfTrials.RefreshTrialParameters(Sender: TObject; Trial: Integer);
var tName, tKind, tColor, tCursor, tAutoNxt, tCustNxt, s1 : string;
begin
  tName := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].Name;
  tKind := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].Kind;

  tColor := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_BkGnd];
  tCursor := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_Cursor];
  tAutoNxt := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_AutoNxt];
  tCustNxt := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_CustomNxtValue];

  edtName.Text := tName;
  SetTrialKind (tKind);
  SetPnlColor (pnlBkGnd, tColor);
  SetSeCursor (tCursor);
  SetAutoNxt (tAutoNxt);
  edtCustomNxtValue.Text := tCustNxt;
  case rgKind.ItemIndex of

  {Msg} 0 : begin
              mmoMsg.Text := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_Msg];
              seWidth.Value := StrToIntDef(FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_MsgWidth], 640);
              seFontSize.Value := StrToIntDef (FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_MsgFontSize], 28);
              pnlFont.color := StrToIntDef (FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_MsgFontColor], clWhite);
              SetPrompt (FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_Prompt]);
            end;

  {Spl} 1 : begin;
               SetNumComp (FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].NumComp);
            end;

  {MTS} 2 : begin
              SetDelay (FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_Delayed]);
              edtDelay.Text := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_Delay];
              edtSStm.Text := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_Samp + _cStm];
              SetSeSBnd (StrToIntDef(FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_Samp + _cBnd], 1));
              edtSSch.Text := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_Samp + _cSch];
              edtSMsg.Text := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].SList.Values[_Samp + _cMsg];
              SetNumComp (FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[trial].NumComp);
              s1:= Escriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Samp + _cStm] + ' ';
              //showmessage('MTS');
              SetStmPreview
                (0, Escriba.HootMedia + Copy(s1, 0, pos(' ', s1)-1)      );
              Delete(s1, 1, pos(#32, s1)); If Length(s1)>0 then While s1[1]=#32 do Delete(s1, 1, 1);
              //SetLoop(Copy(s1, 0, pos(#32, s1)-1)       );
              Delete(s1, 1, pos(#32, s1)); If Length(s1)>0 then While s1[1]=#32 do Delete(s1, 1, 1);
              SetPnlColor(pnlSCol,Copy(s1, 0, pos(#32, s1)-1)       );
            end;
  end;
end;

procedure TfTrials.rgAutoNxtClick(Sender: TObject);
begin
  if rgAutoNxt.ItemIndex = 0 then edtCustomNxtValue.Enabled := False else edtCustomNxtValue.Enabled := True;
end;

procedure TfTrials.rgHasDelayClick(Sender: TObject);
begin
  if rgHasDelay.ItemIndex = 0 then edtDelay.Enabled := False else edtDelay.Enabled := True;
end;

//rgKindClick controla a visibilidade condicional dos componentes do formulário, e itens dos menus
procedure TfTrials.rgKindClick(Sender: TObject);
var
  i : integer;
  CfgStmSet1 : set of 1..10;
  CfgStmSet2 : set of 21..30;
  CfgStmSet3 : set of 41..50;
  CfgStmSet4 : set of 61..70;
  CfgStmSet5 : set of 81..90;
begin
    CfgStmSet1 := [ 1,  2,  3,  4,  5,  6,  7,  8,  9, 10]; //Parâmetros da Tentativa
    CfgStmSet2 := [21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; //Parâmetros Gerais
    CfgStmSet3 := [41, 42, 43, 44, 45, 46, 47, 48, 49, 50]; //Parâmetros de Escrita
    CfgStmSet4 := [61, 62, 63, 64, 65, 66, 67, 68, 69, 70]; //Configurações de Estímulos
    CfgStmSet5 := [81, 82, 83, 84, 85, 86, 87, 88, 89, 90]; //Configurações do Modelo

  case rgKind.ItemIndex of

  {Msg} 0 : begin
              pnlMsg.Left:= 393; pnlMsg.Top:= 8;
              pnlMsg.Visible := True;
              pnlMsg.Enabled:= True;

              pnlMTS.Left:= 393; pnlMTS.Top:= 247;
              pnlMTS.Visible := False;
              pnlMTS.Enabled:= False;

              pnlSimple.Left:= 778; pnlSimple.Top:= 247;
              pnlSimple.Visible := False;
              pnlSimple.Enabled:= False;

              grpStmControl.Visible := False;
              grpStmC.Visible := False;
              grpComparison.Visible := False;
              grpConseqPic.Visible := False;
              rgCorrection.Visible := False;
              miStmStimulusParameters.Caption := 'Aplicar Configurações da Mensagem';

              for i := 0 to pmStm.Items.Count -1 do
                if (pmStm.Items[i].Tag <> 100) then
                  begin
                    pmStm.Items[i].Checked := False;
                    pmStm.Items[i].Visible := False;
                  end;
              for i := 0 to pmParameters.Items.Count -1 do
                if (pmParameters.Items[i].Tag in CfgStmSet4) then
                  begin
                    pmParameters.Items[i].Checked := False;
                    pmParameters.Items[i].Visible := False;
                  end;
              for i := 0 to PmParameters.Items.Count -1 do
                if (PmParameters.Items[i].Tag in CfgStmSet5) then
                  begin
                    PmParameters.Items[i].Checked := False;
                    PmParameters.Items[i].Visible := False;
                  end;

              miMessenge.Visible := True;
              miSmAll.Visible := False;
              miPmAll.Visible := False;
              miStmStandard.Visible := False;
              miSStmStandard.Visible := False;
              miStmStimulusParameters.Visible := True;
              miStmSampleParameters.Visible := False;
              miStmLine1.Visible := True;
              miStmLine2.Visible := True;
              miStmLine3.Visible := False;
              miStmLine4.Visible := False;
              miStmLine5.Visible := False;
              miPrmLine3.Visible := False;
              miPrmLine4.Visible := False;
              miPrmLine5.Visible := False;
            end;

  {Spl} 1 : begin;
              pnlMsg.Left:= 778; pnlMsg.Top:= 247;
              pnlMsg.Visible := False;
              pnlMsg.Enabled:= False;

              pnlMTS.Left:= 393; pnlMTS.Top:= 247;
              pnlMTS.Visible := False;
              pnlMTS.Enabled:= False;

              pnlSimple.Left:= 393; pnlSimple.Top:= 8;
              pnlSimple.Visible := True;
              pnlSimple.Enabled:= True;

              grpStmControl.Visible := True;
              grpStmC.Visible := True;
              grpConseqPic.Visible := True;
              grpComparison.Visible := True;
              rgCorrection.Visible := True;
              miStmStimulusParameters.Caption := 'Aplicar Configurações da Comparação';

              for i := 0 to pmStm.Items.Count -1 do
                if (pmStm.Items[i].Tag in CfgStmSet1) or
                   (pmStm.Items[i].Tag in CfgStmSet4) then
                  begin
                    pmStm.Items[i].Checked := False;
                    pmStm.Items[i].Visible := True;
                  end;
              for i := 0 to pmParameters.Items.Count -1 do
                if (pmParameters.Items[i].Tag in CfgStmSet4) then
                  begin
                    pmParameters.Items[i].Checked := False;
                    pmParameters.Items[i].Visible := True;
                  end;
              for i := 0 to pmStm.Items.Count -1 do
                if (pmStm.Items[i].Tag in CfgStmSet2) or
                   (pmStm.Items[i].Tag in CfgStmSet5) then
                  begin
                    pmStm.Items[i].Checked := False;
                    pmStm.Items[i].Visible := False;
                  end;
              for i := 0 to pmParameters.Items.Count -1 do
                if (pmParameters.Items[i].Tag in CfgStmSet5) then
                  begin
                    pmParameters.Items[i].Checked := False;
                    pmParameters.Items[i].Visible := False;
                  end;
              miPmAll.Visible := True;
              miPAll.Visible := True;
              //miPConseq.Visible := True;
              miStmStandard.Visible := True;
              miMessenge.Visible := False;
              miSAll.Visible := False;
              miSmAll.Visible := False;
              miSStmStandard.Visible := False;
              miStmSampleParameters.Visible := False;
              //miPrmLine1.Visible := True;
              //miPrmLine2.Visible := True;
              miPrmLine3.Visible := True;
              miPrmLine4.Visible := False;
              miPrmLine5.Visible := False;
              //miStmLine1.Visible := True;
              //miStmLine2.Visible := True;
              miStmLine3.Visible := True;
              miStmLine4.Visible := True;
              miStmLine5.Visible := True;
            end;

  {MTS} 2 : begin
              pnlMsg.Left:= 778; pnlMsg.Top:= 247;
              pnlMsg.Visible := False;
              pnlMsg.Enabled:= False;

              pnlMTS.Left:= 393; pnlMTS.Top:= 8;
              pnlMTS.Visible := True;
              pnlMTS.Enabled:= True;

              pnlSimple.Left:= 393; pnlSimple.Top:= 247;
              pnlSimple.Visible := True;
              pnlSimple.Enabled:= True;

              grpStmControl.Visible := True;
              grpStmC.Visible := True;
              grpConseqPic.Visible := True;
              grpComparison.Visible := True;
              rgCorrection.Visible := True;
              miStmStimulusParameters.Caption := 'Aplicar Configurações da Comparação';

              for i := 0 to pmStm.Items.Count -1 do
                if (pmStm.Items[i].Tag in CfgStmSet1) or
                   (pmStm.Items[i].Tag in CfgStmSet2) or
                //   (pmStm.Items[i].Tag in CfgStmSet3) or
                   (pmStm.Items[i].Tag in CfgStmSet4) or
                   (pmStm.Items[i].Tag in CfgStmSet5) then
                  begin
                    pmStm.Items[i].Checked := False;
                    pmStm.Items[i].Visible := True;
                  end;
              for i := 0 to PmParameters.Items.Count -1 do
                if (PmParameters.Items[i].Tag in CfgStmSet4) or
                   (pmParameters.Items[i].Tag in CfgStmSet5) then
                  begin
                    PmParameters.Items[i].Checked := False;
                    PmParameters.Items[i].Visible := True;
                  end;
              miMessenge.Visible := False;
              miPmAll.Visible := True;
              miPAll.Visible := True;
              miSAll.Visible := True;
              miSmAll.Visible := True;
              miStmStandard.Visible := True;
              miSStmStandard.Visible := True;
              miStmSampleParameters.Visible := True;
              //miPrmLine1.Visible := True;
              //miPrmLine2.Visible := True;
              miPrmLine3.Visible := True;
              miPrmLine4.Visible := True;
              miPrmLine5.Visible := True;
              //miStmLine1.Visible := True;
              //miStmLine2.Visible := True;
              miStmLine3.Visible := True;
              miStmLine4.Visible := True;
              miStmLine5.Visible := True;
            end;
  end;
end;

procedure TfTrials.SetPnlColor(Pnl: TPanel; cColor: string);
begin
  Pnl.Caption := cColor;
  Pnl.Color := StrToIntDef (cColor, 0);
  Pnl.Hint := cColor + ': Duplo clique para modificar a cor';
end;

procedure TfTrials.SetPrompt(aprompt: string);
begin
  if aprompt = '-1' then rgPrompt.ItemIndex := 1;
  if aprompt = '0' then rgPrompt.ItemIndex := 0;
end;

procedure TfTrials.SetRgRes(stm: integer);
var res : string;
begin
  res := FEscriba.CfgBlc[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cRes];
  if (res = T_Miss) then rgRes.ItemIndex := 0;
  if (res = T_HIT) then rgRes.ItemIndex := 1;
  if (res = T_NONE) then rgRes.ItemIndex := 2;
end;

procedure TfTrials.SetSeBnd(stm: integer);
begin
  seBnd.MaxValue := FEscriba.NumPos;
  seBnd.MinValue := 1;
  if seBnd.MaxValue = seBnd.MinValue then seBnd.Increment := 0 else seBnd.Increment := 1;

  seBnd.Value := StrToIntDef (FEscriba.CfgBlc[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values [_Comp + IntToStr(stm) + _cBnd], 1);
end;

procedure TfTrials.SetSeCsq(stm: integer);
var csq : integer;
begin
  csq := StrToIntDef (FEscriba.CfgBlc[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cCsq], 0);
  if (csq > 255) or (csq < 0) then seCsq.Value := 0 else seCsq.Value := csq;
end;

procedure TfTrials.SetTimeOut(stm: integer);
var _TimeOut : string;
begin
  _TimeOut := FEscriba.CfgBlc[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cTO];
  edtOut.Text := _TimeOut;
end;

procedure TfTrials.SetSeCursor(cursor: string);
var c : integer;
begin
  c := StrToIntDef (cursor, -1);
  if (c < seCursor.MinValue) or (c > seCursor.MaxValue) then else seCursor.Value := c;
end;

procedure TfTrials.SetSeNxt(stm: integer);
var nxt : integer; s1 : string;
begin
  s1 := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cNxt];

  if s1 = T_REP then nxt := SeTrial.Value
  else nxt := StrToIntDef (s1, 0);

  SeNxt.MaxValue := FEscriba.CfgBlc[SeBlc.Value - 1].NumTrials;
  SeNxt.MinValue := 0;
  if (nxt < 0) or (nxt > SeNxt.MaxValue) then
    begin
      nxt := 0;
      SeNxt.Value := nxt;
    end else SeNxt.Value := nxt;
end;

procedure TfTrials.SetSeSBnd(stm: integer);
begin
  seSBnd.MaxValue := FEscriba.NumPos;
  seSBnd.MinValue := 1;
  if seSBnd.MaxValue = seSBnd.MinValue then seSBnd.Increment := 0 else seSBnd.Increment := 1;

  seSBnd.Value := stm;
end;

procedure TfTrials.SetSeUSB(stm: integer);
var usb : integer;
begin
  usb := StrToIntDef (FEscriba.CfgBlc[SeBlc.Value - 1].VetCfgTrial[SeTrial.Value - 1].SList.Values[_Comp + IntToStr(stm) + _cUsb], 0);
  if (usb > 4) or (usb < 0) then seUsb.Value := 0 else seUsb.Value := usb;
end;
procedure TfTrials.SaveStmParameters(b, t, i: integer);
var c : integer;
begin
  c := i + 1;
  if miPBnd.Checked then
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cBnd] := IntToStr (seBnd.Value);
  if miPStm.Checked then
    begin
      FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cStm] := edtStm.Text;
    end;
  if miPCsqStm.Checked then
    begin
      FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cIET] := edtConseqPic.Text
    end;
  if miPCsq.Checked then
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cCsq] := IntToStr (seCsq.Value);
  if miPUsb.Checked then
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cUsb] := IntToStr (seUSB.Value);
  if miPSch.Checked then
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cSch] := edtSch.Text;
  if miPRes.Checked then
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cRes] := GetRes;

  if miPOut.Checked then
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cTO] := edtOut.Text;

  if miPMsg.Checked then
    if edtMsg.Text = 'AUTO' then
      FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cMsg] :=
        Copy(FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cStm], 0, 2) +
        ' - ' +
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cBnd]
    else FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cMsg] := edtMsg.Text;

  case rgCorrection.ItemIndex of
    0: begin
    if miPNxt.Checked then
    FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cNxt] := IntToStr (seNxt.Value);
    end;

    1: begin
    if miPNxt.Checked then
      if c = 1 then
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cNxt] := IntToStr (seNxt.Value)
      else
        FEscriba.Blcs[b].VetCfgTrial[t].SList.Values [_Comp + IntToStr(c) + _cNxt] := T_REP;
    end;
  end;
end;

procedure TfTrials.SetStmParametersFrom(thisBlc, thisTrial, thisStm, toBlc, toTrial, toStm : integer);
var thisC, toC : integer;
begin
  thisC := thisStm + 1;
  toC := toStm + 1;
  if miPBnd.Checked or miPmBnd.Checked then
  FEscriba.Blcs[toBlc].VetCfgTrial[toTrial].SList.Values [_Comp + IntToStr(toC) + _cBnd] := FEscriba.Blcs[thisBlc].VetCfgTrial[thisTrial].SList.Values [_Comp + IntToStr(thisC) + _cBnd];
  if miPStm.Checked or miPmPic.Checked then
  FEscriba.Blcs[toBlc].VetCfgTrial[toTrial].SList.Values [_Comp + IntToStr(toC) + _cStm] := FEscriba.Blcs[thisBlc].VetCfgTrial[thisTrial].SList.Values [_Comp + IntToStr(thisC) + _cStm];
  if miPCsqStm.Checked or miPmConseqPic.Checked then
  FEscriba.Blcs[toBlc].VetCfgTrial[toTrial].SList.Values [_Comp + IntToStr(toC) + _cIET] := FEscriba.Blcs[thisBlc].VetCfgTrial[thisTrial].SList.Values [_Comp + IntToStr(thisC) + _cIET];
  if miPCsq.Checked or miPmCsq.Checked then
  FEscriba.Blcs[toBlc].VetCfgTrial[toTrial].SList.Values [_Comp + IntToStr(toC) + _cCsq] := FEscriba.Blcs[thisBlc].VetCfgTrial[thisTrial].SList.Values [_Comp + IntToStr(thisC) + _cCsq];
  if miPUsb.Checked or miPmUsb.Checked then
  FEscriba.Blcs[toBlc].VetCfgTrial[toTrial].SList.Values [_Comp + IntToStr(toC) + _cUsb] := FEscriba.Blcs[thisBlc].VetCfgTrial[thisTrial].SList.Values [_Comp + IntToStr(thisC) + _cUsb];
  if miPSch.Checked or miPmSch.Checked then
  FEscriba.Blcs[toBlc].VetCfgTrial[toTrial].SList.Values [_Comp + IntToStr(toC) + _cSch] := FEscriba.Blcs[thisBlc].VetCfgTrial[thisTrial].SList.Values [_Comp + IntToStr(thisC) + _cSch];
  if miPRes.Checked or miPmRes.Checked then
  FEscriba.Blcs[toBlc].VetCfgTrial[toTrial].SList.Values [_Comp + IntToStr(toC) + _cRes] := FEscriba.Blcs[thisBlc].VetCfgTrial[thisTrial].SList.Values [_Comp + IntToStr(thisC) + _cRes];
  if miPMsg.Checked or miPmMsg.Checked then
  FEscriba.Blcs[toBlc].VetCfgTrial[toTrial].SList.Values [_Comp + IntToStr(toC) + _cMsg] := FEscriba.Blcs[thisBlc].VetCfgTrial[thisTrial].SList.Values [_Comp + IntToStr(thisC) + _cMsg];
  if miPNxt.Checked or miPmNxt.Checked then
  FEscriba.Blcs[toBlc].VetCfgTrial[toTrial].SList.Values [_Comp + IntToStr(toC) + _cNxt] := FEscriba.Blcs[thisBlc].VetCfgTrial[thisTrial].SList.Values [_Comp + IntToStr(thisC) + _cNxt];
  if miPOut.Checked or miPmOut.Checked then
  FEscriba.Blcs[toBlc].VetCfgTrial[toTrial].SList.Values [_Comp + IntToStr(toC) + _cTO] := FEscriba.Blcs[thisBlc].VetCfgTrial[thisTrial].SList.Values [_Comp + IntToStr(thisC) + _cTO];
end;


procedure TfTrials.SetStandardParameters(Blc : Integer);
var t, i : integer;
begin
  for t := 0 to Escriba.Blcs[Blc].NumTrials - 1 do
    begin
      if Escriba.Blcs[Blc].VetCfgTrial[t].SList.Values['new'] = 'true' then
        begin
          Escriba.Blcs[Blc].VetCfgTrial[t].Name := 'Tentativa' + #32 + IntToStr (t + 1);
          Escriba.Blcs[Blc].VetCfgTrial[t].Kind:= T_Simple;
          Escriba.Blcs[Blc].VetCfgTrial[t].NumComp:= Escriba.NumPos;
          with Escriba.Blcs[Blc].VetCfgTrial[t].SList do
            begin
              BeginUpdate;
              Clear;
              Add(_BkGnd + '=' + '0');
              Add(_Cursor + '=' + '-1');
              Add(_AutoNxt + '=' + '-1');
              Add(_CustomNxtValue + '=' + '0');
              SaveStandardSStmParameters(blc, t);
              for i := 1 to Escriba.NumPos do SaveStandardStmParameters (blc, t, i);
              Add(_Kplus + _cCsq + '=' + '1');
              Add(_Kplus + _cUsb + '=' + '1');
              Add(_Kplus + _cNxt + '=' + '0');
              Add(_Kminus + _cCsq + '=' + '0');
              Add(_Kminus + _cUsb + '=' + '0');
              Add(_Kminus + _cNxt + '=' + '0');
              Add(_Kminus + _cNxt + '=' + '0');
              Values['new'] := 'false';
              EndUpdate;
            end;
        end;
    end;
    SetNumComp (Escriba.NumPos);
end;

procedure TfTrials.SaveStandardSStmParameters(b, t: integer);
begin
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add(_Delayed + '=' + '-1');
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add(_Delay + '=' + '0');
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add(_Samp + _cStm + '=' + 'Escolher');
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add(_Samp + _cBnd + '=' + '1');
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add(_Samp + _cSch + '=' + T_CRF);
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add(_Samp + _cMsg + '=' + 'AUTO');
  Application.ProcessMessages;
end;

procedure TfTrials.SaveStandardStmParameters(b, t, i: integer);
begin
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add (_Comp + IntToStr(i) + _cBnd  + '=' + IntToStr(i));
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add (_Comp + IntToStr(i) + _cStm  + '=' + 'Escolher 0 255');
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add (_Comp + IntToStr(i) + _cIET  + '=' + 'Escolher 0 255');
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add (_Comp + IntToStr(i) + _cCsq  + '=' + '0');
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add (_Comp + IntToStr(i) + _cUsb  + '=' + '0');
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add (_Comp + IntToStr(i) + _cSch  + '=' + T_CRF);
  if i = 1 then FEscriba.Blcs[b].VetCfgTrial[t].SList.Add (_Comp + IntToStr(i) + _cRes + '=' + T_HIT)
  else FEscriba.Blcs[b].VetCfgTrial[t].SList.Add (_Comp + IntToStr(i) + _cRes  + '=' + T_MISS);
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add (_Comp + IntToStr(i) + _cMsg  + '=' + 'AUTO');
  FEscriba.Blcs[b].VetCfgTrial[t].SList.Add (_Comp + IntToStr(i) + _cNxt + '=' + '0');
  Application.ProcessMessages;
end;

procedure TfTrials.SaveTrialParameters(blc, trial: integer);
begin
  if  miPrmUnd.Checked or
      miPrmChk.Checked or
      miPrmBlcUnd.Checked or
      miPrmBlcChk.Checked or
      miPrmAll.Checked then
  begin
    FEscriba.Blcs[blc].VetCfgTrial[trial].Name := edtName.Text;
    FEscriba.Blcs[blc].VetCfgTrial[trial].Kind:= GetKind;

    if FEscriba.Blcs[blc].VetCfgTrial[trial].Kind = T_Msg then
      FEscriba.Blcs[blc].VetCfgTrial[trial].NumComp := 1;

    if (FEscriba.Blcs[blc].VetCfgTrial[trial].Kind = T_Simple) or
       (FEscriba.Blcs[blc].VetCfgTrial[trial].Kind = T_MTS) then
      FEscriba.Blcs[blc].VetCfgTrial[trial].NumComp := seNumComp.Value;

    FEscriba.Blcs[blc].VetCfgTrial[trial].SList.BeginUpdate;
    FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_BkGnd] := IntToStr (pnlBkGnd.color);
    FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Cursor] := IntToStr (seCursor.Value);
    FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_AutoNxt] := GetAutoNxt;
    FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_CustomNxtValue] := edtCustomNxtValue.Text;
  end;

  if FEscriba.Blcs[blc].VetCfgTrial[trial].Kind = T_Msg then
    begin
      FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Msg] := mmoMsg.Text;
      FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_MsgWidth] := IntToStr (seWidth.Value);
      FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_MsgFontSize] := IntToStr (seFontSize.Value);
      FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_MsgFontColor] := IntToStr (pnlFont.color);
      FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Prompt] := GetPrompt;
    end;
  if FEscriba.Blcs[blc].VetCfgTrial[trial].Kind = T_MTS then
    begin
      if miSDelay.Checked or miSmDelay.Checked then
        begin
          FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Delayed] := GetDelay;
          FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Delay] := edtDelay.Text;
        end;
      if miSPic.Checked or miSmPic.Checked then
        FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Samp + _cStm] := edtSStm.Text;
      if miSBnd.Checked or miSmBnd.Checked then
        FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Samp + _cBnd] := IntToStr(seSBnd.Value);
      if miSSch.Checked or miSmSch.Checked then
        FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Samp + _cSch] := edtSSch.Text;
      if miSMsg.Checked or miSmMsg.Checked then
        if edtSMsg.Text = 'AUTO' then
          FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Samp + _cMsg] :=
            Copy(FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Samp + _cStm], 0, 2) +
            ' - ' +
            FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Samp + _cBnd]
        else FEscriba.Blcs[blc].VetCfgTrial[trial].SList.Values[_Samp + _cMsg] := edtSMsg.Text;
    end;
  FEscriba.Blcs[blc].VetCfgTrial[trial].SList.EndUpdate;
end;

procedure TfTrials.stmStandardClick(Sender: TObject); //controla a manutenção do popup do menu na tela
begin
  if TMenuItem(Sender).GetParentMenu = pmStm then pmStm.Popup(FPosX, FPosY);
  if TMenuItem(Sender).GetParentMenu = pmParameters then pmParameters.Popup(FPosX, FPosY);
  if TMenuItem(Sender).GetParentMenu = pmWrite then pmWrite.Popup(FPosX, FPosY);
end;

procedure TfTrials.tmrSavedTimer(Sender: TObject);
begin
  tmrSaved.Enabled:= False;
  with pnlSaved do
    begin
      Color:= clBtnFace;
      Caption:= '';
    end;
end;

//stmUndClick controla o marca/desmarca condicional dos botões que o recebem no onclick
//o botão deve ter o autocheck= true
procedure TfTrials.miStmUndClick(Sender: TObject);
var
  i : integer;
  CfgStmSet1 : set of 1..10;
  CfgStmSet2 : set of 21..30;
  CfgStmSet3 : set of 41..50;
  CfgStmSet4 : set of 61..70;
  CfgStmSet5 : set of 81..90;
begin
    CfgStmSet1 := [ 1,  2,  3,  4,  5,  6,  7,  8,  9, 10]; //Parâmetros da Tentativa
    CfgStmSet2 := [21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; //Parâmetros Gerais
    CfgStmSet3 := [41, 42, 43, 44, 45, 46, 47, 48, 49, 50]; //Parâmetros de Escrita
    CfgStmSet4 := [61, 62, 63, 64, 65, 66, 67, 68, 69, 70]; //Configurações de Estímulos
    CfgStmSet5 := [81, 82, 83, 84, 85, 86, 87, 88, 89, 90]; //Configurações do Modelo

    if TMenuItem (Sender).Checked then
      begin
        if TMenuItem (Sender).Tag in CfgStmSet1 then
          begin
            //ShowMessage (TMenuItem (Sender).Caption);
            for i := 0 to pmStm.Items.Count -1 do
              if (pmStm.Items[i].Name <> TMenuItem (Sender).Name) and
                 (pmStm.Items[i].Tag in CfgStmSet1) then
                  pmStm.Items[i].Checked := False;
          end;
        if TMenuItem(Sender).Name = miPAll.Name then        //comparações
          begin
            for i := 0 to pmStm.Items.Count -1 do
              if (pmStm.Items[i].Tag in CfgStmSet4) then
                pmStm.Items[i].Checked := True;
          end;
        if TMenuItem(Sender).Name = miSAll.Name then        //modelo
          begin
            for i := 0 to pmStm.Items.Count -1 do
              if (pmStm.Items[i].Tag in CfgStmSet5) then
                pmStm.Items[i].Checked := True;
          end;
        if TMenuItem (Sender).Tag in CfgStmSet2 then
          begin
            //ShowMessage (TMenuItem (Sender).Caption);
            for i := 0 to pmStm.Items.Count -1 do
              if (pmStm.Items[i].Name <> TMenuItem (Sender).Name) and
                 (pmStm.Items[i].Tag in CfgStmSet2) then
                  pmStm.Items[i].Checked := False;
          end;
        if TMenuItem (Sender).Tag in CfgStmSet2 then
          begin
            //ShowMessage (TMenuItem (Sender).Caption);
            for i := 0 to PmParameters.Items.Count -1 do
              if (PmParameters.Items[i].Name <> TMenuItem (Sender).Name) and
                 (PmParameters.Items[i].Tag in CfgStmSet2) then
                  PmParameters.Items[i].Checked := False;
          end;
        if TMenuItem(Sender).Name = miPmAll.Name then
          begin
            for i := 0 to PmParameters.Items.Count -1 do
              if (PmParameters.Items[i].Tag in CfgStmSet4) then
                begin
                  PmParameters.Items[i].Checked := True;
                end;
          end;
        if TMenuItem(Sender).Name = miSmAll.Name then        //modelo
          begin
            for i := 0 to pmParameters.Items.Count -1 do
              if (pmParameters.Items[i].Tag in CfgStmSet5) then
                pmParameters.Items[i].Checked := True;
          end;
        if TMenuItem (Sender).Tag in CfgStmSet3 then           //Escrita
          begin
            //ShowMessage (TMenuItem (Sender).Caption);
            for i := 0 to PmWrite.Items.Count -1 do
              if (PmWrite.Items[i].Name <> TMenuItem (Sender).Name) and
                 (PmWrite.Items[i].Tag in CfgStmSet3) then
                  PmWrite.Items[i].Checked := False;
          end;
        if TMenuItem(Sender) = miStmStandard then
          begin
            for i := 0 to PmParameters.Items.Count -1 do
              if (PmParameters.Items[i].Tag in CfgStmSet4) then
                begin
                  PmParameters.Items[i].Enabled := True;
                end;
            miPmAll.Enabled:= True;
          end;
        if TMenuItem(Sender) = miSStmStandard then
          begin
            for i := 0 to PmParameters.Items.Count -1 do
              if (PmParameters.Items[i].Tag in CfgStmSet5) then
                begin
                  PmParameters.Items[i].Enabled := True;
                end;
            miSmAll.Enabled:= True;
          end;
      end
    else
      begin
        if TMenuItem(Sender).Name = miPAll.Name then        //comparações
          begin
            for i := 0 to pmStm.Items.Count -1 do
              if (pmStm.Items[i].Tag in CfgStmSet4) then
                pmStm.Items[i].Checked := False;
          end;

        if TMenuItem(Sender).Name = miSAll.Name then        //modelo
          begin
            for i := 0 to pmStm.Items.Count -1 do
              if (pmStm.Items[i].Tag in CfgStmSet5) then
                pmStm.Items[i].Checked := False;
          end;
        if TMenuItem(Sender).Name = miPmAll.Name then        //comparações
          begin
            for i := 0 to pmParameters.Items.Count -1 do
              if (pmParameters.Items[i].Tag in CfgStmSet4) then
                pmParameters.Items[i].Checked := False;
          end;
        if TMenuItem(Sender).Name = miSmAll.Name then        //modelo
          begin
            for i := 0 to pmParameters.Items.Count -1 do
              if (pmParameters.Items[i].Tag in CfgStmSet5) then
                pmParameters.Items[i].Checked := False;
          end;
         if TMenuItem(Sender) = miStmStandard then
          begin
            for i := 0 to PmParameters.Items.Count -1 do
              if (PmParameters.Items[i].Tag in CfgStmSet4) then
                begin
                  PmParameters.Items[i].Checked := False;
                  PmParameters.Items[i].Enabled := False;
                end;
            miPmAll.Enabled:= False;
          end;
        if TMenuItem(Sender) = miSStmStandard then
          begin
            for i := 0 to PmParameters.Items.Count -1 do
              if (PmParameters.Items[i].Tag in CfgStmSet5) then
                begin
                  PmParameters.Items[i].Checked := False;
                  PmParameters.Items[i].Enabled := False;
                end;
            miSmAll.Enabled:= False;
          end;
      end;
  stmStandardClick (sender);
end;

procedure TfTrials.NewPositions;
begin
  SetNumComp(seNumComp.Value);
  seNumCompChange(Self);
end;

procedure TfTrials.SetAutoNxt(anxt: String);
begin
  if anxt = '-1' then rgAutoNxt.ItemIndex := 0;
  if anxt = '0' then rgAutoNxt.ItemIndex := 1;
end;

procedure TfTrials.SetDelay(adelay: string);
begin
  if adelay = '-1' then rgHasDelay.ItemIndex := 1
  else
  if adelay = '0' then rgHasDelay.ItemIndex := 0
  else
    begin
      rgHasDelay.ItemIndex := -1
    end;
end;

procedure TfTrials.SetHootMedia;
begin
  if Escriba.HootMedia = '' then
  else
    begin
      if not (Escriba.HootMedia[Length(Escriba.HootMedia)] = '\') then
        Escriba.HootMedia:= Escriba.HootMedia + '\';
      if ForceDirectories(Escriba.HootMedia) then
      picDlg.InitialDir := Escriba.HootMedia;
    end;
end;

procedure TfTrials.SetNumComp(n: Integer);
begin
  seNumComp.MaxValue := Escriba.NumPos;
  seNumComp.MinValue := 1;
  if seNumComp.MaxValue = seNumComp.MinValue then seNumComp.Increment := 0 else seNumComp.Increment := 1;
  seNumComp.Value := n;
end;

procedure TfTrials.SetTrialKind(Kind: String);
begin
  if Kind = T_Msg then rgKind.ItemIndex := 0;
  if Kind = T_Simple then rgKind.ItemIndex := 1;
  if Kind = T_MTS then rgKind.ItemIndex := 2;
end;

procedure TfTrials.seUSBChange(Sender: TObject);
begin

end;

//Form Control

procedure TfTrials.Form14Close(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(fRandPosition);
end;

procedure TfTrials.Form15Close(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(fRandStimuliSet);
end;

procedure TfTrials.Form16Close(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(fRandTrialIndex);
end;

procedure TfTrials.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if assigned (FSamplePreview) then FreeAndnil(FSamplePreview);
  if assigned (FComparisonPreview) then FreeAndnil(FComparisonPreview);
  if assigned (FConsequencePreview) then FreeAndnil(FComparisonPreview);
end;

procedure TfTrials.FormCreate(Sender: TObject);
begin
  OnBlcChange := SeBlcChange;
  OnTrialChange := SeTrialChange;
  OnStmChange := StimulusChange;
  rgKind.OnClick (Sender);
  Self.Width := 778;
end;

procedure TfTrials.FormMouseEnter(Sender: TObject);
begin
  Self.Show;
end;

//Change Section

procedure TfTrials.seNumCompChange(Sender: TObject);
var stm : integer;
begin
  //showmessage (inttostr(Escriba.NumPos));
  //NumComp := FEscriba.Blcs[SeBlc.Value - 1].VetCfgTrial[SeBlc.Value - 1].NumComp;
  //showmessage (inttostr(Numcomp));
  //if not (seNumComp = Sender) then seNumComp.Value := NumComp;

    if seNumComp.Value <> 0 then
      begin
        if (seNumComp.Value <= Escriba.NumPos) and
           (Escriba.NumPos > 0) then
          begin
            cbbStimulus.Items.Clear;
            tbcStimulus.Tabs.Clear;
            stm := 1;
            while stm <= seNumComp.Value do
                begin
                  if stm = 1 then
                    begin
                      cbbStimulus.Items.Add('Comp. ' + IntToStr(stm) + ' (S+)');
                      tbcStimulus.Tabs.Add(_Comp + IntToStr(stm) + ' +');
                    end
                  else
                    begin
                      cbbStimulus.Items.Add('Comp. ' + IntToStr(stm) + ' (S-)');
                      tbcStimulus.Tabs.Add(_Comp + IntToStr(stm) + ' -');
                    end;
                  Inc(Stm);
                end;
          end;
      end;
      //showmessage(sender.ClassName);
      //if sender is tspinedit then showmessage(tspinedit(sender).Name);
      //if sender is tmenuitem then showmessage(tmenuitem(sender).Name);
  //if assigned (fTools.OnStmChange) then fTools.OnStmChange(sender)
end;

procedure TfTrials.cbbStimulusChange(Sender: TObject);
begin
  if assigned (fTools.OnStmChange) then fTools.OnStmChange(sender);
end;

procedure TfTrials.StimulusChange(Sender: TObject);
begin
  if (Sender = cbbStimulus) or
     (Sender is TCheckBox)  then
    begin
      tbcStimulus.TabIndex := cbbStimulus.ItemIndex;
    end;
  if Sender = tbcStimulus then
    begin
      cbbStimulus.ItemIndex := tbcStimulus.TabIndex;
    end;
  RefreshStmParameters; //showmessage(sender.ClassName);
end;

procedure TfTrials.SeTrialChange(Sender: TObject);
begin
  if (TToolButton(sender) = fMain.btnAbrirSessao) or
     (TMenuItem(sender) = fMain.Abrir2) or
     (Sender is TButton) or
     (Sender is TSpinEdit) then
  begin //showmessage('1');
   // seCursorChange (Sender);
     seBnd.MaxValue := Escriba.NumPos;
     seBnd.MinValue := 1;
    with seSBnd do
      begin
        MaxValue := Escriba.NumPos;
        MinValue := 1;
        if MinValue = MaxValue then Increment := 0 else Increment := 1;
        Value := 1;
      end;
  end;
  if Escriba.NumPos = 1 then seNumCompChange (Sender);
  if SeTrial.Value > 0 then
    begin //showmessage(sender.ClassName);
      RefreshTrialParameters(Sender, SeTrial.Value - 1);
      cbbStimulus.ItemIndex := 0;
      tbcStimulus.TabIndex := 0;
      if assigned (fTools.OnStmChange) then fTools.OnStmChange(sender);
    end;
end;

procedure TfTrials.SeBlcChange(Sender: TObject);
begin
  if SeBlc.Value > 0 then
    begin
      SeTrial.Value := 1;
      if assigned (fTools.OnTrialChange) then fTools.OnTrialChange(sender);
    end;
end;

procedure TfTrials.seCursorChange(Sender: TObject);
begin
  grp6.Cursor := seCursor.Value;
end;

end.
