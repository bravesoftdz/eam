unit uSess;

interface

uses Classes, Controls, SysUtils, //dialogs,
     uCfgSes, uCounterManager, uRegData, uBlc;

type

  TSess = class(TComponent)
  private
    FManager : TCounterManager;
    FCrtReached : Boolean;
    FBlc: TBlc;
    FRegData: TRegData;
    FRegDataTicks: TRegData;
    FCfgSes: TCfgSes;
    FOnEndSess: TNotifyEvent;
    FSubjName: String;
    FSessName: String;
    FBackGround: TWinControl;
    FTestMode: Boolean;
    FShowCounter : Boolean;
    FOnStmResponse: TNotifyEvent;
    FOnEndTrial: TNotifyEvent;
    FOnBkGndResponse: TNotifyEvent;
    //FOnBeginTrial: TNotifyEvent;
    FOnEndBlc: TNotifyEvent;
    FOnConsequence: TNotifyEvent;
    //FOnBeginSess: TNotifyEvent;
    FOnHit: TNotifyEvent;
    FOnMiss: TNotifyEvent;
    FPreviousBlc: Integer;
    FCounterString: string;
    //FOnCriteria: TNotifyEvent;
    procedure EndSess(Sender: TObject);
    procedure SetBackGround(BackGround: TWinControl);
    procedure EndBlc(Sender: TObject);
    procedure StmResponse(Sender:TObject);
    procedure Consequence(Sender: TObject);
    procedure Hit(Sender: TObject);
    procedure Miss(Sender: TObject);
    procedure BkGndResponse(Sender: TObject);
    procedure EndTrial(Sender: TObject);
    procedure Criteria(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoEndSess(Sender: TObject);
    procedure Play(CfgSes: TCfgSes; Manager : TCounterManager; FileData: String);
    procedure PlayBlc(Sender: TObject);
    property BackGround: TWinControl read FBackGround write SetBackGround;
    property SessName: String  read FSessName write FSessName;
    property SubjName: String  read FSubjName write FSubjName;
    property CounterString: string read FCounterString write FCounterString;
    property TestMode: Boolean  read FTestMode write FTestMode;
    property ShowCounter : Boolean read FShowCounter write FShowCounter;
    property PreviousBlc : Integer read FPreviousBlc write FPreviousBlc;
    property OnEndSess: TNotifyEvent read FOnEndSess write FOnEndSess;
    property OnStmResponse : TNotifyEvent read FOnStmResponse write FOnStmResponse;
    property OnBkGndResponse : TNotifyEvent read FOnBkGndResponse write FOnBkGndResponse;
    property OnConsequence : TNotifyEvent read FOnConsequence write FOnConsequence;
    property OnEndTrial : TNotifyEvent read FOnEndTrial write FOnEndTrial;
    property OnEndBlc: TNotifyEvent read FOnEndBlc write FOnEndBlc;
    property OnHit: TNotifyEvent read FOnHit write FOnHit;
    property OnMiss: TNotifyEvent read FOnMiss write FOnMiss;
  end;

implementation

procedure TSess.BkGndResponse(Sender: TObject);
begin
  If Assigned(OnBkGndResponse) then FOnBkGndResponse(Sender);
end;

procedure TSess.EndBlc(Sender: TObject);
var IndBlc : Integer;
begin
  FPreviousBlc := FManager.CurrentBlc.Counter;
  IndBlc := FPreviousBlc;

  if FCfgSes.SesType = 'CIC' then
    begin
      FManager.OnEndBlc(Sender)
    end;

  if (FCfgSes.SesType = 'CRT') then
    begin
      if (FCfgSes.Blcs[IndBlc].ConsecutiveHitCriterion > 0) then
        begin
          // if the criterion is on
          if not FCrtReached then
            begin // end session
              FManager.CurrentBlc.Counter := FCfgSes.NumBlc;
            end
          else
            begin //next bloc
              FCrtReached := False;
              FManager.OnEndBlc(Sender)
            end;
        end
      else FManager.OnEndBlc(Sender);
    end;

  If Assigned(OnEndBlc) then FOnEndBlc(Sender);
  PlayBlc(Sender);
end;

procedure TSess.EndSess(Sender: TObject);
begin
  FRegData.SaveData('Hora de Término:' + #9 + TimeToStr(Time) + #13#10);
  FRegDataTicks.SaveData('Hora de Término:' + #9 + TimeToStr(Time) + #13#10);
  FRegData.Free;
  FRegDataTicks.Free;
  If Assigned(OnEndSess) then FOnEndSess(Sender);
end;

procedure TSess.EndTrial(Sender: TObject);
begin
   if Assigned(OnEndTrial) then FOnEndTrial (Sender);
end;

procedure TSess.Hit(Sender: TObject);
begin
  if Assigned(OnHit) then FOnHit (Sender);
end;

procedure TSess.Miss(Sender: TObject);
begin
  if Assigned(OnMiss) then FOnMiss (Sender);
end;

procedure TSess.SetBackGround(BackGround: TWinControl);
begin
  FBackGround:= BackGround;
end;

procedure TSess.StmResponse(Sender: TObject);
begin
  if Assigned(OnStmResponse) then FOnStmResponse (Sender);
end;

procedure TSess.Consequence(Sender: TObject);
begin
  if Assigned(OnConsequence) then FOnConsequence (Sender);
end;

constructor TSess.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);
  FBlc:= TBlc.Create(Self);
  FBlc.OnStmResponse:= StmResponse;
  FBlc.OnConsequence:= Consequence;
  FBlc.OnBkGndResponse:= BkGndResponse;
  FBlc.OnHit:= Hit;
  FBlc.OnMiss:= Miss;
  FBlc.OnEndBlc:= EndBlc;
  FBlc.OnEndTrial:= EndTrial;
  FBlc.OnCriteria := Criteria;
end;

procedure TSess.Criteria(Sender: TObject);
begin
  FCrtReached := True;
end;

destructor TSess.Destroy;
begin
  inherited Destroy;
end;

procedure TSess.DoEndSess(Sender: TObject);
begin
  FRegDataTicks.SaveData(#13#10+'Sessão Cancelada' + #13#10);
  FRegData.SaveData(#13#10+'Sessão Cancelada' + #13#10);
  EndSess(Sender);
end;

procedure TSess.Play(CfgSes: TCfgSes; Manager : TCounterManager; FileData: String);
begin
  FCfgSes:= CfgSes;
  FManager := Manager;

  If FileData = #0 then FileData:= 'Dados_000.txt';
  If FTestMode then FSessName:= FSessName + #9 + '(Modo de Teste)';

  FRegData:= TRegData.Create(Self, FCfgSes.HootData + FileData);
  FRegDataTicks:= TRegData.Create(Self, FCfgSes.HootData + 'Ticks_001.txt');
  FBlc.ShowCounter := ShowCounter;
  FBlc.CounterString := CounterString;
  FBlc.RegData:= FRegData;
  FBlc.RegDataTicks := FRegDataTicks;
  FBlc.BackGround:= FBackGround;
  FRegData.SaveData('Sujeito:' + #9 + FSubjName + #13#10 +
                    'Sessão:' + #9+ FSessName + #13#10 +
                    'Data:' + #9 + DateTimeToStr(Date)+ #13#10 +
                    'Hora de Início:' + #9 + TimeToStr(Time)+ #13#10 + #13#10);
  FRegDataTicks.SaveData('Sujeito:' + #9 + FSubjName + #13#10 +
                    'Sessão:' + #9+ FSessName + #13#10 +
                    'Data:' + #9 + DateTimeToStr(Date)+ #13#10 +
                    'Hora de Início:' + #9 + TimeToStr(Time)+ #13#10 + #13#10);
  FManager.OnBeginSess(Self);
  PlayBlc(Self);
end;

procedure TSess.PlayBlc(Sender: TObject);
var IndBlc, IndTrial : integer;
begin
  //FPreviousBlc was assigned at the most recent EndBlc;
  if StrToIntDef(FCfgSes.Blcs[FPreviousBlc].CustomNxtBlc, -1) <> -1 then
    IndBlc := StrToInt(FCfgSes.Blcs[FPreviousBlc].CustomNxtBlc)
  else IndBlc := FManager.CurrentBlc.Counter;

  IndTrial := FManager.CurrentTrial.Counter;
  FManager.SetVirtualTrialValue(FCfgSes.Blcs[IndBlc].VirtualTrialValue);

  if IndBlc < FCfgSes.NumBlc then FBlc.Play(FCfgSes.CfgBlc[IndBlc], FManager, IndTrial, FTestMode)
  else EndSess(Sender);
end;

end.


