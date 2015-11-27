unit formInterfaceTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, StdCtrls, ExtCtrls, uLibrary, uTrial, Spin;

type
  TfInterfaceTest = class(TForm)
    grp1: TGroupBox;
    rg1: TRadioGroup;
    grp2: TGroupBox;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    se1: TSpinEdit;
    lbt1: TLabel;
    rg2: TRadioGroup;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure rg2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fInterfaceTest: TfInterfaceTest;

implementation

uses formMain;

{$R *.dfm}

procedure TfInterfaceTest.btn1Click(Sender: TObject);
begin
  if rg1.ItemIndex = -1 then ShowMessage('Selecione um dispensador.')
  else FRS232.Dispenser (rg1.ItemIndex +1);
end;

procedure TfInterfaceTest.btn2Click(Sender: TObject);
begin
  if se1.Value = 0 then ShowMessage('Selecione um dispensador.')
  else
    begin
      if (TButton(Sender).ComponentIndex = btn2.ComponentIndex) then
        FPLP.OutPortOn(se1.Value);
      if (TButton(Sender).ComponentIndex = btn3.ComponentIndex) then
        FPLP.OutPortOn(se1.Value);
      if (TButton(Sender).ComponentIndex = btn4.ComponentIndex) then
        FPLP.OutPortOff (Sender);
    end;
end;

procedure TfInterfaceTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRS232.Free;
  fMain.Visible := True;
end;

procedure TfInterfaceTest.FormCreate(Sender: TObject);
begin
  FRS232 := TRS232.Create;
  FPLP := TPLP.Create (Self);
end;

procedure TfInterfaceTest.rg2Click(Sender: TObject);
begin
  if rg2.itemindex = 0 then
    begin
      FPLP.OnTimerMethod (True);
      btn2.Enabled := True;
      btn3.Enabled := False;
      btn4.Enabled := False;
    end
  else
    begin
      FPLP.OnTimerMethod (False);
      btn2.Enabled := False;
      btn3.Enabled := True;
      btn4.Enabled := True;
    end;
end;

end.
