unit MSeats;

interface

uses
  DataModule, IDataSeats;

//type
//  TDataSeats = class
//  protected
//    FData: IData;
//    FDataSeats: TDataSeats;
//  public
//    function GetFreeSeats(): string;
//  published
//    constructor Create(AData: IData);
//  end;

implementation

//constructor TDataSeats.Create(AData: IData);
//begin
//  FData := AData;
//
//end;

//function TDataSeats.GetFreeSeats(): string;
//begin
//  DataModule.FDataSeats.ADOQuery1.Close;
//  DataModule.FDataSeats.ADOQuery1.ClearFields;
//  DataModule.FDataSeats.ADOQuery1.SQL.Text := 'WITH C1 as ( ' +
//    'SELECT ROW_NUMBER() OVER(ORDER BY RowNumber) AS Row#, RowNumber, Taken FROM dbo.RoomsAndSeats ), '
//    + 'C2 AS( ' +
//    'SELECT ROW_NUMBER() OVER(ORDER BY RowNumber) AS Taken#, * FROM C1	WHERE Taken = 1), '
//    + 'C3 AS( ' + 'SELECT Row# - Taken# AS ''Islands'', * FROM C2 ) ' +
//    'SELECT RowNumber, MIN(Row#) AS ''First'', MAX(Row#) AS ''Last'', COUNT(Islands) AS ''N� FreeSeats'' FROM C3 GROUP BY RowNumber, Islands';
//  DataModule.FDataSeats.ADOQuery1.Open;
//  Result := DataModule.FDataSeats.DataSource1.Name;
//end;

end.
