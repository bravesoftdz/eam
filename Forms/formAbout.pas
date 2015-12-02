{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit formAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFmAbout = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    lblEAM: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmAbout: TFmAbout;

implementation

{$R *.dfm}

uses formMain;

procedure TFmAbout.FormCreate(Sender: TObject);
var
  build:string;
  verblock:PVSFIXEDFILEINFO;
  versionMS,versionLS:cardinal;
  verlen:cardinal;
  rs:TResourceStream;
  m:TMemoryStream;
  p:pointer;
  s:cardinal;
begin
  m:=TMemoryStream.Create;
  try
    rs:=TResourceStream.CreateFromID(HInstance,1,RT_VERSION);
    try
      m.CopyFrom(rs,rs.Size);
    finally
      rs.Free;
    end;
    m.Position:=0;
    if VerQueryValue(m.Memory,'\',pointer(verblock),verlen) then
      begin
        VersionMS:=verblock.dwFileVersionMS;
        VersionLS:=verblock.dwFileVersionLS;
        build:=Application.Title+' '+
          IntToStr(versionMS shr 16)+'.'+
          IntToStr(versionMS and $FFFF)+'.'+
          IntToStr(VersionLS shr 16)+'.'+
          IntToStr(VersionLS and $FFFF);
      end;
    if VerQueryValue(m.Memory,PChar('\\StringFileInfo\\'+
      IntToHex(GetThreadLocale,4)+IntToHex(GetACP,4)+'\\FileDescription'),p,s) or
        VerQueryValue(m.Memory,'\\StringFileInfo\\040904E4\\FileDescription',p,s) then //en-us
          build:=PChar(p)+' '+build;
  finally
    m.Free;
  end;

  Caption:= 'Sobre o '+ Application.Title;
  Memo1.Lines.Text := build + #13#10 + #13#10 +
                      'Versão 4.0.04 por Dráusio Capobianco.' + #13#10 +
                      'drausio@polvo.ufscar.br' + #13#10 +
                      'drausiocap@zipmail.com.br'  + #13#10 +
                      'drausiocap@gmail.com'  + #13#10 +
                       #13#10 +
                      'Alterações até a presente versão' + #13#10 +
                      'Carlos Rafael F. Picanço.' + #13#10 +
                      'carlitus.batera@gmail.com' + #13#10;
end;

end.
