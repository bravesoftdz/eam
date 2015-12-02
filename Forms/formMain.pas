{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit formMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, Buttons, StdCtrls, ExtCtrls, ToolWin, IniFiles,
  ImgList, //MPlayer,
  uCfgSes, uSess, uBlc, uLibrary, uCounterManager;

type

  TfMain = class(TForm)
    MainMenu1           : TMainMenu;
    Arquivo1            : TMenuItem;
    Abrir1              : TMenuItem;
    Abrir2              : TMenuItem;
    Visualizar1         : TMenuItem;
    estarInterfaces1    : TMenuItem;
    Sair1               : TMenuItem;
    RodarSesso1         : TMenuItem;
    Ajuda1              : TMenuItem;
    SobreoGalileu1      : TMenuItem;
    N1                  : TMenuItem;
    N4                  : TMenuItem;

    Panel1              : TPanel;

    CoolBar1            : TCoolBar;
    ToolBar1            : TToolBar;
    Separator1          : TToolButton;
    btnAbrir            : TToolButton;
    btnRodar            : TToolButton;
    btnVisualizar       : TToolButton;
    Separator2          : TToolButton;
    btnNovaSessao       : TToolButton;
    btnAbrirSessao      : TToolButton;
    btnSave: TToolButton;
    Separator3          : TToolButton;
    btnDescobrirCursor  : TToolButton;
    btnFerramentas      : TToolButton;

    ImageList1          : TImageList;
    OpenDialog1         : TOpenDialog;
    SaveDialog1         : TSaveDialog;
    StatusBar1          : TStatusBar;
    NovaSesso1: TMenuItem;
    btnSch: TToolButton;
    SalvaSesso1: TMenuItem;
    DescobreCursor1: TMenuItem;
    EsquemasdeReforo1: TMenuItem;
    btnSalvarTexto: TToolButton;
    miSalvarTexto: TMenuItem;
    tmrEndSession: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure SobreoGalileu1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure RodarSesso1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Abrir2Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure estarInterfaces1Click(Sender: TObject);
    procedure btnDescobrirCursorClick(Sender: TObject);
    procedure btnNovaSessaoClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarTextoClick(Sender: TObject);
  private
    FHitsLabel : TLabel;
    //FTimerNxt: Boolean;
    FSess: TSess;
    FOnNewFromBegin: TNotifyEvent;
    procedure SessEndSess(Sender: TObject);
    procedure OnStmResponse(Sender: TObject);
    procedure OnConsequence(Sender: TObject);
    procedure OnBkGndResponse(Sender: TObject);
    procedure OnEndTrial(Sender: TObject);
    procedure OnEndBlc(Sender: TObject);
    procedure OnHit(Sender: TObject);
    procedure OnMiss(Sender: TObject);
    procedure NewSessionFromBegin(Sender: TObject);
    procedure FreeMyCfgSess;
    procedure goExcMode(FromSelf : Boolean);
    procedure goEdtMode(FromSelf : Boolean);
  public
    FCfgSes : TCfgSes;
    FManager : TCounterManager;
    property OnNewFromBegin : TNotifyEvent read FOnNewFromBegin write FOnNewFromBegin;
  end;


const

  DefFolder : string = '\Files Settings';

var
  fMain   : TfMain;
  CurPath : String;

implementation

uses
  formTrials, formBlocs, formCheckBoxTree, formTextEditor,
  formTools, formRScheduleView, formInterfaceTest,formShowCursor,
  formPlay, formFeedBack, formAbout, formBackGround;

{$R *.DFM}

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if Assigned(fTrials) then
        begin
          fTrials.Close;
          FreeAndNil(fTrials);
        end;
      if Assigned(fBlocs) then
        begin
          fBlocs.Close;
          FreeAndNil(fBlocs);
        end;
      if Assigned(fCheckBoxTree) then
        begin
          fCheckBoxTree.Close;
          FreeAndNil(fCheckBoxTree);
        end;
      if Assigned(fTextEditor) then
        begin
          fTextEditor.Close;
          FreeAndNil(fTextEditor);
        end;
      if Assigned(fTools) then
        begin
          fTools.Close;
          FreeAndNil(fTools);
        end;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;
  ForceDirectories(ExtractFilePath(Application.ExeName));
  if SetCurrentDir(ExtractFileDir(Application.ExeName) + '\Files Settings') then
    begin
      CurPath:= GetCurrentDir;
      OpenDialog1.InitialDir := CurPath + DefFolder;
      SaveDialog1.InitialDir := CurPath + DefFolder;
    end;

  RodarSesso1.Enabled := False;
  btnRodar.Enabled := False;
  Abrir2.Visible := False;
  OnNewFromBegin := NewSessionFromBegin;
end;


procedure TfMain.FreeMyCfgSess;
begin
  Caption:= Application.Title;
  RodarSesso1.Enabled:= False;
  btnRodar.Enabled:= False;
  Statusbar1.Panels[0].Text := 'Bem Vindo';
  Statusbar1.Panels[1].Text := 'Modo de Execução';
  If Assigned (FCfgSes) then
   begin
     FCfgSes.Destroy;
     FCfgSes := nil;
   end;
end;

procedure TfMain.goEdtMode(FromSelf : Boolean);
begin
  if FromSelf then
  begin
    If Assigned (FCfgSes) then
      begin
        FreeAndNil(FCfgSes);
        Caption := Application.Title;
        RodarSesso1.Enabled := False;
        btnRodar.Enabled := RodarSesso1.Enabled;
      end
    else;

    Caption:= Application.Title;
    Visualizar1.Caption := '&Modo de Execução';
    Visualizar1.ImageIndex:= 0;
    Statusbar1.Panels[0].Text := 'Modo de Edição';
    Statusbar1.Panels[1].Text := '';

    btnAbrir.Enabled := False;
    btnAbrir.Visible := btnAbrir.Enabled;
    btnRodar.Enabled := btnAbrir.Enabled;
    btnRodar.Visible := btnAbrir.Enabled;
    RodarSesso1.Visible := False;
    Abrir1.Enabled := btnAbrir.Enabled;
    Abrir1.Visible := btnAbrir.Enabled;

    btnNovaSessao.Enabled := True;
    btnNovaSessao.Visible := btnNovaSessao.Enabled;
    btnAbrirSessao.Enabled := btnNovaSessao.Enabled;
    btnAbrirSessao.Visible := btnNovaSessao.Enabled;
    btnSave.Enabled := btnNovaSessao.Enabled;
    btnSave.Visible := btnNovaSessao.Enabled;
    Separator3.Visible := btnNovaSessao.Enabled;
    Abrir2.Enabled := btnNovaSessao.Enabled;
    Abrir2.Visible := btnNovaSessao.Enabled;
    NovaSesso1.Enabled := btnNovaSessao.Enabled;
    NovaSesso1.Visible :=  btnNovaSessao.Enabled;
    SalvaSesso1.Enabled := btnNovaSessao.Enabled;
    SalvaSesso1.Visible :=  btnNovaSessao.Enabled;
    btnVisualizar.Down := btnNovaSessao.Enabled;
    btnSalvarTexto.Enabled := btnNovaSessao.Enabled;
    btnSalvarTexto.Visible :=  btnNovaSessao.Enabled;
    miSalvarTexto.Visible := btnNovaSessao.Enabled;
    miSalvarTexto.Enabled := btnNovaSessao.Enabled;
  end;

  fTools := TfTools.Create(Self);  //ferramentas
  with fTools do
    begin
      //Show;
    end;
  fTextEditor := TfTextEditor.Create(Self); //editor de texto
  with fTextEditor do
    begin
      Width := Screen.PrimaryMonitor.Width div 4;
      Height := Screen.PrimaryMonitor.Height div 2;
      WindowState := wsMinimized;
    end;
  fCheckBoxTree := TfCheckBoxTree.Create(self);    //estrutura da sessão
  with fCheckBoxTree do
    begin
      Top := fTools.Top + fTools.Height;
      Left  := fTools.Left;
      WindowState := wsMinimized;
    end;
  fTools.Escriba.RichEdit := fTextEditor.redtSessaoRichEdit;
  fCheckBoxTree.Escriba := fTools.Escriba;
  fCheckBoxTree.SeBlc := fTools.seBlc;
  fCheckBoxTree.SeTrial := fTools.seTrial;
  //WindowState := wsMaximized;
  ArrangeIcons;
  btnVisualizar.Down := True;
end;

procedure TfMain.goExcMode(FromSelf : Boolean);
begin
  if FromSelf then
  begin
    If not (OpenDialog1.FileName = '') then
      begin
        Statusbar1.Panels[1].Text := '';
        OpenDialog1.FileName := '';
      end;

    Caption:= Application.Title;
    Visualizar1.Caption:= '&Visualizar \Editar';
    Visualizar1.ImageIndex:= 2;
    Statusbar1.Panels[0].Text := 'Bem Vindo';
    Statusbar1.Panels[1].Text := 'Modo de Execução';

    btnRodar.Visible := True;
    RodarSesso1.Visible := btnRodar.Visible;
    btnAbrir.Visible := btnRodar.Visible;
    btnAbrir.Enabled := btnRodar.Visible;
    Abrir1.Enabled := btnRodar.Visible;
    Abrir1.Visible := btnRodar.Visible;

    btnNovaSessao.Enabled := False;
    btnNovaSessao.Visible := btnNovaSessao.Enabled;
    btnAbrirSessao.Enabled := btnNovaSessao.Enabled;
    btnAbrirSessao.Visible := btnNovaSessao.Enabled;
    btnSave.Enabled := btnNovaSessao.Enabled;
    btnSave.Visible := btnNovaSessao.Enabled;
    Separator3.Visible := btnNovaSessao.Enabled;
    Abrir2.Visible := btnNovaSessao.Enabled;
    Abrir2.Enabled := btnNovaSessao.Enabled;
    NovaSesso1.Enabled := btnNovaSessao.Enabled;
    NovaSesso1.Visible :=  btnNovaSessao.Enabled;
    SalvaSesso1.Enabled := btnNovaSessao.Enabled;
    SalvaSesso1.Visible :=  btnNovaSessao.Enabled;
    btnSalvarTexto.Enabled := btnNovaSessao.Enabled;
    btnSalvarTexto.Visible :=  btnNovaSessao.Enabled;
    miSalvarTexto.Visible := btnNovaSessao.Enabled;
    miSalvarTexto.Enabled := btnNovaSessao.Enabled;
  end;
  if Assigned(fTrials) then
    begin
      fTrials.Close;
      FreeAndNil(fTrials);
    end;
  if Assigned(fBlocs) then
    begin
      fBlocs.Close;
      FreeAndNil(fBlocs);
    end;
  if Assigned(fCheckBoxTree) then
    begin
      fCheckBoxTree.Close;
      FreeAndNil(fCheckBoxTree);
    end;
  if Assigned(fTextEditor) then
    begin
      fTextEditor.Close;
      FreeAndNil(fTextEditor);
    end;
  if Assigned(fTools) then
    begin
      fTools.Close;
      FreeAndNil(fTools);
    end;
    btnVisualizar.Down := False;
    //WindowState := wsNormal;
end;

procedure TfMain.NewSessionFromBegin(Sender: TObject);
begin
  goExcMode(False);
  goEdtMode(False);
  if Assigned(fTools) then fTools.btnNewSession.Click;
end;

procedure TfMain.SobreoGalileu1Click(Sender: TObject);
begin
  FmAbout:= TFmAbout.Create(Self);
  with FmAbout do
  try
    Visible := False;
    ShowModal;
  finally
    //FmAbout.ModalResult := 1;
    Free;
  end;
end;

procedure TfMain.btnSalvarTextoClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    fTools.Escriba.SaveTextToTXT(SaveDialog1.FileName);
end;

procedure TfMain.btnSaveClick(Sender: TObject);
begin
  if Assigned(fTrials) then
    begin
      fTrials.miWriteSessionAndSave.Checked := True;
      fTrials.btnAplicarClick(Sender);
    end
  else ShowMessage ('Impossível salvar, pois nenhuma sessão foi carregada.');
end;

procedure TfMain.btnSchClick(Sender: TObject);
begin
  fRScheduleView := TfRScheduleView.Create(Self);
  try
    fRScheduleView.Visible := False;
    fRScheduleView.ShowModal;
  finally
    //FmSch.ModalResult := 1;
    fRScheduleView.Free;
  end;
end;

procedure TfMain.Sair1Click(Sender: TObject);
begin
  Close;
end;


procedure TfMain.btnDescobrirCursorClick(Sender: TObject);
begin
  fShowCursor := TfShowCursor.Create(Self);
  try
    fShowCursor.Visible := False;
    fShowCursor.ShowModal;
  finally
    //Form8.ModalResult := 1;
    fShowCursor.Free;
  end;
end;

procedure TfMain.estarInterfaces1Click(Sender: TObject);
begin
  fInterfaceTest := TfInterfaceTest.Create(Self);
  try
    fInterfaceTest.Visible := False;
    fInterfaceTest.ShowModal;
    //Form7.ModalResult := 1;
  finally
    fInterfaceTest.Free;
  end;
end;

procedure TfMain.Abrir2Click(Sender: TObject);
begin
  If Assigned(fTextEditor)then
      If  Opendialog1.Execute then
        begin
          if fTools.Escriba.LoadFromFile(Opendialog1.FileName, True) then
            begin
              fTextEditor.redtSessaoRichEdit.Lines.LoadFromFile(Opendialog1.FileName);
              fTextEditor.redtSessaoRichEdit.SetFocus;
              fTools.Mount(sender);
            end;
              Statusbar1.Panels[0].Text := 'Visualizar/Editar';
              Statusbar1.Panels[1].Text := fTools.Escriba.Name;
        end;
end;

procedure TfMain.btnNovaSessaoClick(Sender: TObject);
begin
  if Assigned(fTools)then fTools.btnNewSession.Click;
end;

procedure TfMain.Visualizar1Click(Sender: TObject);
begin
  if btnVisualizar.Down then
    begin
      goExcMode(True);  //rever ao fechar no meio da sessão edit
    end
  else
    begin
      goEdtMode(True);
    end;
end;

procedure TfMain.Abrir1Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    begin
      FCfgSes := TCfgSes.Create(Application);

      If FCfgSes.LoadFromFile(OpenDialog1.FileName, False) then
        begin
          Caption:= Application.Title + ' - ' + FCfgSes.Name;
          Statusbar1.Panels[0].Text := 'Pronto para rodar';
          Statusbar1.Panels[1].Text := FCfgSes.Name;
          RodarSesso1.Enabled:= True;
          btnRodar.Enabled:= True;
        end
      else
        begin
          FreeMyCfgSess;
        end;

    end;
end;

procedure TfMain.RodarSesso1Click(Sender: TObject);
begin
  fBackGround := TfBackGround.Create(Self);
  fBackGround.FullScreen;
  fPlay := TfPlay.Create(Self);

  If fPlay.ShowModal = mrOK then
    begin
      FManager := TCounterManager.Create(Application);
      FPLP := TPLP.Create(Application);
      FRS232 := TRS232.Create;
      FSess := TSess.Create(Application);
      FSess.BackGround := fBackGround;
      FSess.OnEndBlc := OnEndBlc;
      FSess.OnEndSess := SessEndSess;
      FSess.OnHit := OnHit;
      FSess.OnMiss := OnMiss;
      FSess.OnStmResponse := OnStmResponse;
      FSess.OnConsequence := OnConsequence;
      FSess.OnBkGndResponse:= OnBkGndResponse;
      FSess.OnEndTrial:= OnEndTrial;
      FSess.TestMode := fPlay.CheckBox1.Checked;
      FSess.CounterString := UpperCase(fPlay.edtCounterString.Text);
      FSess.ShowCounter := fPlay.chkCounter.Checked;
      FSess.SubjName := fPlay.Edit1.Text;
      FSess.SessName := fPlay.Edit2.Text;
      FSess.Play(FCfgSes, FManager, fPlay.Edit3.Text);
      fFeedBack := TfFeedBack.Create(Self);
      fFeedBack.CfgSes := FCfgSes;
      fFeedBack.Manager := FManager;
      if fPlay.chkFeedBack.Checked then fFeedBack.Show else fFeedBack.Hide;
      fFeedBack.OnBeginSess(Sender);
    end
  else
    begin
      FreeAndNil(fBackGround);
    end;
  FreeAndNil(fPlay);
end;


procedure TfMain.SessEndSess(Sender: TObject);
begin
  if FSess.ShowCounter then
    begin
      FHitsLabel := TLabel.Create(Self);
      with FHitsLabel do
      begin
        Parent:= Self;
        AutoSize := True;
        WordWrap := True;
        Caption := IntToStr(FManager.VirtualHits.Counter);
        //Color := clBtnFace;
        Font.Size := 100;
        Font.Color := clWhite;
        Top := (Screen.Height div 2) - (Height div 2);
        Left := (Screen.Width div 2) - (Width div 2);
      end;
    end;
  WindowState := wsMaximized;
  FreeAndNil(fBackGround);
  FPLP.Free;
  FRS232.Free;
  FreeAndNil(FSess);
  FreeMyCfgSess;
  FreeAndNil(FManager);
  FreeAndNil(fFeedBack);
  ShowMessage('Final da Sessão');
end;

procedure TfMain.OnBkGndResponse(Sender: TObject);
begin
  fFeedBack.OnBkGndResponse(Sender);
end;

procedure TfMain.OnConsequence(Sender: TObject);
begin
  fFeedBack.OnConsequence(Sender);
end;

procedure TfMain.OnEndBlc(Sender: TObject);
begin
  fFeedBack.OnEndBlc(Sender);
end;

procedure TfMain.OnEndTrial(Sender: TObject);
begin
  fFeedBack.OnEndTrial(Sender);
end;

procedure TfMain.OnHit(Sender: TObject);
begin
  fFeedBack.OnHit (Sender);
end;

procedure TfMain.OnMiss(Sender: TObject);
begin
  fFeedBack.OnMiss (Sender);
end;

procedure TfMain.OnStmResponse(Sender: TObject);
begin
  fFeedBack.OnStmResponse(Sender);
end;

end.
