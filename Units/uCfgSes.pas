unit uCfgSes;

interface

uses
  Classes, IniFiles, SysUtils, Types, Dialogs, Forms, Windows,
  uConstants;

type

  TCfgTrial = Record
    Id : integer;
    Name: string;
    Kind: string;
    NumComp: integer;
    SList: TStringList;
  end;

  TCfgBlc = Record
    Name: string;
    NumTrials: Integer;
    VirtualTrialValue: Integer;
    ConsecutiveHitCriterion: Integer;
    ConsecutiveMissCriterion : Integer;
    MaxTrialCriterion : Integer;
    CsqHitCriterion : Integer;
    NumCrt: Integer;
    CustomNxtBlc: string;
    BkGnd: Integer;
    ITI: Integer;

    VetCfgTrial: array of TCfgTrial;
    //VetCrtBlc: array of TCrtBlc;
  end;

  TVetCfgBlc = array of TCfgBlc;

  TCoordenates = record
    Index  : Integer;
    Top    : Integer;
    Left   : Integer;
    Width  : Integer;
    Height : Integer;
  end;

  TCIniFile = class (TIniFile)
  public
    procedure ReadSectionValues(const Section: string; Strings: TStrings); override;
  end;

  TCfgSes = class(TComponent)
  protected
    //Fddd: Cardinal;
    FNumBlc: Integer;
    FNumPos: Integer;
    FCol: integer;
    FRow: integer;
    FLoaded : Boolean;
    FEdtMode : Boolean;
    FName: string;
    FMedia: string;
    FData: string;
    FType : string;
    FHootMedia: string;
    FHootData: string;
    FIniFile: TCIniFile;
    FPositions : array of TCoordenates;
    FVetCfgBlc: TVetCfgBlc;
    function GetCfgBlc(Ind: Integer): TCfgBlc;
  published
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function LoadFromFile(FileName: string; EdtMode : Boolean): Boolean;
    procedure LengthVetBlc;
    procedure LengthVetTrial (Blc : Integer);
    property CfgBlc[Ind: Integer]: TCfgBlc read GetCfgBlc;
    property Blcs : TVetCfgBlc read FVetCfgBlc write FVetCfgBlc;
    property Name: string read FName write FName;
    property NumBlc: Integer read FNumBlc write FNumBlc;
    property Data : string read FData write FData;
    property HootData: string read FHootData write FHootData;
    property Media: string read FMedia write FMedia;
    property HootMedia: string read FHootMedia write FHootMedia;
    property NumPos: Integer read FNumPos write FNumPos;
    property Row : integer read FRow write FRow;
    property Col : integer read FCol write FCol;
    property IsLoaded : Boolean read FLoaded write FLoaded;
    property EditMode : Boolean read FEdtMode write FEdtMode;
    property SesType : string read FType write FType;
  end;

implementation

uses formMain;

function TCfgSes.GetCfgBlc(Ind: Integer): TCfgBlc;
begin
  Result:= FVetCfgBlc[Ind];
end;

constructor TCfgSes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLoaded := False;
end;

destructor TCfgSes.Destroy;
var a1, a2 : Integer;
begin
    for a1:= 0 to FNumBlc - 1 do
      begin
        if Length(FVetCfgBlc) > 0 then
          for a2:= 0 to FVetCfgBlc[a1].NumTrials - 1 do
            if Length(FVetCfgBlc[a1].VetCfgTrial) > 0 then
                FVetCfgBlc[a1].VetCfgTrial[a2].SList.Free;
      end;
  inherited Destroy;
end;

procedure TCIniFile.ReadSectionValues(const Section: string; Strings: TStrings);
var
  KeyList: TStringList;
  I: Integer;
begin
  KeyList := TStringList.Create;
  //KeyList.Sorted := False;
  KeyList.CaseSensitive := False;
  KeyList.Duplicates := dupIgnore;
  try
    ReadSection(Section, KeyList);
    //showmessage(Keylist.Text);
    //Strings.BeginUpdate;
    //try
      for I := 0 to KeyList.Count - 1 do
        Strings.Add(KeyList[I] + '=' + ReadString(Section, KeyList[I], ''))
    //finally
    //  Strings.EndUpdate;
    //end;
  finally
    KeyList.Free;
  end;
end;

procedure TCfgSes.LengthVetBlc;
begin
  SetLength(FVetCfgBlc, FNumBlc);
end;

procedure TCfgSes.LengthVetTrial(Blc: Integer);
var trial : integer;
begin
  SetLength(FVetCfgBlc[Blc].VetCfgTrial, FVetCfgBlc[Blc].NumTrials);
  for trial := 0 to FVetCfgBlc[blc].NumTrials - 1 do
    begin
      if not Assigned(FVetCfgBlc[blc].VetCfgTrial[trial].SList)then
        begin
          FVetCfgBlc[blc].VetCfgTrial[trial].SList:= TStringList.Create;
          FVetCfgBlc[blc].VetCfgTrial[trial].SList.Sorted := False;
          FVetCfgBlc[blc].VetCfgTrial[trial].SList.Duplicates := dupIgnore;
          FVetCfgBlc[blc].VetCfgTrial[trial].SList.BeginUpdate;
          FVetCfgBlc[blc].VetCfgTrial[trial].SList.Add('new=true');
          FVetCfgBlc[blc].VetCfgTrial[trial].SList.EndUpdate;
        end;
    end;
end;

function TCfgSes.LoadFromFile(FileName: string; EdtMode : Boolean): Boolean;
var a1, a2, a3, a4: Integer; s1: string; NumList : TStringList;
    procedure ListCreate;
    begin
      NumList := TStringList.Create;
      //NumList.Sorted := False;
      NumList.Duplicates := dupIgnore;
    end;
begin
  if FileExists(FileName) then begin
    FIniFile:= TCIniFile.Create(FileName);
    with FIniFile do begin
      fMain.Statusbar1.Panels[0].Text := 'Carregando...';
      if  SectionExists(_Main) and
          ValueExists(_Main, _Name) and
          ValueExists(_Main, _NumBlc) then begin

        FName := ReadString(_Main, _Name, formMain.fMain.OpenDialog1.FileName);
        FNumBlc := ReadInteger(_Main, _NumBlc, 0);
        FType := ReadString(_Main, _Type, T_CIC);

        if (FType = T_CIC) or (FType = T_CRT) then
        else FType := T_CIC;

        FHootMedia:= ExtractFilePath(FileName) + ReadString(_Main, _HootMedia, 'Estímulos\');
        if not (FHootMedia[Length(FHootMedia)] = '\') then FHootMedia:= FHootMedia + '\';

        FHootData:= ExtractFilePath(FileName) + ReadString(_Main, _HootData, 'Dados\');
        if not (FHootData[Length(FHootData)] = '\') then FHootData:= FHootData + '\';

        //Fddd := GetTickCount;
        SetLength(FVetCfgBlc, FNumBlc);
        for a1:= 0 to FNumBlc-1 do
          begin
            with FVetCfgBlc[a1] do
              begin
                Name:= ReadString(_Blc + #32 + IntToStr(a1+1), _Name, '');
                BkGnd:= ReadInteger(_Blc + #32 + IntToStr(a1+1), _BkGnd, 0);
                ITI:= ReadInteger(_Blc + #32 + IntToStr(a1+1), _ITI, 0);
                ConsecutiveHitCriterion := ReadInteger(_Blc + #32 + IntToStr(a1+1), _ConsecutiveHitCriterion, -1);
                ConsecutiveMissCriterion := ReadInteger(_Blc + #32 + IntToStr(a1+1), _ConsecutiveMissCriterion, -1);
                MaxTrialCriterion:= ReadInteger(_Blc + #32 + IntToStr(a1+1), _MaxTrialCriterion, -1);
                CsqHitCriterion := ReadInteger(_Blc + #32 + IntToStr(a1+1), _CsqCriterion, -1);

                s1:= ReadString(_Blc + #32 + IntToStr(a1+1), _NumTrials, '0 0');
                NumTrials:= StrToIntDef(Copy(s1, 0, pos(' ', s1)-1), 0);
                Delete(s1, 1, pos(' ', s1)); If Length(s1)>0 then While s1[1]=' ' do Delete(s1, 1, 1);
                VirtualTrialValue:= StrToIntDef(s1, 0);
                CustomNxtBlc:= ReadString(_Blc + #32 + IntToStr(a1+1), _CustomNxtBlc, '');
                NumCrt:= ReadInteger(_Blc + #32 + IntToStr(a1+1), _NumCrt, 0);
              end;
            SetLength(FVetCfgBlc[a1].VetCfgTrial, FVetCfgBlc[a1].NumTrials);
            for a2:= 0 to FVetCfgBlc[a1].NumTrials-1 do
              begin
                with FVetCfgBlc[a1].VetCfgTrial[a2] do
                  begin
                    Name:=
                      ReadString(_Blc + #32 + IntToStr(a1+1) + ' - ' + _Trial + IntToStr(a2+1),_Name, '');
                    Kind:=
                      ReadString(_Blc + #32 + IntToStr(a1+1) + ' - ' + _Trial + IntToStr(a2+1), _Kind, '');
                    NumComp :=
                      ReadInteger(_Blc + #32 + IntToStr(a1+1) + ' - ' + _Trial + IntToStr(a2+1), _NumComp, 0);
                    SList:= TStringList.Create;
                    with SList do
                      begin
                        //SList.Sorted := False;
                        CaseSensitive := False;
                        Duplicates := dupIgnore;
                        BeginUpdate;
                        ReadSectionValues
                          (_Blc + #32 + IntToStr(a1+1) + ' - ' + _Trial + IntToStr(a2+1), SList);
                        Add('HootMedia=' + FHootMedia);
                        EndUpdate;
                      end;
                  end;
                fMain.Statusbar1.Panels[1].Text :=
                  '[' + _Blc + IntToStr(a1+1) + ' - ' + _Trial +IntToStr(a2+1) + ']';
                Application.ProcessMessages;
              end;
          end;
        //ShowMessage(FormatFloat('#####,###',GetTickCount - Fddd));
        if EdtMode then
          begin
            If  SectionExists(_Positions) and
                ValueExists(_Positions, _NumPos) then begin
              FMedia := ExtractFileName(ExcludeTrailingPathDelimiter(FHootMedia));
              FData := ExtractFileName(ExcludeTrailingPathDelimiter(FHootData));
              FNumPos := ReadInteger(_Positions, _NumPos, 0);
              FRow := ReadInteger(_Positions, _Rows, 0);
              FCol := ReadInteger(_Positions, _Cols, 0);
              SetLength(FPositions, FNumPos);
              for a4 := 0 to FNumPos - 1 do
                begin
                  s1:= ReadString(_Positions, _Pos + IntToStr(a4 + 1), '0');
                  with FPositions[a4] do
                    begin
                      Index := a4 + 1;
                      Top:= StrToIntDef(Copy(s1, 0, pos(' ', s1)-1), 0); Delete(s1, 1, pos(' ', s1)); If Length(s1)>0 then While s1[1]=' ' do Delete(s1, 1, 1);
                      Left:= StrToIntDef(Copy(s1, 0, pos(' ', s1)-1), 0); Delete(s1, 1, pos(' ', s1)); If Length(s1)>0 then While s1[1]=' ' do Delete(s1, 1, 1);
                      Width:= StrToIntDef(Copy(s1, 0, pos(' ', s1)-1), 0); Delete(s1, 1, pos(' ', s1)); If Length(s1)>0 then While s1[1]=' ' do Delete(s1, 1, 1);
                      Height:= StrToIntDef(s1, 0);
                    end;
                end;
              ListCreate;
              for a4 := 0 to FNumPos - 1 do NumList.Add(ReadString(_Positions, _Pos + IntToStr(a4 + 1), '0'));

              for a1:= 0 to FNumBlc-1 do
                for a2:= 0 to FVetCfgBlc[a1].NumTrials-1 do
                  begin
                    FVetCfgBlc[a1].VetCfgTrial[a2].SList.BeginUpdate;
                    with FVetCfgBlc[a1].VetCfgTrial[a2].SList do
                      begin
                        if NumList.IndexOf(Values[_Samp + _cBnd]) = -1 then
                          Values[_Samp + _cBnd] := '1'
                        else
                          begin
                            Values[_Samp + _cBnd] :=
                            IntToStr(NumList.IndexOf(Values[_Samp + _cBnd]) + 1);
                          end;
                      end;
                    if FVetCfgBlc[a1].VetCfgTrial[a2].NumComp > 0 then
                      for a3 := 0 to (FVetCfgBlc[a1].VetCfgTrial[a2].NumComp - 1) do
                          with FVetCfgBlc[a1].VetCfgTrial[a2].SList do
                            begin
                              if NumList.IndexOf(Values[_Comp + IntToStr(a3 + 1) + _cBnd]) = -1 then
                                Values[_Comp+IntToStr(a3+1)+_cBnd]:= '1'
                              else
                                Values[_Comp+IntToStr(a3+1)+_cBnd]:= IntToStr(NumList.IndexOf(Values[_Comp+IntToStr(a3+1)+_cBnd])+1);
                            end;

                    FVetCfgBlc[a1].VetCfgTrial[a2].SList.EndUpdate;
                  end;
              NumList.Free;
            end;
          end;
        FLoaded := True; //Diferencia "Abrir Sessão" de "Nova sessão".
        Result:= True;
      end else Result:= False;
    end;
  end else Result:= False;
end;

end.






