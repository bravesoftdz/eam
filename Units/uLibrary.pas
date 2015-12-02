{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit uLibrary;

interface

uses Classes, Dialogs, Forms, ExtCtrls, Registry, SysUtils, Windows, OleCtrls, MSCommLib_TLB;

type

  TPLP = class (TComponent)
  private
    FCsqTimer : TTimer;
  public
    constructor Create (AOwner : TComponent); override;
    procedure OutPortOn (Value : BYTE);
    procedure OutPortOff (Sender: TObject);
    procedure OutPortNone (Sender: TObject);
    procedure OnTimerMethod(AutoOff: Boolean);

  end;

  TRS232 = class (TObject)
    private
      FMSComm : TMSComm;
      function GetCommPortFromRegistry : ShortInt;
    public
      constructor Create; reintroduce;
      destructor Destroy; override;
      procedure Dispenser (Number : ShortInt);
      function GetUsbCsqFromValue (Value : String) : ShortInt;
  end;

function inportb(EndPorta: Integer): BYTE stdcall; external 'inpout32.DLL' name 'Inp32';
procedure outportb(EndPorta: Integer; Valor:BYTE); stdcall; external 'inpout32.DLL' name 'Out32';

var FRS232 : TRS232;
    FPLP : TPLP;

implementation

{TPLP}

constructor TPLP.Create (AOwner : TComponent);
begin
  FCsqTimer := TTimer.Create (Self);
  with FCsqTimer do
    begin
      Enabled := False;
      Interval := 50;
      FCsqTimer.OnTimer := OutPortOff;
    end;
end;

procedure TPLP.OnTimerMethod(AutoOff: Boolean);
begin
  if AutoOff then
    FCsqTimer.OnTimer := OutPortOff
  else
    FCsqTimer.OnTimer := OutPortNone;
end;

procedure TPLP.OutPortNone (Sender: TObject);
begin

end;

procedure TPLP.OutPortOff (Sender: TObject);
begin
  FCsqTimer.Enabled := False;
  outportb($378, 0);
  //outportb($278, 0);
end;

procedure TPLP.OutPortOn(Value: BYTE);
begin
  outportb($378, Value);
  //outportb($278, Value);
  FCsqTimer.Enabled := True;
end;

{TRS232}

function TRS232.GetCommPortFromRegistry: ShortInt;
var
  Reg: TRegistry;
  s1: string;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  s1 := 'HARDWARE\DEVICEMAP\SERIALCOMM';

  if Reg.KeyExists(s1) then
    begin
      Reg.OpenKeyReadOnly (s1);
      if Reg.ValueExists('\Device\VCP0') then
        begin
          s1:= Reg.ReadString('\Device\VCP0');
          Delete (s1, 1, 3);
          if (StrToIntDef (s1, 17) <= 16) or (StrToIntDef (s1, 0) >= 1) then
            Result := StrToInt (s1)
          else Result := 0;
        end
      else Result := 0;
    end
  else Result := 0;
  Reg.CloseKey;
  Reg.Free;
end;

function TRS232.GetUsbCsqFromValue(Value: String): ShortInt;
var s1 : string;
begin

  Value := Value + #32;
  s1:= Copy(Value, 0, Pos(#32, Value) -1);

  Delete(Value, 1, pos(#32, Value));
  if Length(Value)> 0 then while Value[1]= ' ' do Delete(Value, 1, 1);

  if StrToIntDef(s1, -1) = -1 then Result := 0
  else
    begin
      if (s1 = '1') then Result := 1
        else
        if (s1 = '2') then Result := 2
          else
            if (s1 = '3') then Result := 3
              else
              if (s1 = '4') then Result := 4
                else Result := 0;
    end
end;

constructor TRS232.Create;
var ComX : shortint;
begin
inherited Create;
  ComX := GetCommPortFromRegistry;
  if ComX = 0 then
    begin
      {ShowMessage('Interface Serial-USB não encontrada ou não suportada.' + #13#10 +
                  'Verifique se a conexão e a instalação do dispositivo foram realizadas corretamente.');}
    end
  else
    begin
      FMSComm := TMSComm.Create (Application);
      FMSComm.CommPort := ComX;
      if FMSComm.PortOpen then FMSComm.PortOpen := False;
    end;
end;

destructor TRS232.Destroy;
begin
  if Assigned(FMSComm) then
  begin
   if FMSComm.PortOpen then FMSComm.PortOpen := False;
   FMSComm.Free;
  end;

  inherited Destroy;
end;

procedure TRS232.Dispenser(Number: ShortInt);
//var DispenserOutput : AnsiChar;
begin
  if Assigned (FMSComm) then
    begin
      if not FMSComm.PortOpen then FMSComm.PortOpen := True;
      if FMSComm.PortOpen then
        begin
          FMSComm.Output := IntToStr(Number);
          FMSComm.PortOpen := False;
        end;
    end;
end;

end.
