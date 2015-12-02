{
  EAM - Stimulus Control Application
  Copyright (C) 2007-2015 The EAM authors team.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}
unit uCounter;

interface

type
  TCounter = class (TObject)
    private
      FCounter : integer;
    public
      procedure Plus (Increment : integer);
      procedure Minus (Decrement : integer);
      procedure Times (Multiplier : integer);
      procedure Divide (Dividend : integer);
      procedure Clear;
      property Counter : integer read FCounter write FCounter;
  end;

implementation

{ TCounter }

procedure TCounter.Clear;
begin
  FCounter := 0;
end;

procedure TCounter.Divide(Dividend: integer);
begin
  if FCounter <> 0 then FCounter := FCounter div Dividend;
end;

procedure TCounter.Minus(Decrement: integer);
begin
  Dec(FCounter, Decrement);
end;

procedure TCounter.Plus(Increment: integer);
begin
  Inc(FCounter, Increment);
end;

procedure TCounter.Times(Multiplier: integer);
begin
  FCounter := FCounter * Multiplier;
end;

end.
