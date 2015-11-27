unit uTrial;


interface

uses Winapi.Windows, Vcl.Controls, System.Classes,
     uCfgSes, uCounterManager;
type
  TClockThread = class(TThread)
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

  TTrial = class(TCustomControl)
  protected
    FHootMedia: string;
    FIETConsequence: string;
    FTimeOut : Integer;
    FManager : TCounterManager;
    FResult: String;
    FHeader: String;
    FHeaderTicks: String;
    FData: String;
    FDataTicks: String;
    FNextTrial: String;
    FIsCorrection : Boolean;
    FCfgTrial: TCfgTrial;
    FOnBeginCorrection : TNotifyEvent;
    FOnEndCorrection : TNotifyEvent;
    FOnBkGndResponse: TNotifyEvent;
    FOnHit: TNotifyEvent;
    FOnMiss: TNotifyEvent;
    FOnNone: TNotifyEvent;
    FOnStmResponse: TNotifyEvent;
    FOnConsequence: TNotifyEvent;
    FOnEndTrial: TNotifyEvent;
    procedure WriteData(Sender: TObject); virtual; abstract;
  public
    procedure Play(Manager : TCounterManager; TestMode: Boolean; Correction : Boolean); virtual; abstract;
    procedure DispenserPlusCall; virtual; abstract;
    property CfgTrial: TCfgTrial read FCfgTrial write FCfgTrial;
    property HootMedia : string read FHootMedia;
    property IETConsequence : string read FIETConsequence;
    property Result: String read FResult;
    property Header: String read FHeader;
    property HeaderTicks: String read FHeaderTicks;
    property Data: String read FData;
    property DataTicks: String read FDataTicks;
    property NextTrial: String read FNextTrial;
    property OnEndTrial: TNotifyEvent read FOnEndTrial write FOnEndTrial;
    property OnConsequence: TNotifyEvent read FOnConsequence write FOnConsequence;
    property OnStmResponse: TNotifyEvent read FOnStmResponse write FOnStmResponse;
    property OnBkGndResponse: TNotifyEvent read FOnBkGndResponse write FOnBkGndResponse;
    property OnHit: TNotifyEvent read FOnHit write FOnHit;
    property OnMiss: TNotifyEvent read FOnMiss write FOnMiss;
    property OnNone: TNotifyEvent read FOnNone write FOnNone;
    property OnBeginCorrection : TNotifyEvent read FOnBeginCorrection write FOnBeginCorrection;
    property OnEndCorrection : TNotifyEvent read FOnEndCorrection write FOnEndCorrection;
    property TimeOut : Integer read FTimeOut;
  end;

implementation

{ TClockThread }

constructor TClockThread.Create(CreateSuspended: Boolean);
begin
  inherited;
  FreeOnTerminate := True;
  FTickEvent := CreateEvent(nil, True, False, nil);
  FInterval := 100;
end;

destructor TClockThread.Destroy;
begin
  CloseHandle(FTickEvent);
  inherited;
end;

procedure TClockThread.Execute;
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

procedure TClockThread.FinishThreadExecution;
begin
  Terminate;
  SetEvent(FTickEvent);
end;

end.
