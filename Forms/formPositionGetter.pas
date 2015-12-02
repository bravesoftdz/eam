{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit formPositionGetter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math, ImgList,
  uCriatore, uEscriba;

type
  TfPositionGetter = class(TForm)
    grpDist: TGroupBox;
    grpDim: TGroupBox;
    grpCfg: TGroupBox;
    grpMatriz: TGroupBox;
    btnRetornar           : TButton;
    btnLimparTudo         : TButton;
    btnOK                 : TButton;
    btnMostrarMatriz      : TButton;
    edtDisty: TEdit;
    edtDistx: TEdit;
    edtRow: TEdit;
    edtCol: TEdit;
    edtWidth: TEdit;
    edtHeight: TEdit;
    _x                    : TLabel;
    Label1                : TLabel;
    lbl1                  : TLabel;
    Quadrado              : TCheckBox;
    Quadrada              : TCheckBox;
    chkCustomResolution: TCheckBox;
    lbCoordenadas         : TListBox;
    chkIgual              : TCheckBox;
    chkDistribuir         : TCheckBox;
    btnRand: TButton;
    edtLeft: TEdit;
    edtTop: TEdit;
    lblLeftTop: TLabel;
    procedure edtRowChange(Sender: TObject);
    procedure edtWidthChange(Sender: TObject);
    procedure edtDistxChange(Sender: TObject);
    procedure QuadradaClick(Sender: TObject);
    procedure QuadradoClick(Sender: TObject);
    procedure chkIgualClick(Sender: TObject);
    procedure chkDistribuirClick(Sender: TObject);
    procedure btnMostrarMatrizClick(Sender: TObject);
    procedure btnLimparTudoClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRandClick(Sender: TObject);
    procedure lbCoordenadasEndDock(Sender, Target: TObject; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLeftChange(Sender: TObject);
  private
    FCanDraw    : Boolean;
    FDrawCoordenates : TAleatorizator;
    FEscriba : TEscriba;
    FOnPosCfg: TNotifyEvent;
    procedure PosCfg (Sender : TObject);
  public
    property OnPosCfg : TNotifyEvent read FOnPosCfg write FOnPosCfg;
  end;

var
  fPositionGetter : TfPositionGetter;

const
  CMatrizDefault : string = '1';
  CSizeDefault : string = '100';
  CCustomResDefLeft : string = '1024';
  CCustomResDefTop : string = '768';
implementation

uses formMain, formBackGround, formTextEditor, formTools;

{$R *.dfm}


procedure TfPositionGetter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fBackGround.Close;
  fMain.Visible := True;
end;

procedure TfPositionGetter.FormCreate(Sender: TObject);
begin
  FCanDraw := True;
  FEscriba := fTools.Escriba;
  OnPosCfg := PosCfg;
end;

procedure TfPositionGetter.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ssCtrl in Shift then
    if (Key = 69) or (Key = 101) then
      fTextEditor.FormStyle := fsStayOnTop;
end;

procedure TfPositionGetter.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ssCtrl in Shift then
    if (Key = 69) or (Key = 101) then
      fTextEditor.FormStyle := fsMDIChild;
end;

procedure TfPositionGetter.lbCoordenadasEndDock(Sender, Target: TObject; X, Y: Integer);
begin
  lbCoordenadas.Top := 8;
  lbCoordenadas.Left := 195;
  lbCoordenadas.Width := 150;
  lbCoordenadas.Height := 127;
end;

procedure TfPositionGetter.PosCfg(Sender: TObject);
begin

end;

procedure TfPositionGetter.btnOKClick(Sender: TObject);
begin
  if FCanDraw then
    begin
      if MessageDlg ('Sair sem configurar posições?', mtWarning, [mbYes, mbNo], 0) = mrYes then Close;
    end
  else
    begin
      FEscriba.Row := StrToIntDef(edtRow.Text, 1);
      FEscriba.Col := StrToIntDef (edtCol.Text, 1);
      FEscriba.SetPositions(FDrawCoordenates.GetPositions);
      FOnPosCfg(Sender);
      Close;
    end;
end;

procedure TfPositionGetter.btnRetornarClick(Sender: TObject);
begin
  if FCanDraw then Close
  else
    if MessageDlg ('Sair e descartar posições?', mtWarning, [mbYes, mbNo], 0) = mrYes then close
end;

procedure TfPositionGetter.edtRowChange(Sender: TObject);
begin
  if (TEdit(Sender).Text = '') or
     (StrToIntDef(TEdit(Sender).Text, 1) < 1) or
     (StrToIntDef(TEdit(Sender).Text, 1) > 127) then
    begin
      TEdit(Sender).Text := CMatrizDefault;
      TEdit(Sender).SelectAll;
    end;
  if (TEdit(Sender).ComponentIndex = edtRow.ComponentIndex) then
    if Quadrada.Checked then edtCol.Text := edtRow.Text;
end;

procedure TfPositionGetter.edtDistxChange(Sender: TObject);
begin
  if TEdit(Sender).Text = '' then
    begin
      TEdit(Sender).Text := '0';
      TEdit(Sender).SelectAll;
    end;

  if (TEdit(Sender).ComponentIndex = edtDistx.ComponentIndex) then
    if chkIgual.Checked then edtDisty.Text := edtDistx.Text;
end;

procedure TfPositionGetter.edtLeftChange(Sender: TObject);
begin
    if (TEdit(Sender).Text = '') or (TEdit(Sender).Text = '0') then
    begin
      if (TEdit(Sender).ComponentIndex = edtLeft.ComponentIndex) then
        TEdit(Sender).Text := CCustomResDefLeft else
      if (TEdit(Sender).ComponentIndex = edtTop.ComponentIndex) then
      TEdit(Sender).Text := CCustomResDefTop;

      TEdit(Sender).SelectAll;
    end;
end;

procedure TfPositionGetter.edtWidthChange(Sender: TObject);
begin
  if (TEdit(Sender).Text = '') or (TEdit(Sender).Text = '0') then
    begin
      TEdit(Sender).Text := CSizeDefault;
      TEdit(Sender).SelectAll;
    end;

  if (TEdit(Sender).ComponentIndex = edtWidth.ComponentIndex) then
    if Quadrado.Checked then edtHeight.Text := edtWidth.Text;
end;

procedure TfPositionGetter.QuadradaClick(Sender: TObject);
begin
    if Quadrada.Checked then
      begin
        edtCol.Text := edtRow.Text;
        edtCol.Enabled := False;
      end
    else
      begin
        edtCol.Enabled := True;
      end;
end;
procedure TfPositionGetter.QuadradoClick(Sender: TObject);
begin
    if Quadrado.Checked then
      begin
        edtHeight.Text := edtWidth.Text;
        edtHeight.Enabled:= False;
      end
    else
      begin
        edtHeight.Enabled:= True;
      end;
end;
procedure TfPositionGetter.chkIgualClick(Sender: TObject);
begin
    if chkIgual.Checked then
      begin
        edtDisty.Text := edtDistx.Text;
        edtDisty.Enabled:= False;
      end
    else
      begin
        edtDisty.Enabled:= True;
      end;
end;

procedure TfPositionGetter.chkDistribuirClick(Sender: TObject);
begin
    if chkDistribuir.Checked then
      begin
        edtDistx.Enabled := False;
        edtDisty.Enabled := False;
        chkIgual.Enabled := False;
      end
    else
      begin
        edtDistx.Enabled := True;
        chkIgual.Enabled := True;
        if not chkIgual.Checked then edtDisty.Enabled := True;
      end;
end;

procedure TfPositionGetter.btnRandClick(Sender: TObject);
begin
 if FCanDraw = False then
  begin
    FDrawCoordenates.RandomizePositions (True);
  end;
end;

procedure TfPositionGetter.btnLimparTudoClick(Sender: TObject);
begin
  if FCanDraw = False then
    begin
      lbCoordenadas.Items.Clear;
      FDrawCoordenates.Free;
      FCanDraw := True;
    end;
end;

procedure TfPositionGetter.btnMostrarMatrizClick(Sender: TObject);
begin
 if FCanDraw then
  begin
    FDrawCoordenates := TAleatorizator.Create;
    FDrawCoordenates.Distribuido := chkDistribuir.Checked;
    if chkCustomResolution.Checked then
      begin
        FDrawCoordenates.SetVariables (edtDistx.Text, edtDisty.Text,
                                       edtWidth.Text, edtHeight.Text,
                                       edtRow.Text, edtCol.Text,
                                       edtLeft.Text, edtTop.Text);
      end
    else
      begin
        FDrawCoordenates.SetVariables (edtDistx.Text, edtDisty.Text,
                                        edtWidth.Text, edtHeight.Text,
                                        edtRow.Text, edtCol.Text,
                                        '-1', '-1');
      end;
    FDrawCoordenates.DrawStmFromCoordenates;
    FCanDraw := False;
  end;
end;
end.


