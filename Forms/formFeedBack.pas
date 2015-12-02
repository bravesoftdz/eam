{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit formFeedBack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IdGlobal,
  Dialogs,
  uCfgSes, uSess, uCounterManager,
  StdCtrls, ExtCtrls;

type
  TfFeedBack = class(TForm)
    pnlBlcCurrent: TPanel;
    pnlTrialCurrent: TPanel;
    pnlClock: TPanel;
    pnlLatency: TPanel;
    pnlSessionDuration: TPanel;
    pnlBlcTotal: TPanel;
    pnlTrialTotal: TPanel;
    pnlConsequenceCount: TPanel;
    pnlBkGndCount: TPanel;
    pnlResponseCount: TPanel;
    pnlConsecutiveHit: TPanel;
    pnlConsecutiveMiss: TPanel;
    pnlHitCount: TPanel;
    pnlMissCount: TPanel;
    pnlHighConsecutiveHit: TPanel;
    pnlHighConsecutiveMiss: TPanel;
    pnlBlcCorrections: TPanel;
    pnlBlcCscCorrections: TPanel;
    pnlVirtualTrialLoop: TPanel;
    pnlVirtualTrial: TPanel;
    pnlBlcCsqHits: TPanel;
    pnlVirtualHitLoop: TPanel;
    pnlHits: TPanel;
    pnlVirtualHits: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    //FFlagResp : Boolean;
    FCfgSes : TCfgSes;
    FManager : TCounterManager;
    FtmrOld: Cardinal;
    tmrClock : TTimer;
    tmrLatency: TTimer;
    FTimeElapsed : Extended;
    FOnConsequence: TNotifyEvent;
    FOnEndTrial: TNotifyEvent;
    FOnBeginTrial: TNotifyEvent;
    FOnBkGndResponse: TNotifyEvent;
    FOnStmResponse: TNotifyEvent;
    FOnEndBlc: TNotifyEvent;
    FOnEndSess: TNotifyEvent;
    FOnBeginSess: TNotifyEvent;
    FOnHit: TNotifyEvent;
    FOnMiss: TNotifyEvent;
    procedure LabelResponseCount (Sender: TObject);
    procedure LabelClockTimer(Sender: TObject);
    procedure LabelLatencyTimer(Sender: TObject);
    procedure LabelConsequenceCount (Sender: TObject);
    procedure LabelOnBkGndResponseCount(Sender: TObject);
    procedure LabelCurrentTrial(Sender: TObject);
    procedure LabelCurrentBlc(Sender: TObject);
    procedure LabelHit(Sender: TObject);
    procedure LabelMiss(Sender: TObject);
    procedure BeginSess(Sender: TObject);
  public
    property OnBeginSess: TNotifyEvent read FOnBeginSess write FOnBeginSess;
    property OnBeginTrial : TNotifyEvent read FOnBeginTrial write FOnBeginTrial;
    property OnBkGndResponse : TNotifyEvent read FOnBkGndResponse write FOnBkGndResponse;
    property OnConsequence : TNotifyEvent read FOnConsequence write FOnConsequence;
    property OnEndBlc: TNotifyEvent read FOnEndBlc write FOnEndBlc;
    property OnEndSess: TNotifyEvent read FOnEndSess write FOnEndSess;
    property OnEndTrial : TNotifyEvent read FOnEndTrial write FOnEndTrial;
    property OnHit: TNotifyEvent read FOnHit write FOnHit;
    property OnMiss: TNotifyEvent read FOnMiss write FOnMiss;
    property OnStmResponse : TNotifyEvent read FOnStmResponse write FOnStmResponse;
    property CfgSes : TCfgSes read FCfgSes write FCfgSes;
    property Manager : TCounterManager read FManager write FManager;
  end;

var
  fFeedBack: TfFeedBack;

implementation

{$R *.dfm}

procedure TfFeedBack.BeginSess(Sender: TObject);
var IndBlc, IndTrial : integer;
begin
  IndBlc := FManager.CurrentBlc.Counter;
  IndTrial := FManager.CurrentTrial.Counter;

  if IndBlc <= FCfgSes.NumBlc then begin
    pnlBlcCurrent.Caption := IntToStr(IndBlc + 1);
    pnlBlcTotal.Caption:= IntToStr(FCfgSes.NumBlc);
    pnlTrialCurrent.Caption := IntToStr(IndTrial + 1);
    pnlTrialTotal.Caption:= IntToStr(FCfgSes.CfgBlc[IndBlc].NumTrials);
    pnlVirtualHitLoop.Caption := IntToStr(FManager.VirtualHitLoop.Counter);
    pnlVirtualTrialLoop.Caption := IntToStr(FManager.VirtualTrialLoop.Counter + 1);
    pnlVirtualTrial.Caption := IntToStr(FManager.VirtualTrial.Counter + 1);
  end;
  FtmrOld:= GetTickCount;
  tmrLatency.Enabled:= True;
end;

procedure TfFeedBack.FormCreate(Sender: TObject);
begin
  if Screen.MonitorCount > 1 then
    begin
      Top := Screen.PrimaryMonitor.Top;
      Left := Screen.PrimaryMonitor.Left + 10;
    end;
  FTimeElapsed := Time;
  pnlClock.Caption := TimeToStr(Time);
  pnlSessionDuration.Caption := TimeToStr(Time - FTimeElapsed);
  OnStmResponse := LabelResponseCount;
  OnConsequence := LabelConsequenceCount;
  OnBkGndResponse := LabelOnBkGndResponseCount;
  OnBeginSess := BeginSess;
  OnEndTrial := LabelCurrentTrial;
  OnEndBlc := LabelCurrentBlc;
  OnHit := LabelHit;
  OnMiss := LabelMiss;

  tmrClock := TTimer.Create(Self);
  with tmrClock do
    begin
      Enabled := True;
      OnTimer := LabelClockTimer;
    end;

  tmrLatency := TTimer.Create(Self);
  with tmrLatency do
    begin
      Enabled := False;
      Interval := 100;
      OnTimer := LabelLatencyTimer;
    end;
end;

procedure TfFeedBack.LabelResponseCount(Sender: TObject);
begin
  pnlResponseCount.Caption := IntToStr(FManager.TrialStmResponses.Counter);
end;

procedure TfFeedBack.LabelClockTimer(Sender: TObject);
begin
  pnlClock.Caption := TimeToStr(Time);
  pnlSessionDuration.Caption := TimeToStr(Time - FTimeElapsed);
end;

procedure TfFeedBack.LabelConsequenceCount(Sender: TObject);
begin
  pnlConsequenceCount.Caption := IntToStr(FManager.Consequences.Counter);
end;

procedure TfFeedBack.LabelCurrentBlc(Sender: TObject);
var IndBlc : integer;
begin
  IndBlc := FManager.CurrentBlc.Counter;
  if IndBlc < FCfgSes.NumBlc then begin
    pnlMissCount.Caption := IntToStr (FManager.BlcMisses.Counter);
    pnlConsecutiveMiss.Caption := IntToStr (FManager.BlcCscMisses.Counter);
    pnlHighConsecutiveMiss.Caption := IntToStr (FManager.BlcHighCscMisses.Counter);

    pnlHitCount.Caption := IntToStr (FManager.BlcHits.Counter);
    pnlConsecutiveHit.Caption := IntToStr (FManager.BlcCscHits.Counter);
    pnlHighConsecutiveHit.Caption := IntToStr (FManager.BlcHighCscHits.Counter);
    pnlBlcCsqHits.Caption := IntToStr (FManager.BlcCsqHits.Counter);

    pnlBlcCurrent.Caption := IntToStr(IndBlc + 1);
    pnlTrialTotal.Caption:= IntToStr(FCfgSes.CfgBlc[IndBlc].NumTrials);
  end;
end;

procedure TfFeedBack.LabelCurrentTrial(Sender: TObject);
begin
  FtmrOld:= GetTickCount;
  pnlTrialCurrent.Caption := IntToStr(FManager.CurrentTrial.Counter + 1);
  pnlBlcCscCorrections.Caption := IntToStr(FManager.BlcCscCorrections.Counter);
  pnlBlcCorrections.Caption := IntToStr(FManager.BlcCorrections.Counter);
  pnlVirtualTrialLoop.Caption := IntToStr(FManager.VirtualTrialLoop.Counter + 1);
  pnlVirtualTrial.Caption := IntToStr(FManager.VirtualTrial.Counter + 1);
  pnlVirtualHitLoop.Caption := IntToStr(FManager.VirtualHitLoop.Counter);
  pnlHits.Caption := IntToStr(FManager.Hits.Counter);
  pnlVirtualHits.Caption := IntToStr(FManager.VirtualHits.Counter);
end;

procedure TfFeedBack.LabelHit(Sender: TObject);
begin
  pnlHitCount.Caption := IntToStr (FManager.BlcHits.Counter);
  pnlConsecutiveHit.Caption := IntToStr (FManager.BlcCscHits.Counter);
  pnlHighConsecutiveHit.Caption := IntToStr (FManager.BlcHighCscHits.Counter);
  pnlBlcCsqHits.Caption := IntToStr (FManager.BlcCsqHits.Counter);
  pnlConsecutiveMiss.Caption := IntToStr (FManager.BlcCscMisses.Counter);
end;

procedure TfFeedBack.LabelLatencyTimer(Sender: TObject);
begin
  pnlLatency.Caption := UIntToStr(GetTickDiff(FtmrOld, GetTickCount));
end;

procedure TfFeedBack.LabelMiss(Sender: TObject);
begin
  pnlMissCount.Caption := IntToStr (FManager.BlcMisses.Counter);
  pnlConsecutiveMiss.Caption := IntToStr (FManager.BlcCscMisses.Counter);
  pnlHighConsecutiveMiss.Caption := IntToStr (FManager.BlcHighCscMisses.Counter);
  pnlConsecutiveHit.Caption := IntToStr (FManager.BlcCscHits.Counter);
  pnlBlcCsqHits.Caption := IntToStr (FManager.BlcCsqHits.Counter);
end;

procedure TfFeedBack.LabelOnBkGndResponseCount(Sender: TObject);
begin
  pnlBkGndCount.Caption := IntToStr(FManager.TrialBkGndResponses.Counter);
end;

end.
