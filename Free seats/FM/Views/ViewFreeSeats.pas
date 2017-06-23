unit ViewFreeSeats;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, InterfaceFreeSeats, PresenterFreeSeats,
  TypeArrayOfArrayOfString, Vcl.Grids;

type
  TFormFreeSeats = class(TForm, IFreeSeats)
    lblSeatsInput: TLabel;
    edtSeatsInput: TEdit;
    lblSeatsOutput: TLabel;
    btnSearch: TButton;
    strGridSeats: TStringGrid;
    //using TStringGrid instead of TDBGrid to pass records manually and preserve portability
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    FPresenter: TPresenterFreeSeats;
  public
    function GetNearbySeats: string;
    procedure DisplayAvailableSeats (const ASeatsArr: TArrayOfArrayString);
  end;

var
  FormFreeSeats: TFormFreeSeats;

implementation

{$R *.dfm}



procedure TFormFreeSeats.btnSearchClick(Sender: TObject);
begin
    strGridSeats.RowCount:=1;
    FPresenter.ShowSeats;
end;





procedure TFormFreeSeats.DisplayAvailableSeats(
  const ASeatsArr: TArrayOfArrayString);
var Li: integer;
begin
    for Li := low(ASeatsArr) to high(ASeatsArr) do begin
        strGridSeats.RowCount:=strGridSeats.RowCount+1;
        strGridSeats.Cells[0, Li+1]:=ASeatsArr[Li, 0];
        strGridSeats.Cells[1, Li+1]:=ASeatsArr[Li, 1];
        strGridSeats.Cells[2, Li+1]:=ASeatsArr[Li, 2];
        strGridSeats.Cells[3, Li+1]:=ASeatsArr[Li, 3];
        strGridSeats.Cells[4, Li+1]:=ASeatsArr[Li, 4];
    end;
end;





procedure TFormFreeSeats.FormCreate(Sender: TObject);
begin
    strGridSeats.Cells[0, 0]:='ID Stanza';
    strGridSeats.Cells[1, 0]:='Fila';
    strGridSeats.Cells[2, 0]:='Da posto n.�';
    strGridSeats.Cells[3, 0]:='A posto n.�';
    strGridSeats.Cells[4, 0]:='N.� posti consecutivi liberi';

    FPresenter:=TPresenterFreeSeats.Create(self);
end;





function TFormFreeSeats.GetNearbySeats: string;
begin
    Result:=edtSeatsInput.Text;
end;

end.
