unit ModelFreeSeats;

interface

uses DataModuleFreeSeats, TypeArrayOfArrayOfString;

type
  TModelFreeSeats = class
    private
        FNearbySeats: string;
        procedure SetSQL;
    public
        function GetAvailableSeats(): TArrayOfArrayString;
    published
      constructor Create(ANearbySeats: string);
end;

implementation

{ TModelFreeSeats }

constructor TModelFreeSeats.Create(ANearbySeats: string);
begin
    FNearbySeats:=ANearbySeats;
end;




function TModelFreeSeats.GetAvailableSeats: TArrayOfArrayString;
var Li, Lj: integer;
begin
    SetSQL;
    Li:=0;
    DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.First;
    while not (DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.Eof) do begin
        SetLength(Result, Li+1);
        SetLength(Result[Li], 5);

        Result[Li][0]:=DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.Fields[0].AsString;
        Result[Li][1]:=DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.Fields[1].AsString;
        Result[Li][2]:=DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.Fields[2].AsString;
        Result[Li][3]:=DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.Fields[3].AsString;
        Result[Li][4]:=DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.Fields[4].AsString;

        Li:=Li+1;
        DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.Next
    end;
end;



procedure TModelFreeSeats.SetSQL;
var Li, LCount: integer;
begin
    LCount:=DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.SQL.Count;
    if (LCount > 1) then begin
        while not (DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.SQL.Count = 1) do begin
            DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.SQL.Delete(1);
        end;
    end;

    DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.SQL.Add(FNearbySeats);
    DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.SQL.Add(DataModuleFreeSeats.QueryFreeSeatsEnd);

    DataModuleFreeSeats.DataModFreeSeats.QueryFreeSeats.Open;
end;

end.
