{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
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
