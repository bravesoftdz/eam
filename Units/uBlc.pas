{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit uBlc;

interface

uses Classes, IdGlobal, Controls, Windows, ExtCtrls, SysUtils, StrUtils, Graphics, Forms,
     uCfgSes, uTrial, uRegData, Dialogs, StdCtrls,
     uTrialMsg, uConstants,  uKey,
     uTrialMTS, uTrialSimpl, uCounterManager;

type

  TBlc = class(TComponent)
  private
    FLastResultWasHit : Boolean;
    FCounterLabel : TLabel;
    FTrial: TTrial;
    FIETMedia : TKey;
    FManager : TCounterManager;
    FData : String;
    FDataTicks : String;
    FBlcHeader: String;
    FRegData: TRegData;
    FRegDataTicks: TRegData;
    FNextBlc: String;
    FOnEndBlc: TNotifyEvent;
    FBackGround: TWinControl;
    FCfgBlc: TCfgBlc;
    FLastHeader: String;
    FTimerITI: TTimer;
    FTimerTO : TTimer;
    FTimerCsq : TTimer;
    FShowCounter : Boolean;
    FTestMode: Boolean;
    FIsCorrection : Boolean;
    FOnBeginCorrection : TNotifyEvent;
    FOnEndCorrection : TNotifyEvent;
    FOnStmResponse: TNotifyEvent;
    FOnEndTrial: TNotifyEvent;
    FOnBkGndResponse: TNotifyEvent;
    //FOnBeginTrial: TNotifyEvent;
    FOnConsequence: TNotifyEvent;
    FOnHit: TNotifyEvent;
    FOnMiss: TNotifyEvent;
    FOnCriteria: TNotifyEvent;
    FCounterString: string;
    procedure CreateIETMedia(FileName, HowManyLoops, Color : String);
    procedure ShowCounterPlease (Kind : String);
    procedure IETResponse(Sender: TObject);
    procedure IETConsequence(Sender: TObject);
    procedure EndBlc(Sender: TObject);
    procedure PlayTrial;
    procedure WriteTrialData(Sender: TObject);
    procedure TrialTerminate(Sender: TObject);
    procedure TimerITITimer(Sender: TObject);
    procedure TimerTOTimer(Sender: TObject);
    procedure TimerCsqTimer(Sender: TObject);
    procedure StmResponse(Sender: TObject);
    procedure BkGndResponse(Sender: TObject);
    procedure Hit(Sender: TObject);
    procedure Miss(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Play(CfgBlc: TCfgBlc; Manager : TCountermanager; IndTent: Integer; TestMode: Boolean);
    property ShowCounter : Boolean read FShowCounter write FShowCounter;
    property CounterString : string read FCounterString write FCounterString;
    property RegData: TRegData read FRegData write FRegData;
    property RegDataTicks: TRegData read FRegDataTicks write FRegDataTicks;
    property BackGround: TWinControl read FBackGround write FBackGround;
    property NextBlc: String read FNextBlc write FNextBlc;
    property OnEndBlc: TNotifyEvent read FOnEndBlc write FOnEndBlc;
    property OnStmResponse : TNotifyEvent read FOnStmResponse write FOnStmResponse;
    property OnBkGndResponse : TNotifyEvent read FOnBkGndResponse write FOnBkGndResponse;
    property OnConsequence : TNotifyEvent read FOnConsequence write FOnConsequence;
    property OnEndTrial : TNotifyEvent read FOnEndTrial write FOnEndTrial;
    property OnHit: TNotifyEvent read FOnHit write FOnHit;
    property OnMiss: TNotifyEvent read FOnMiss write FOnMiss;
    property OnBeginCorrection: TNotifyEvent read FOnBeginCorrection write FOnBeginCorrection;
    property OnEndCorrection: TNotifyEvent read FOnEndCorrection write FOnEndCorrection;
    property OnCriteria: TNotifyEvent read FOnCriteria write FOnCriteria;
  end;

implementation

//uses fUnit6;

procedure TBlc.EndBlc(Sender: TObject);
begin
  FRegData.SaveData(#13#10);
  FRegDataTicks.SaveData(#13#10);
  If Assigned(OnEndBlc) then FOnEndBlc(Sender);
end;


procedure TBlc.Hit(Sender: TObject);
begin
  FLastResultWasHit := True;
  FManager.OnHit(Sender);
  if FCfgBlc.CsqHitCriterion > 0 then
    if FCfgBlc.CsqHitCriterion = FManager.BlcCsqHits.Counter then       //Procedimento da Ana Paula, acertos consecutivos produzindo csq
      begin
        FManager.OnCsqCriterion(Sender);
        FTrial.DispenserPlusCall;
      end;
  If Assigned(OnHit) then FOnHit(Sender);
end;

procedure TBlc.IETConsequence(Sender: TObject);
begin
  BkGndResponse(Sender);
end;

procedure TBlc.IETResponse(Sender: TObject);
begin
  BkGndResponse(Sender);
end;

procedure TBlc.Miss(Sender: TObject);
begin
  FLastResultWasHit := False;
  FManager.OnMiss(Sender);
  If Assigned(OnMiss) then FOnMiss(Sender);
end;

procedure TBlc.TrialTerminate(Sender: TObject);
var s0, s1, s2, s3, s4 : string;
    csqDuration : Integer;
  procedure SetValuesToStrings (var as1, as2, as3, as4 : string);
  begin
    s0 := FTrial.IETConsequence + #32;
    as1:= FTrial.HootMedia + Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as2:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as3:= Copy(s0, 0, pos(#32, s0)-1);
    Delete(s0, 1, pos(#32, s0)); If Length(s0)>0 then While s0[1]=#32 do Delete(s0, 1, 1);
    as4:= Copy(s0, 0, pos(#32, s0)-1);
  end;
begin
  FRegData.SaveData (FData);
  FRegDataTicks.SaveData(FDataTicks);
  FData := '';
  FDataTicks := '';

  if  (FTrial.NextTrial = 'END') then //finalizar sessão
    FManager.CurrentTrial.Counter := FCfgBlc.NumTrials
  else //ir para a próxima tentativa
    if (FTrial.NextTrial = 'CRT') or             // FTrial.NextTrial base 1, FManager.CurrentTrial.Counter base 0)
       (FTrial.NextTrial = (IntToStr(FManager.CurrentTrial.Counter + 1))) then
      begin //quando é possível tentativas de correção
        if ((FCfgBlc.NumCrt) = FManager.BlcCscCorrections.Counter) and
           (FCfgBlc.NumCrt <> 0) then
          begin
            FManager._VirtualTrialFix;
            FManager.OnNotCorrection(Sender);   //tentativa de correção não ocorreu
            FManager.OnEndTrial (Sender);
            FIsCorrection := False;
          end
        else
          begin
            FManager.OnCorrection(Sender);  //tentativa de correção ocorreu
            FIsCorrection := True;
          end;
      end
    else  //quando não é possível tentativas de correção
      if StrToIntDef(FTrial.NextTrial, 0) > 0 then
        begin //quando a tentativa seguinte é definida pelo usuário
          if FTrial.Result = 'MISS' then
            FManager.VirtualTrialLoop.Counter := FManager.VirtualTrialValue;//ir para o próximo loop

          FManager.OnNotCorrection(Sender);
          FManager.CurrentTrial.Counter := StrToIntDef(FTrial.NextTrial, 0) - 1;
          FManager.OnNxtTrial (Sender);
          FIsCorrection := False;
        end
      else   //
        begin
          if FTrial.Result = 'MISS' then
            FManager.VirtualTrialLoop.Counter := FManager.VirtualTrialValue;

          FManager.OnNotCorrection(Sender);
          FManager.OnEndTrial (Sender);
          FIsCorrection := False;
        end;

  //Critérios de ACERTO atingido
  if  ((FCfgBlc.ConsecutiveHitCriterion > 0) and (FCfgBlc.ConsecutiveHitCriterion = FManager.BlcCscHits.Counter))
   //or ((FCfgBlc.ConsecutiveMissCriterion > 0) and (FCfgBlc.ConsecutiveMissCriterion = FManager.BlcCscMisses.Counter))
   or ((FTrial.NextTrial = IntToStr(FCfgBlc.MaxTrialCriterion)) and (FCfgBlc.MaxTrialCriterion > 0))
  then
      begin
        if Assigned(OnCriteria) then FOnCriteria(Sender);
        FManager.CurrentTrial.Counter := FCfgBlc.NumTrials
      end;

  SetValuesToStrings(s1, s2, s3, s4);
  if (StrToIntDef(s4, 0) > 0) then
  begin
    if StrToIntDef(s2, 1) > 1 then csqDuration := StrToIntDef(s4, 0) * StrToIntDef(s2, 1)
    else csqDuration := StrToIntDef(s4, 0);
  end else csqDuration := 0;


  if FTestMode then FTimerITI.Interval:= 0
  else
    begin
      if FCfgBlc.ITI > 0 then FTimerITI.Interval:= FCfgBlc.ITI
      else FTimerITI.Interval:= 0;

      if FTrial.TimeOut > 0 then FTimerTO.Interval:= FTrial.TimeOut
      else FTimerTO.Interval:= 0;

      if csqDuration > 0 then FTimerCsq.Interval:= csqDuration
      else FTimerCsq.Interval:= 0;

    end;

  if FTrial.TimeOut > 0 then
    if FBackGround is TForm then TForm(FBackGround).Color:= 0;

  FTrial.Free;
  if Assigned(OnEndTrial) then FOnEndTrial(Sender);  //Erro quando o Nxt = 0{Resolvido}


  //showmessage(s0 + #13#10 +s1 + #13#10 +s2 + #13#10 +s3 + #13#10);
    if (FTimerITI.Interval = 0)
     and (FTimerTO.Interval = 0)
     and (FTimerCsq.Interval = 0) then
     begin
       PlayTrial;
     end else
    begin
      if (FTimerITI.Interval > 0)
       and (FTimerTO.Interval > 0)
       and (FTimerCsq.Interval > 0) then
        begin
          if ShowCounter then ShowCounterPlease (CounterString);
          FTimerITI.Enabled:= True;
        end else
      begin
        if (FTimerITI.Interval > 0)
           and (FTimerTO.Interval = 0)
           and (FTimerCsq.Interval = 0) then
          begin
            if ShowCounter then ShowCounterPlease (CounterString);
            FTimerITI.Enabled:= True;
          end;
        if ((FTimerITI.Interval > 0) or (FTimerCsq.Interval > 0))
           and (FTimerTO.Interval = 0) then
          begin
            CreateIETMedia(s1, s2, s3);
            BlockInput(True);
            FTimerCsq.Enabled:= True;
          end;

        if ((FTimerITI.Interval > 0) or (FTimerTO.Interval > 0))
           and (FTimerCsq.Interval = 0) then
          begin
            FTimerTO.Enabled:= True;
          end;
      end
    end;
end;

procedure TBlc.TimerCsqTimer(Sender: TObject);
begin
  FTimerCsq.Enabled := False;
  if Assigned(FIETMedia) then
    begin
      FreeAndNil(FIETMedia);
      BlockInput(False);
    end;
  if (FTimerITI.Interval > 0) then
    begin
      if ShowCounter then ShowCounterPlease (CounterString);
      FTimerITI.Enabled:= True;
    end
  else PlayTrial;
end;

procedure TBlc.TimerITITimer(Sender: TObject);
begin
  if Assigned(FCounterLabel) then
    begin
      FreeAndNil(FCounterLabel);
    end;
  FTimerITI.Enabled:= False;
  PlayTrial;
end;

procedure TBlc.TimerTOTimer(Sender: TObject);
begin
  FTimerTO.Enabled := False;
  if FBackGround is TForm then TForm(FBackGround).Color:= FCfgBlc.BkGnd;

  if (FTimerITI.Interval > 0) then
    begin
      if ShowCounter then ShowCounterPlease (CounterString);
      FTimerITI.Enabled:= True;
    end
  else PlayTrial;
end;

procedure TBlc.WriteTrialData(Sender: TObject);
var CountTr, NumTr, NameTr: String;
begin
  If FTrial.Header <> FLastHeader then
    begin
      FData:= FData + #13#10+FBlcHeader+FTrial.Header+#13#10;
      FDataTicks:= FDataTicks + #13#10 + FBlcHeader + FTrial.HeaderTicks + #13#10;
    end;
  FLastHeader:= FTrial.Header;
  FBlcHeader:= #32#32#32#32#32#32#32#32#9#32#32#32#32#32#32#32#32#9;

  CountTr := IntToStr(FManager.Trials.Counter + 1);
  NumTr:= IntToStr(FManager.CurrentTrial.Counter + 1);
  if FCfgBlc.VetCfgTrial[FManager.CurrentTrial.Counter].Name = '' then NameTr:= '--------'
  else NameTr:= FCfgBlc.VetCfgTrial[FManager.CurrentTrial.Counter].Name;

  FData:= FData + CountTr + #9 + NumTr + #9 + NameTr + #9 + FTrial.Data + #13#10;
  FDataTicks:= FDataTicks + CountTr + #9 + NumTr + #9 + FTrial.DataTicks +  #13#10;

  if (FTrial is TMsg) then else
    if Assigned(OnConsequence) then FOnConsequence (Sender);
  //saber o que a paula quer que apareça no Relatório quando o CsqHitCriterion ocorrer
end;

procedure TBlc.BkGndResponse(Sender: TObject);
begin
  if Assigned(OnBkGndResponse) then FOnBkGndResponse (Sender);
end;

constructor TBlc.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);
  FData := '';
  FTimerITI:= TTimer.Create(Self);
  with FTimerITI do begin
    Enabled:= False;
    OnTimer:= TimerITITimer;
  end;

  FTimerTO:= TTimer.Create(Self);
  with FTimerTO do begin
    Enabled:= False;
    OnTimer:= TimerTOTimer;
  end;

  FTimerCsq:= TTimer.Create(Self);
  with FTimerCsq do begin
    Enabled:= False;
    OnTimer:= TimerCsqTimer;
  end;
end;

procedure TBlc.CreateIETMedia(FileName, HowManyLoops, Color : string);
begin
  if FileExists(Filename) then
    begin
      BlockInput(true);
      //showmessage(filename);
      FIETMedia := TKey.Create(FBackGround);
      FIETMedia.Cursor:= FBackGround.Cursor;
      FIETMedia.Parent:= FBackGround;
      FIETMedia.OnConsequence:= IETConsequence;
      FIETMedia.OnResponse:= IETResponse;
      FIETMedia.HowManyLoops := StrToIntDef(HowManyLoops, 0);
      FIETMedia.Color := StrToIntDef(Color, 0);
      FIETMedia.Width := Screen.Width;
      FIETMedia.Height := Screen.Height;
      {
      FIETMedia.Width := (Screen.Width div 5) * 4;
      FIETMedia.Height := (Screen.Height div 5) * 4;
      FIETMedia.Top := (Screen.Height div 2) - (FIETMedia.Height div 2);
      FIETMedia.Left := (Screen.Width div 2) - (FIETMedia.Width div 2);
      }
      FIETMedia.FullPath := FileName;
      FIETMedia.Play;
      FIETMedia.FullScreen;
      //FTrial.IETConsequence := '';
      //FIETMedia.Show;

    end;
end;

destructor TBlc.Destroy;
begin
  Inherited Destroy;
end;

procedure TBlc.Play(CfgBlc: TCfgBlc; Manager : TCountermanager; IndTent: Integer; TestMode: Boolean);
//var a1: Integer;
begin
  FCfgBlc:= CfgBlc;
  FManager := Manager;

  FTestMode:= TestMode;

  FLastHeader:= '';

  FManager.CurrentTrial.Counter := IndTent;
  FIsCorrection := False;

  FBlcHeader:= 'Núm.Tent'+#9+'Nom.Tent'+#9;
  FRegData.SaveData(FCfgBlc.Name);
  FRegDataTicks.SaveData(FCfgBlc.Name);
  PlayTrial;
end;

procedure TBlc.PlayTrial;
var IndTrial : integer;
begin
 if FBackGround is TForm then TForm(FBackGround).Color:= FCfgBlc.BkGnd;
  IndTrial := FManager.CurrentTrial.Counter;
  If IndTrial < FCfgBlc.NumTrials then begin
    FTrial:= nil;

    If FCfgBlc.VetCfgTrial[IndTrial].Kind = T_Msg then FTrial:= TMSG.Create(Self);
    If FCfgBlc.VetCfgTrial[IndTrial].Kind = T_MTS then FTrial:= TMTS.Create(Self);
    If FCfgBlc.VetCfgTrial[IndTrial].Kind = T_Simple then FTrial:= TSimpl.Create(Self);

    If Assigned(FTrial) then begin
      FTrial.Parent:= FBackGround;
      FTrial.Align:= AlClient;
      FTrial.OnEndTrial:= TrialTerminate;
      FTrial.OnConsequence:= WriteTrialData;
      FTrial.OnStmResponse:= StmResponse;
      FTrial.OnBkGndResponse:= BkGndResponse;
      FTrial.OnHit:= Hit;
      FTrial.OnMiss:= Miss;
      FTrial.CfgTrial:= FCfgBlc.VetCfgTrial[IndTrial];
      FTrial.Visible := False;
      FTrial.Play(FManager, FTestMode, FIsCorrection);
      FTrial.Visible := True;
      FTrial.SetFocus;
      BlockInput(False);
    end else EndBlc(Self);
    FIsCorrection := False;
  end else EndBlc(Self);

end;

procedure TBlc.ShowCounterPlease(Kind: String); //iet counter
begin
  if Kind = 'VHR' then // shows virtual hit in acoord with the loop specified
  begin
    FCounterLabel := TLabel.Create(FBackGround);
    with FCounterLabel do
    begin
      Parent:= FBackGround;
      Cursor:= FBackGround.Cursor;
      AutoSize := True;
      WordWrap := True;
      //if FManager.VirtualHitLoop.Counter = 0 and FManager.v then

      Caption := IntToStr(FManager.OnHitResult);
      //Color := clBtnFace;
      Font.Size := 100;
      Font.Color := clWhite;
      Top := (Screen.Height div 2) - (Height div 2);
      Left := (Screen.Width div 2) - (Width div 2);
    end
  end;

  if Kind = 'HIT' then //cummulative hit recorder
  begin
    if FLastResultWasHit then
      begin
        FCounterLabel := TLabel.Create(FBackGround);
        with FCounterLabel do
        begin
          Parent:= FBackGround;
          Cursor:= FBackGround.Cursor;
          AutoSize := True;
          WordWrap := True;
          //if FManager.VirtualHitLoop.Counter = 0 and FManager.v then

          Caption := IntToStr(FManager.Hits.Counter);
          //Color := clBtnFace;
          Font.Size := 100;
          Font.Color := clWhite;
          Top := (Screen.Height div 2) - (Height div 2);
          Left := (Screen.Width div 2) - (Width div 2);
        end
      end;
  end;
end;

procedure TBlc.StmResponse(Sender: TObject);
begin
  if Assigned(OnStmResponse) then FOnStmResponse (Sender);
end;

end.
