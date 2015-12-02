{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit formRScheduleView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls, uKey, Spin;

type
  TTimerThread = class(TThread)
  private
    FTickEvent: THandle;
    FInterval: cardinal;
    FOnTimer:TNotifyEvent;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    procedure FinishThreadExecution;
    property Interval : cardinal read FInterval write FInterval;
    property OnTimer: TNotifyEvent read FOnTimer write FOnTimer;
  end;

type
  TLinControl = class (TCustomControl)
  private
    FOX : integer;
    FOY : integer;
    FNX : integer;
    FNY : integer;
  public
    procedure Paint; override;
    procedure IncNX(n : integer);
    procedure DecNY(n : integer);
    property OX : integer read FOX write FOX;
    property OY : integer read FOY write FOY;
    property NX : integer read FNX write FNX;
    property NY : integer read FNY write FNY;
  end;

  TfRScheduleView = class(TForm)
    Edit1: TEdit;
    ListBox1: TListBox;
    Timer: TTimer;
    btnTest: TButton;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    lblDuration: TLabel;
    lblTotal: TLabel;
    GroupBox5: TGroupBox;
    lblLatency: TLabel;
    GroupBox6: TGroupBox;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpinEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FTimer: TTimerThread;
    FKey : TKey;
    FFirstResponse : Boolean;
    FBeginCount : Cardinal;
    FEndCount : Cardinal;
    FEndLatency : Cardinal;
    FControl : TLinControl;
    procedure Consequence(Sender: TObject);
    procedure Consequence2(Sender: TObject);
    procedure Response(Sender: TObject);
    procedure Clock(Sender: TObject);
  public

  end;

var
  fRScheduleView: TfRScheduleView;

implementation

uses formHelp;

{$R *.dfm}

procedure TfRScheduleView.btnTestClick(Sender: TObject);
var s1 : string;
begin
  s1 := Edit1.Text;
  FKey.SchMan.Kind := s1;
  FBeginCount := GetTickCount;
  FFirstResponse := False;
  Label1.Caption := IntToStr(FKey.SchMan.Time);
  lblDuration.Caption := '0';
  lblTotal.Caption   :=  '0';
  lblLatency.Caption :=  '0';
end;

procedure TfRScheduleView.Button1Click(Sender: TObject);
begin
  FmHelp := TFmHelp.Create(self);
  try
    FmHelp.ShowModal;
  finally
    FmHelp.Free;
  end;
end;

procedure TfRScheduleView.Clock(Sender: TObject);
begin
  FKey.SchMan.Clock;
  Label1.Caption := IntToStr(FKey.SchMan.Time);
end;

procedure TfRScheduleView.Consequence(Sender: TObject);
var
  Total : cardinal;
  Duration: cardinal;
begin
  FEndCount := GetTickCount;
  Total := FEndCount - FBeginCount;
  Duration := FEndCount - FEndLatency;
  lblTotal.Caption :=  FormatFloat('####,####', Total);
  lblDuration.Caption :=  FormatFloat('####,####', Duration);
  FBeginCount := GetTickCount;
  lblLatency.Caption := '0';
  FControl.Canvas.MoveTo(FControl.Canvas.PenPos.X - 6, FControl.Canvas.PenPos.Y - 6);
  FControl.Canvas.LineTo(FControl.Canvas.PenPos.X + 6, FControl.Canvas.PenPos.Y + 6);
  FFirstResponse := False;
  Beep;
end;

procedure TfRScheduleView.Consequence2(Sender: TObject);
begin
  FControl.Canvas.MoveTo(FControl.Canvas.PenPos.X + 6, FControl.Canvas.PenPos.Y + 6);
  FControl.Canvas.LineTo(FControl.Canvas.PenPos.X - 6, FControl.Canvas.PenPos.Y - 6);
  Beep;
end;

procedure TfRScheduleView.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FControl := TLinControl.Create(Panel1);
  FControl.Parent:= Panel1;
  FControl.Align := alClient;
  FControl.BringToFront;
  FControl.Color := clTeal;
  FControl.Canvas.Pen.Color := RGB(255,128,255);
  FControl.Canvas.Pen.Style := psDot;
  FControl.Canvas.Pen.Width := 1;
  FControl.Canvas.Pen.Mode := pmCopy;
  FControl.Canvas.Pen.Mode := pmCopy;
  FControl.OX := 0;
  FControl.OY := Panel1.Height - 10;
  FControl.NX := 2;
  FControl.NY := Panel1.Height -10;
  FControl.Canvas.MoveTo(FControl.OX, FControl.OY);

  Randomize;
  FKey:= TKey.Create(GroupBox1);
  FKey.Parent:= GroupBox1;
  FKey.Cursor:= Cursor;
  FKey.SetBounds(15, 20, 100, 60);
  FKey.OnConsequence := Consequence;
  FKey.OnConsequence2 := Consequence2;
  FKey.OnResponse := Response;
  ListBox1.ItemIndex := 0;
  Edit1.Text := ListBox1.Items.Strings[ListBox1.ItemIndex];
  FTimer:= TTimerThread.Create(False);
  FTimer.OnTimer:= Clock;
end;

procedure TfRScheduleView.FormDestroy(Sender: TObject);
begin
  FTimer.FinishThreadExecution;
end;

procedure TfRScheduleView.ListBox1Click(Sender: TObject);
var s1 : string;
begin
  s1 := ListBox1.Items.Strings[ListBox1.ItemIndex];
  if (s1 = 'CRF') then begin
    s1 := s1;
  end;
  if (s1 = 'FR') or (s1 = 'FI') or (s1 = 'FT') then begin
    s1 := s1 + #32 + '5';
  end;
  if (s1 = 'VR') or (s1 = 'VI') or (s1 = 'VT') then begin
    s1 := s1 + #32 + '5' + #32 + '5';
  end;
  if s1 = 'DRL' then begin
    s1 := s1 + #32 + '5' + #32 + '0';
  end;
  if s1 = 'DRH' then begin
    s1 := s1 + #32 + '20' + #32 + '4' + #32 + '0' + #32 + '0';
  end;
  if s1 = 'FRFT' then begin
    s1 := s1 + #32 + '3' + #32 + '5'
  end;
  if s1 = 'FRVT' then begin
    s1 := s1 + #32 + '3' + #32 + '5' + #32 + '0' + #32 + '2';
  end;
  if s1 = 'VRFT' then begin
    s1 := s1 + #32 + '5' + #32 + '5' + #32 + '5' + #32 + '0';
  end;
  if s1 = 'VRVT' then begin
    s1 := s1 + #32 + '5' + #32 + '5' + #32 + '5' + #32 + '2';
  end;

  FKey.SchMan.Kind := s1;
  Edit1.Text := s1;
  btnTest.Click;
end;

procedure TfRScheduleView.Panel1Resize(Sender: TObject);
begin
  FControl.OX := 0;
  FControl.OY := Panel1.Height - 10;
  FControl.Canvas.MoveTo(FControl.OX, FControl.OY);
  FControl.NX := 2;
  FControl.NY := Panel1.Height -10;
  FControl.Refresh;
end;

procedure TfRScheduleView.Response(Sender: TObject);
var Latency : Cardinal;
begin
  if not FFirstResponse then
    begin
      FEndLatency := GetTickCount;
      Latency := FEndLatency - FBeginCount;
      lblLatency.Caption := FormatFloat('####,####', Latency);
      FFirstResponse := True;
    end;
  FControl.DecNY(2);
end;

procedure TfRScheduleView.SpinEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then FTimer.Interval := SpinEdit1.Value;
end;

procedure TfRScheduleView.TimerTimer(Sender: TObject);
begin
  FControl.IncNX(1);
  if FControl.NX > FControl.Width then
    begin
      FControl.NX := 0;
      FControl.Canvas.MoveTo(FControl.NX, FControl.NY);
      FControl.Refresh;
    end;
  if FControl.NY < 0 then
    begin
      FControl.NY := Panel1.Height - 10;
      FControl.Canvas.MoveTo(FControl.NX, FControl.NY);
    end;
  FControl.Paint;
end;

{ TLinControl }

procedure TLinControl.IncNX(n: integer);
begin
  Inc(FNX, n);
end;

procedure TLinControl.DecNY(n: integer);
begin
  Dec(FNY, n);
end;

procedure TLinControl.Paint;
begin
  Canvas.LineTo(FNX, FNY);
end;

{ TTimerThread }

constructor TTimerThread.Create(CreateSuspended: Boolean);
begin
  inherited;
  FreeOnTerminate := True;
  FTickEvent := CreateEvent(nil, True, False, nil);
  FInterval := 1000;
end;

destructor TTimerThread.Destroy;
begin
  CloseHandle(FTickEvent);
  inherited;
end;

procedure TTimerThread.Execute;
begin
  while not Terminated do
  begin
    if WaitForSingleObject(FTickEvent, Interval) = WAIT_TIMEOUT then
    begin
      Synchronize(procedure
        begin
          if Assigned(OnTimer) then Ontimer(Self);
        end
      );
    end;
  end;
end;

procedure TTimerThread.FinishThreadExecution;
begin
  Terminate;
  SetEvent(FTickEvent);
end;

end.
