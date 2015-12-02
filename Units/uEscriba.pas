{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit uEscriba;

interface

uses
    Dialogs, Classes, ComCtrls, StdCtrls, Graphics, SysUtils, IniFiles,
    uCfgSes, uRegData, uConstants, Forms;

type

       TEscriba = class(TCfgSes)
       private
        //FRegData: TRegData;
        FWriteK : Boolean;
        FRichEdit : TRichEdit;
        FText : TStringList;
        FIndBlc : Integer;
        FIndTrial : Integer;
        FIndComp : Integer;
        //FSaveFuckYeah : TNotifyEvent;
        function GetBlc (BlcIndex : Integer; Closed : Boolean) : string;
        function GetBlcTrial (BlcIndex, TrialIndex : Integer) : string;
        function GetBnd (S : Boolean): string;
        function GetComparison (CompIndex : Integer) : string;
        function GetPosition (PosIndex : Integer) : string;
        procedure WriteMain;
        procedure WriteBlc;
        procedure WriteTrial;
        procedure WriteKind (kind : string);
        procedure WriteComp;
        procedure WritePos;
        procedure WriteSupportKeyboard;
        procedure WriteToRichEdit;
        procedure LoadRichEdit (RichEdit : TRichEdit);
       public
        constructor Create (AOwner : TComponent); override;
        destructor Destroy; override;
        procedure CleanRichEditPlease;
        procedure SaveTextToTXT (Name : String);
        procedure SetVariables;
        procedure SetMain;
        procedure SetBlc (n : Integer; Write : Boolean);
        procedure SetTrial (n : integer);
        procedure SetComp (n : Integer);
        procedure SetK(CanWrite : Boolean);
        procedure SetPositions (ArrayofPositions : array of TCoordenates);
        procedure SetPosWriteOnly;
        procedure SetKplusAfterPositiveTrialOnly;
        property RichEdit : TRichEdit read FRichEdit write LoadRichEdit;
       end;

implementation

//uses formMain, formTextEditor, formPositionGetter;

{Writer}

procedure TEscriba.WriteBlc;
begin
  FText.Add (
             GetBlc(FIndBlc + 1, True) + KEnter + KEnter +
             KName        + FVetCfgBlc[FIndBlc].Name + KEnter +
             KBackGround  + IntToStr(FVetCfgBlc[FIndBlc].BkGnd) + KEnter +
             KITInterval  + IntToStr (FVetCfgBlc[FIndBlc].ITI) + KEnter +
             KNumCrt      + IntToStr (FVetCfgBlc[FIndBlc].NumCrt) + KEnter +
             KNumTrial    + IntToStr(FVetCfgBlc[FIndBlc].NumTrials) + #32 + IntToStr(FVetCfgBlc[FIndBlc].VirtualTrialValue) + KEnter +
             KConsecutiveHitCriterion   + IntToStr (FVetCfgBlc[FIndBlc].ConsecutiveHitCriterion) + KEnter +
             KConsecutiveMissCriterion   + IntToStr (FVetCfgBlc[FIndBlc].ConsecutiveMissCriterion) + KEnter +
             KMaxTrialCriterion   + IntToStr (FVetCfgBlc[FIndBlc].MaxTrialCriterion) + KEnter
             );
end;

procedure TEscriba.WriteComp;
var i : integer;
begin
  i := FIndComp + 1;
  FText.Add(GetComparison (i) + KBnd + GetBnd (false) + KEnter +
          GetComparison (i) + KStm +
          FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [GetComparison (i) + _cStm] + KEnter +
          GetComparison (i) + KSch +
          FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [GetComparison (i) + _cSch] + KEnter +
          GetComparison (i) + KIET +
          FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [GetComparison (i) + _cIET] + KEnter +
          GetComparison (i) + KUsb +
          FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [GetComparison (i) + _cUsb] + KEnter +
          GetComparison (i) + KCsq +
          FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [GetComparison (i) + _cCsq] + KEnter +
          GetComparison (i) + KMsg +
          FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [GetComparison (i) + _cMsg] + KEnter +
          GetComparison (i) + KRes +
          FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [GetComparison (i) + _cRes] + KEnter +
          GetComparison (i) + KNxt +
          FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [GetComparison (i) + _cNxt] + KEnter +
          GetComparison (i) + KTO +
          FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [GetComparison (i) + _cTO] + KEnter);
end;

procedure TEscriba.WriteKind(kind: string);
var i : Integer; NumComp: String;
begin
  if kind = T_Msg then
    begin
        FText.Add(KMsg + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values[_cMsg] + KEnter +
                KWidth + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values[_MsgWidth] + KEnter +
                KFontSize + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values[_MsgFontSize]  + KEnter +
                KFontColor + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values[_MsgFontColor] + KEnter +
                KBackGround + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values[_BkGnd] + KEnter +
                KPrompt + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values[_Prompt] + KEnter);
    end;
  if kind = T_Simple then
    begin
      NumComp := IntToStr(FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].NumComp);
      FText.Add(KNumComp + NumComp + KEnter);
      for i := 0 to StrToInt (NumComp) - 1 do SetComp (i);
      if FWriteK then WriteSupportKeyboard;
    end;
  if kind = T_MTS then
    begin
      NumComp := IntToStr(FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].NumComp);
      FText.Add(
                KComAtraso + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Delayed] + KEnter +
                KAtraso + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Delay] + KEnter +
                _Samp + KBnd + GetBnd(True) + KEnter +
                _Samp + KStm + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Samp + _cStm] + KEnter +
                _Samp + KSch + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Samp + _cSch] + KEnter +
                _Samp + KMsg + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Samp + _cMsg] + KEnter + KEnter +
                KNumComp + NumComp + KEnter
                );
      for i := 0 to StrToInt (NumComp) - 1 do SetComp (i);
      if FWriteK then WriteSupportKeyboard;
    end;
end;

procedure TEscriba.WriteMain;
begin
  FText.Add(
            KMain  + KEnter +
            KName  + FName + KEnter +
            KType  + FType + KEnter +
            KHootMedia + FMedia + KEnter +
            KHootData  + FData + KEnter +
            KNumBlc  + IntToStr(FNumBlc) + KEnter
            );
end;

procedure TEscriba.WritePos;
var i : Integer;
begin
  FText.Add(
            KPositions + KEnter +
            KRows + IntToStr (FRow)+ KEnter +
            KCols + IntToStr (FCol)+ KEnter +
            KNumPos + IntToStr(FNumPos) + KEnter
            );
  for i := 0 to FNumPos - 1 do
    begin
      FText.Add(GetPosition (i + 1) + '=' + #9 + IntToStr(FPositions[i].Top) + #32 +
                                                 IntToStr(FPositions[i].Left) + #32 +
                                                 IntToStr(FPositions[i].Width) + #32 +
                                                 IntToStr(FPositions[i].Height));
    end;
end;

procedure TEscriba.WriteSupportKeyboard;
begin
  FText.Add(
            KEnter +
            _Kplus + KMsg + 'Tecla +' + KEnter +
            _Kplus + KCsq + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Kplus + _cCsq] + KEnter +
            _Kplus + KUsb + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Kplus + _cUsb] + KEnter +
            _Kplus + KRes + 'NONE' + KEnter +
            _Kplus + KNxt + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Kplus + _cNxt] + KEnter +
            KEnter +
            _Kminus + KMsg + 'Tecla -' + KEnter +
            _Kminus + KCsq + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Kminus + _cCsq] + KEnter +
            _Kminus + KUsb + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Kminus + _cUsb] + KEnter +
            _Kminus + KRes + 'NONE' + KEnter +
            _Kminus + KNxt + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Kminus + _cNxt]
            );
end;

procedure TEscriba.WriteTrial;
begin
  FText.Add(
            GetBlcTrial(FIndBlc + 1, FIndTrial + 1) + KEnter + KEnter +
            KName + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].Name + KEnter +
            KKind + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].Kind + Kenter +
            KBackGround + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_BkGnd] + KEnter +
            KCursor + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Cursor] + KEnter +
            KAutoNext + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_AutoNxt] + KEnter +
            KCustomNext + FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_CustomNxtValue] + KEnter
            );
  WriteKind(FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].Kind);
end;

procedure TEscriba.WriteToRichEdit;
begin
 FRichEdit.Lines.BeginUpdate;
 FRichEdit.Lines.AddStrings(FText);
 FRichEdit.Lines.EndUpdate;
 FText.Clear;
end;

{ TEscriba }

procedure TEscriba.CleanRichEditPlease;
begin
  FRichEdit.Lines.BeginUpdate;
  FRichEdit.Lines.Clear;
  FRichEdit.Lines.EndUpdate;
end;

constructor TEscriba.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TEscriba.Destroy;
begin
  FText.Free;
  FRichEdit := nil;
  inherited Destroy;
end;

function TEscriba.GetBlc (BlcIndex : Integer; Closed : Boolean) : string;
begin
  if Closed then
    Result := '[' + 'Blc' + #32 + IntToStr (BlcIndex) + ']'
  else Result := 'Blc' + #32 + IntToStr (BlcIndex);
end;

function TEscriba.GetBlcTrial(BlcIndex, TrialIndex: Integer): string;
begin
  Result := '[' + GetBlc(BlcIndex, false) + #32 + '-' + #32 + 'T' + IntToStr (TrialIndex) + ']';
end;

function TEscriba.GetBnd (S : Boolean) : string;
var position : integer; bnd : string;
begin
  if S then position := StrToIntDef (FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [_Samp + _cBnd], 1)
  else position := StrToIntDef (FVetCfgBlc[FIndBlc].VetCfgTrial[FIndTrial].SList.Values [GetComparison (FIndComp + 1) + 'Bnd'],1);

  bnd := IntToStr (FPositions[position -1].Top) + #32 +
         IntToStr (FPositions[position -1].Left) + #32 +
         IntToStr (FPositions[position -1].Width) + #32 +
         IntToStr (FPositions[position -1].Height);

  Result := bnd;
end;

function TEscriba.GetComparison(CompIndex: Integer): string;
begin
  Result := 'C' + IntToStr(CompIndex);
end;

function TEscriba.GetPosition(PosIndex: Integer): string;
begin
  Result := 'P' + IntToStr(PosIndex);
end;

procedure TEscriba.LoadRichEdit(RichEdit: TRichEdit);
begin
  FRichEdit := RichEdit;
end;

procedure TEscriba.SaveTextToTXT(Name : String);
var a1: integer;s1,s2: string;// Memo : TMemo;
begin
  ForceDirectories(ExtractFilePath(Name));
  a1 := 0;
  s1:= Copy(Name, 0, Length(Name)-4);
  s2:= Copy(Name, Length(Name)-3, 4);
  while FileExists (name) do
    begin
      Inc(a1);
      name := s1 + StringOfChar(#48, 3 - Length(IntToStr(a1))) + IntToStr(a1) + s2;
    end;
  //Memo := TMemo.Create(Self);
  FText.Text := RichEdit.Text;
  FText.SaveToFile(Name);
  FText.Clear;
end;

procedure TEscriba.SetBlc(n: Integer; Write : Boolean);
begin
  FIndBlc := n;
  if Write then
    begin
      WriteBlc;
      WriteToRichEdit;
    end;
end;

procedure TEscriba.SetComp(n: Integer);
begin
  FIndComp := n;
  WriteComp;
end;

procedure TEscriba.SetK(CanWrite: Boolean);
begin
  FWriteK := CanWrite;
end;

procedure TEscriba.SetKplusAfterPositiveTrialOnly;
var OldString, NewString, OldPattern, NewPattern : string;
    Flags : TReplaceFlags;
begin
  OldPattern := 'C1Res=' + #9 + 'HIT';
  NewPattern := OldPattern + #13#10 +
                'K+USB=' + #9 + '1';
  Flags := [rfReplaceAll];
  OldString := FRichEdit.Text;

  NewString := StringReplace (OldString, OldPattern, NewPattern, Flags);
  RichEdit.Text := NewString;
end;

procedure TEscriba.SetMain;
begin
  WriteMain;
  WriteToRichEdit;
end;

procedure TEscriba.SetPosWriteOnly;
begin
  WritePos;
  WriteToRichEdit;
end;

procedure TEscriba.SetPositions(ArrayofPositions: array of TCoordenates);
var i, size : integer;
begin
      size := Length (ArrayofPositions);
      FNumPos := size;
      SetLength (FPositions, size);
      for i := 0 to size - 1 do
        begin
          FPositions[i] := ArrayofPositions[i];
        end;

  WritePos;
  WriteToRichEdit;
end;

procedure TEscriba.SetTrial(n: integer);
begin
  FIndTrial := n;
  WriteTrial;
  WriteToRichEdit;
end;

procedure TEscriba.SetVariables;
begin
  FText := TStringList.Create;
  FText.Sorted := False;
  FText.Duplicates := dupIgnore;
  //FRegData := TRegData.Create(Self, GetCurrentDir + '\Files Settings' + 'Sessão_000.txt');
end;

end.
