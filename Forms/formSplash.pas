unit formSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfSplash = class(TForm)
    Image1: TImage;
    lbl1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure TimerSplashTimer(Sender: TObject);
    procedure TimerAlphaBledTimer (Sender: TObject);
  public
    { Public declarations }
    TimerSplash: TTimer;
    TimerAlphaBlend: TTimer;
  end;

var
  fSplash: TfSplash;

implementation

{$R *.dfm}

procedure TfSplash.FormCreate(Sender: TObject);
begin

  TimerSplash := TTimer.Create(Self);
  With TimerSplash do begin
    Enabled := false;
    OnTimer := TimerSplashTimer;
  end;

  TimerAlphaBlend := TTimer.Create(Self);
  With TimerAlphaBlend do begin
    Enabled := True;
    Interval := 1;
    OnTimer := TimerAlphaBledTimer;
  end;
end;

procedure TfSplash.FormShow(Sender: TObject);
begin
  TimerSplash.Enabled:= True;
end;

procedure TfSplash.TimerAlphaBledTimer(Sender: TObject);
begin
  if AlphaBlendValue < 255 then AlphaBlendValue := AlphaBlendValue + 5;
end;

procedure TfSplash.TimerSplashTimer(Sender: TObject);
begin
  TimerSplash.Enabled:= False;
  TimerAlphaBlend.Enabled := False;
  Close;
end;

end.
