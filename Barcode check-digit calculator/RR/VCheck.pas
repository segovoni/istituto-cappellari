unit VCheck;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ICheck, PCheck, MCheck;

type
  TForm1 = class(TForm, ICheckView)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    VCheckPresenter : TCheckPresenter;
  public
    //input
    function GetLength: Integer;
    function GetCode: String;

    //output
    procedure SetLength(AValue : Integer);
    procedure SetResult(ACode, ADigit : String);

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i : integer;
begin
  i := VCheckPresenter.InvertCode(GetCode, GetLength);
  Edit2.Text := IntToStr(i);
end;

function TForm1.GetCode;
begin
  result := Edit1.text;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Edit1.Text := '';
  SetLength(GetLength-1);
end;

function TForm1.GetLength;
begin
  result := StrToInt(ComboBox1.Text);
end;

procedure TForm1.SetLength(AValue: Integer);
begin
  Edit1.MaxLength := AValue;
end;

procedure TForm1.SetResult(ACode, ADigit : String);
begin
  Edit3.Text := ACode + '' + ADigit;
end;

procedure TForm1.FormCreate(Sender : TObject);
begin
  VCheckPresenter := TCheckPresenter.Create(Self);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  VCheckPresenter.Free;
end;

end.