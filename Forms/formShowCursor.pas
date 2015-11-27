unit formShowCursor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvExMask, JvSpin, Spin;

type
  TfShowCursor = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    se1: TSpinEdit;

    procedure FormCreate(Sender: TObject);
    procedure se1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fShowCursor: TfShowCursor;

implementation

{$R *.dfm}

procedure TfShowCursor.FormCreate(Sender: TObject);
begin
  //Top := 150;
  //Left := 300;
  se1.Value := grp1.Cursor;
end;

procedure TfShowCursor.se1Change(Sender: TObject);
begin
  grp1.Cursor := se1.Value;
end;

end.
