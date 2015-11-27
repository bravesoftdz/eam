unit formTextEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ComCtrls, StdCtrls;

type
  TfTextEditor = class(TForm)
    redtSessaoRichEdit: TRichEdit;
    procedure FormCreate(Sender: TObject);
  private

  public

end;

var
  fTextEditor   : TfTextEditor;

implementation

uses formTools;

{$R *.dfm}

procedure TfTextEditor.FormCreate(Sender: TObject);
begin
  fTools.Escriba.RichEdit := redtSessaoRichEdit;
end;

end.
