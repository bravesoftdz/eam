unit formPlay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfPlay = class(TForm)
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    chkFeedBack: TCheckBox;
    BitBtn1: TBitBtn;
    chkCounter: TCheckBox;
    edtCounterString: TEdit;
    lblCounterString: TLabel;
    procedure chkCounterClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPlay: TfPlay;

implementation

{$R *.dfm}

uses formMain;

procedure TfPlay.chkCounterClick(Sender: TObject);
begin
  edtCounterString.Enabled := not edtCounterString.Enabled;
  lblCounterString.Enabled := not lblCounterString.Enabled;
end;

end.
