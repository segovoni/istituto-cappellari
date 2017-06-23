unit InterfaceFreeSeats;

interface

uses TypeArrayOfArrayOfString;

type IFreeSeats = interface ['{32557FF8-0BD4-4EDA-B9E2-5DCB954D86AD}']
    function GetNearbySeats: string;
    procedure DisplayAvailableSeats (const ASeatsArr: TArrayOfArrayString);
end;

implementation

end.