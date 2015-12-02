{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
// JCL_DEBUG_EXPERT_INSERTJDBG OFF
// JCL_DEBUG_EXPERT_DELETEMAPFILE OFF
program EAM;

uses
  Forms,
  SysUtils,
  formAbout in 'Forms\formAbout.pas' {FmAbout},
  formBackGround in 'Forms\formBackGround.pas' {fBackGround},
  formBlocs in 'Forms\formBlocs.pas' {fBlocs},
  formCheckBoxTree in 'Forms\formCheckBoxTree.pas' {fCheckBoxTree},
  formFeedBack in 'Forms\formFeedBack.pas' {fFeedBack},
  formHelp in 'Forms\formHelp.pas' {fmHelp},
  formInterfaceTest in 'Forms\formInterfaceTest.pas' {fInterfaceTest},
  formMain in 'Forms\formMain.pas' {fMain},
  formNewSession in 'Forms\formNewSession.pas' {fNewSession},
  formPlay in 'Forms\formPlay.pas' {fPlay},
  formPositionGetter in 'Forms\formPositionGetter.pas' {fPositionGetter},
  formRandPosition in 'Forms\formRandPosition.pas' {fRandPosition},
  formRandStimuliSet in 'Forms\formRandStimuliSet.pas' {fRandStimuliSet},
  formRandTrialIndex in 'Forms\formRandTrialIndex.pas' {fRandTrialIndex},
  formRScheduleView in 'Forms\formRScheduleView.pas' {fRScheduleView},
  formShowCursor in 'Forms\formShowCursor.pas' {fShowCursor},
  formSplash in 'Forms\formSplash.pas' {fSplash},
  formTextEditor in 'Forms\formTextEditor.pas' {fTextEditor},
  formTools in 'Forms\formTools.pas' {fTools},
  formTrials in 'Forms\formTrials.pas' {fTrials},
  uBlc in 'Units\uBlc.pas',
  uCfgSes in 'Units\uCfgSes.pas',
  uConstants in 'Units\uConstants.pas',
  uCounter in 'Units\uCounter.pas',
  uCounterManager in 'Units\uCounterManager.pas',
  uCriatore in 'Units\uCriatore.pas',
  uEscriba in 'Units\uEscriba.pas',
  uKey in 'Units\uKey.pas',
  uLibrary in 'Units\uLibrary.pas',
  uRegData in 'Units\uRegData.pas',
  uSch in 'Units\uSch.pas',
  uSchMan in 'Units\uSchMan.pas',
  uSess in 'Units\uSess.pas',
  uTrial in 'Units\uTrial.pas',
  uTrialMsg in 'Units\uTrialMsg.pas',
  uTrialMTS in 'Units\uTrialMTS.pas',
  uTrialSimpl in 'Units\uTrialSimpl.pas';

{$R *.res}

begin
  fSplash:= TfSplash.Create(Application);
  fSplash.TimerSplash.Interval:= 2500;
  fSplash.ShowModal;
 {
 try
   fRandStimuliSet:= TfRandStimuliSet.Create(Application);
 finally
   fRandStimuliSet.Free;
 end; }
  ReportMemoryLeaksOnShutdown := False;

  Application.Initialize;
  Application.Title := 'EAM';
  Application.CreateForm(TfMain, fMain);
  Application.HintHidePause := MAXINT;
  Application.Run;
end.
