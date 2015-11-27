unit formNewSession;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, Buttons, uEscriba, JvBaseDlg, JvBrowseFolder, ExtCtrls;

type
  TfNewSession = class(TForm)
    grp1: TGroupBox;
    edt1: TEdit;
    grp2: TGroupBox;
    edt2: TEdit;
    grp3: TGroupBox;
    edt3: TEdit;
    grp4: TGroupBox;
    se1: TSpinEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    rgType: TRadioGroup;
    dlgDialog: TJvBrowseForFolderDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edt2DblClick(Sender: TObject);
  private
    FEscriba: TEscriba;
  public

  end;

var
  fNewSession: TfNewSession;

implementation

uses formTools;

{$R *.dfm}

procedure TfNewSession.btnOkClick(Sender: TObject);
begin
  FEscriba.Name := edt1.Text;
  FEscriba.HootMedia := edt2.Text;
  FEscriba.HootData := edt3.Text;
  FEscriba.Media:= ExtractFileName(ExcludeTrailingPathDelimiter(FEscriba.HootMedia));
  FEscriba.Data:= ExtractFileName(ExcludeTrailingPathDelimiter(FEscriba.HootData));
  FEscriba.NumBlc := se1.Value;
  case rgType.ItemIndex of
    0:begin  FEscriba.SesType := 'CRT'
    end;

    1:begin  FEscriba.SesType := 'CIC';
    end;
  end;
  //Form9.btnTrialClick(Sender);
end;

procedure TfNewSession.edt2DblClick(Sender: TObject);
//var   s1, s2 : String; a1, a2 : integer;
begin
  dlgDialog.Directory := GetCurrentDir;
  if dlgDialog.Execute then
    begin
      TEdit(Sender).Text :=  dlgDialog.Directory;
    end;
end;

procedure TfNewSession.FormCreate(Sender: TObject);
begin
  dlgDialog.RootDirectoryPath := GetCurrentDir + '\Files Settings';
  FEscriba := fTools.Escriba;
end;

end.
