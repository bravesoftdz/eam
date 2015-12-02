{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit formBackGround;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Direct2d, D2D1, uCriatore;

type
  TfBackGround = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    FEdt: Boolean;
    FPointer : TPointer;
    FResolution :TPointer;
    FPanel : TPanel;
    procedure CustomPaint(Canvas: TCustomCanvas);
  public
    procedure FullScreen;
    procedure Editing(aSquare, aResolution : TPointer);
    procedure SetPanel (Sender : TPanel);
  end;

var
  fBackGround: TfBackGround;

implementation

{$R *.dfm}


procedure TfBackGround.Editing(aSquare, aResolution: TPointer);
begin
  FEdt := True;
  FPointer := aSquare;
  FResolution := aResolution;
end;

procedure TfBackGround.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  I: Integer;
begin
  if FEdt then
    if Button = mbLeft then
      begin
          FPointer.FCapturing := True;
          FPointer.FPIndex := -1;
          for I := 0 to Length(FPointer.FP) - 1 do
            begin
              if (FPointer.FP[I].X - X)*(FPointer.FP[I].X - X) +
                 (FPointer.FP[I].Y - Y)*(FPointer.FP[I].Y - Y) < 35 then
              begin
                FPointer.FPIndex := I;
                FPointer.FFocused := True;
                Break;
              end;
            end;
          FormMouseMove(Sender, Shift, X, Y);
      end;

end;

procedure TfBackGround.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var i : integer;
begin
  if FEdt then
    if (FPointer.FPIndex >= 0) and FPointer.FCapturing then
      begin
          if (FPointer.FPIndex = 0) then
            begin
              FPointer.FP[FPointer.FPIndex].X := X;
              FPointer.FP[FPointer.FPIndex].Y := Y;
            end;
          if (FPointer.FPIndex = 1) then
            begin
              FPointer.FP[FPointer.FPIndex].X := X;
              FPointer.FP[FPointer.FPIndex].Y := Y;
            end;
        FPanel.BoundsRect := Rect(FPointer.FP[0], FPointer.FP[1]);
        //Invalidate;
      end
    else
      begin
        for I := 0 to Length(FPointer.FP) - 1 do
          begin
            if (FPointer.FP[I].X - X)*(FPointer.FP[I].X - X) +
               (FPointer.FP[I].Y - Y)*(FPointer.FP[I].Y - Y) < 25 then
              begin
                FPointer.FFocused := True;
                fBackGround.Cursor := crCross;
                //Invalidate;
                Exit;
              end;
              fBackGround.Cursor := crDefault;
          end;

      end;
end;

procedure TfBackGround.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FEdt then
    begin
      FPointer.FCapturing := False;
    end;
  //Invalidate;
end;

procedure TfBackGround.FormPaint(Sender: TObject);
  procedure PaintElypses;
  var i:Integer;
  begin
    with Canvas do
      begin
        Pen.Width := 1;
        Pen.color := clWhite;
        Pen.Mode := pmXor;
        Brush.Style := bsClear;
        for i := 0 to Length(FPointer.FP) - 1 do
          Ellipse(FPointer.FP[i].x-10, FPointer.FP[i].Y-10,
                  FPointer.FP[i].x+10, FPointer.FP[i].Y+10);
      end;
  end;

  procedure PaintResolutionSquare;
  begin
    with Canvas do
      begin
        Pen.Width := 1;
        Pen.color := clRed;
        Pen.Mode := pmCopy;
        Brush.Style := bsClear;
        Rectangle(FResolution.FP[0].X, FResolution.FP[0].Y,
                  FResolution.FP[1].X, FResolution.FP[1].Y);
      end;
  end;
begin
  if FEdt then
    begin
      Canvas.Pen.Color := clBlack;
      Canvas.pen.Width := 1;
      Canvas.Brush.Color := clBlack;
      Canvas.Brush.Style := bsSolid;
      CustomPaint(Canvas);

      //if FPointer.FFocused then
        PaintElypses;

      //if FResolution.FFocused then
        PaintResolutionSquare;

      canvas.Pen.Mode := pmCopy;
      canvas.brush.style := bssolid;
    end;
end;

procedure TfBackGround.CustomPaint(Canvas: TCustomCanvas);
begin

end;

procedure TfBackGround.FullScreen;
begin
  Show;
end;
procedure TfBackGround.SetPanel(Sender: TPanel);
begin
  FPanel := TPanel(Sender);
end;

end.
