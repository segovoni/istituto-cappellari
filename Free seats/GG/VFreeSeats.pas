{*****************************************************************************}
{                                                                             }
{                         Ricerca Posti Adiacenti                             }
{                                                                             }
{      Gianmaria G.                                                           }
{                                                                             }
{      Corso Programmazione ERP @ Istituto Cappellari                         }
{                                                                             }
{      8/6/2017                                                               }
{                                                                             }
{*****************************************************************************}

unit VFreeSeats;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IFreeSeats, PFindSeats, Vcl.ComCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm, IFreeSeatsView)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    BtnFindSeats: TButton;
    UpDown1: TUpDown;
    EdtSeatsNumber: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnFindSeatsClick(Sender: TObject);
  private
    FFindSeatsP : TFindSeats;
    function GetSeatsNumber : string;
    procedure ReciveDBGridDataModule(ADataSource : TDataSource);
    procedure SetDBGridDataModule(ADataSource : TDataSource);
  public

  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.BtnFindSeatsClick(Sender: TObject);
begin
  FFindSeatsP.SendSeatsNumberToModel(GetSeatsNumber);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    FFindSeatsP := TFindSeats.create(self);
end;

function TForm1.GetSeatsNumber: string;
begin
  result := EdtSeatsNumber.Text ;
end;

// Ricevo dal model il DataSource
procedure TForm1.ReciveDBGridDataModule(ADataSource: TDataSource);
begin
  SetDBGridDataModule(ADataSource);
end;

procedure TForm1.SetDBGridDataModule(ADataSource: TDataSource);
begin
   DBGrid1.DataSource := ADataSource;
end;

end.
