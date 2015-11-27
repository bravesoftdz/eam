unit uConstants;

interface

const
  //Posições
  _Positions : string = 'Positions';
  _Cols : string = 'Cols';
  _Rows : string = 'Rows';
  _NumPos : string = 'NumPos';

  //Main
  _Main : string = 'Main';
  _Name : string = 'Name';
  _Media  : string = 'Media';
  _Data  : string = 'Data';
  _HootData  : string = 'HootData';
  _HootMedia  : string = 'HootMedia';
  _NumBlc : string = 'NumBlc';
  _Type : string = 'Type';

  //Blc
  _NumTrials : string = 'NumTrials';
  _ConsecutiveHitCriterion  : string = 'ConsecutiveHitCriterion';
  _ConsecutiveMissCriterion  : string = 'ConsecutiveMissCriterion';
  _MaxTrialCriterion : string = 'MaxTrialCriterion';
  _CsqCriterion  : string = 'CsqCriterion';
  _CustomNxtBlc : string = 'CustomNxtBlc';
  _NumCrt : string = 'NumCrt';
  _ITI  : string = 'ITI';

  //Blc Trial
  _BkGnd  : string = 'BkGnd';

  //Trial
  _Cursor : string = 'Cursor';
  _AutoNxt : string = 'AutoNxt';
  _CustomNxtValue : string = 'CustomNxtValue';
  _Kind : string = 'Kind';

  //MSG
  _Msg : string = 'Msg';
  _MsgWidth : string = 'MsgWidth';
  _MsgFontSize: string = 'MsgFontSize';
  _MsgFontColor: string = 'MsgFontColor';
  _Prompt: string = 'Prompt';

  //MTS
  _Delayed : string = 'Delayed';
  _Delay : string = 'Delay';

  //Comparações
  _NumComp : string = 'NumComp';


   _cBnd : string = 'Bnd';
   _cStm : string = 'Stm';
   _cSch : string = 'Sch';
   _cMsg : string = 'Msg';
   _cCsq : string = 'Csq';
   _cUsb : string = 'Usb';
   _cRes : string = 'Res';
   _cNxt : string = 'Nxt';
   _cIET : string = 'IET';
   _cTO  : string = 'TO';

  //Identificadores
  _Kplus : string = 'K+';
  _Kminus : string = 'K-';
  _Pos : string = 'P';
  _Blc : string = 'Blc';
  _Trial : string = 'T';
  _Comp : string = 'C';
  _Samp : string = 'S';


const
  KEnter : string = #13#10;
  KPositions : string = '[Positions]' + #13#10;
  KMain : string = '[Main]' + #13#10;
  KName : string = 'Name=' + #9;
  KType : string = 'Type=' + #9;
  KMedia : string = 'Media=' + #9;
  KHootMedia : string = 'HootMedia=' + #9;
  KData : string = 'Data=' + #9;
  KHootData : string = 'HootData=' + #9;
  KNumBlc : string = 'NumBlc=' + #9;
  KNumTrial : string = 'NumTrials=' + #9;
  KNumCrt : string = 'NumCrt=' + #9;
  KConsecutiveHitCriterion : string = 'ConsecutiveHitCriterion=' + #9;
  KConsecutiveMissCriterion : string = 'ConsecutiveMissCriterion=' + #9;
  KMaxTrialCriterion : string = 'MaxTrialCriterion=' + #9;
  KCsqCriterion: string = 'CsqCriterion=' + #9;
  KNumComp : string = 'NumComp=' + #9;
  KRows : string = 'Rows=' + #9;
  KCols : string = 'Cols=' + #9;
  KNumPos : string = 'NumPos=' + #9;
  KBackGround : string = 'BkGnd=' + #9;
  KITInterval : string = 'ITI=' + #9;
  KCursor : string = 'Cursor=' + #9;
  KKind : string = 'Kind=' + #9;
  KComAtraso : string = 'Delayed=' + #9;
  KAtraso : string = 'Delay=' + #9;
  KAutoNext : string = 'AutoNxt=' + #9;
  KCustomNextBcl : string = 'CustomNxtBlc=' + #9;
  KCustomNext : string = 'CustomNxtValue=' + #9;
  KWidth : string = 'MsgWidth=' + #9;
  KFontSize : string = 'MsgFontSize=' + #9;
  KFontColor : string = 'MsgFontColor=' + #9;
  KPrompt : string = 'Prompt=' + #9;

  KBnd : string = 'Bnd=' + #9;
  KStm : string = 'Stm=' + #9;
  KIET : string = 'IET=' + #9;
  KSch : string = 'Sch=' + #9;
  KMsg : string = 'Msg=' + #9;
  KCsq : string = 'Csq=' + #9;
  KUsb : string = 'Usb=' + #9;
  KRes : string = 'Res=' + #9;
  KNxt : string = 'Nxt=' + #9;
  KTO  : string = 'TO='  + #9;

  {Session Parameters}
  T_CIC : string = 'CIC';
  T_CRT : string = 'CRT';

  {General Parameters}
  T_END : string = 'END';

  {Trial Kinds}
  T_Msg : string = 'MSG';
  T_MTS : string = 'MTS';
  T_Simple : string = 'SIMPLE';

  {Sch}
  T_RR : string = 'RR';
  T_FR : string = 'FR';
  T_VR : string = 'VR';
  T_RI : string = 'RI';
  T_FI : string = 'FI';
  T_VI : string = 'VI';
  T_RT : string = 'RT';
  T_VT : string = 'VT';
  T_FT : string = 'FT';
  T_CRF : string = 'CRF';
  T_EXT : string = 'EXT';
  T_DRL : string = 'DRL';
  T_DRH : string = 'DRH';

  {Res}
  T_HIT : string = 'HIT';
  T_MISS : string = 'MISS';
  T_NONE : string = 'NONE';

  {Nxt}
  T_REP : string = 'CRT';

implementation

end.
