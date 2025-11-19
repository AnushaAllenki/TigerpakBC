namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Document;

page 70103 "TP Salesorder Timestamps"
{
    ApplicationArea = All;
    Caption = 'TP Salesorder Timestamps';
    PageType = Card;
    SourceTable = "Sales Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(documentNo; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(dateTimeCreated; Format(Rec."Order creation time/date", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>.<Minutes,2>.<Seconds,2>'))
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time when order was created.';
                }
                field(amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount exclude GST';
                }
                field(amountInclGST; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount including GST';
                }
                field(invoicedAmount; Rec."WT Invoiced Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the invoiced amount';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the salesperson who is assigned to the customer.';
                }
                field(branch; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("CreatedBy"; Rec."Created By")
                {
                    ApplicationArea = All;
                }

                field("WHSE Shipment Created By"; Rec."WHSE Shipment Created By")
                {
                    ApplicationArea = All;
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = All;
                }
                field("ModifiedBy"; Rec."Modified By")
                {
                    ApplicationArea = All;
                }
                field(DateFrom; DateFrom)
                {
                    ApplicationArea = all;
                }
                field(DateTo; DateTo)
                {
                    ApplicationArea = all;
                }
                field(dateTimeCreated1; Format(GetAdjustedTimeFromWebServiceFirst(Rec."Order creation time/date"), 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>.<Minutes,2>.<Seconds,2>'))
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time when order was created.';
                }
            }
        }
    }

    trigger OnOpenPage()

    begin

        DateFrom := CalcDate('<-CM>', Today);
        DateTo := CalcDate('<CM>', Today);
        // DateFrom := GetAdjustedTimeFromWebServiceFirst(CreateDateTime(CalcDate('<-CM>', Today), 000000T));
        // DateTo := GetAdjustedTimeFromWebServiceLast(CreateDateTime(CalcDate('<CM>', Today), 235959T));
        Rec.SetRange("Document Type", Rec."Document Type"::Order);
        Rec.SetFilter("Order creation time/date", '%1..%2', CreateDateTime(DateFrom, 000000T), CreateDateTime(DateTo, 235959T));
        // Rec.SetFilter("Order creation time/date", '%1..%2', GetAdjustedTimeFromWebServiceFirst(CreateDateTime(CalcDate('<-CM>', Today), 000000T)), GetAdjustedTimeFromWebServiceLast(CreateDateTime(CalcDate('<CM>', Today), 235959T)));
        if Rec.FindSet() then;
    end;

    procedure GetAdjustedTimeFromWebServiceFirst(fromDatetime: DateTime) return: datetime
    var
        UTCTime: DateTime;
        LocalTime: DateTime;
        TimeZoneOffset: Integer;
    begin
        // Simulating a web service call returning UTC time (e.g., from Business Central)
        // UTCTime := CreateDateTime(CalcDate('<-CM>', Today), 000000T);//DT2Time(CurrentDateTime)); // Assume this function gets the UTC time
        UTCTime := fromDatetime;
        // Define the time zone offset (example: UTC+1 for Central European Time - CET)
        TimeZoneOffset := 10;

        // Convert the UTC time to local time considering DST
        LocalTime := ConvertUTCToLocalTimeWithDST(UTCTime, TimeZoneOffset);

        // Display the adjusted local time
        exit(LocalTime);
    end;

    procedure GetAdjustedTimeFromWebServiceLast(ToDatetime: DateTime) return: datetime
    var
        UTCTime: DateTime;
        LocalTime: DateTime;
        TimeZoneOffset: Integer;
    begin
        // Simulating a web service call returning UTC time (e.g., from Business Central)
        // UTCTime := CreateDateTime(CalcDate('<CM>', Today), 235959T);//DT2Time(CurrentDateTime)); // Assume this function gets the UTC time
        UTCTime := ToDatetime;
        // Define the time zone offset (example: UTC+1 for Central European Time - CET)
        TimeZoneOffset := 9.5;

        // Convert the UTC time to local time considering DST
        LocalTime := ConvertUTCToLocalTimeWithDST(UTCTime, TimeZoneOffset);

        // Display the adjusted local time
        exit(LocalTime);
    end;

    procedure IsDST(Date: DateTime; TimeZoneOffset: Integer): Boolean
    var
        Year: Integer;
        LastSundayOfMarch: DateTime;
        LastSundayOfOctober: DateTime;
    begin
        Year := Date2DMY(today, 3);

        // Find the last Sunday of March
        LastSundayOfMarch := GetLastSundayOfMonth(Year, 3);

        // Find the last Sunday of October
        LastSundayOfOctober := GetLastSundayOfMonth(Year, 10);

        // Check if the given date is between the last Sunday of March and the last Sunday of October
        if (Date >= LastSundayOfMarch) and (Date <= LastSundayOfOctober) then
            exit(true) // It's DST
        else
            exit(false); // It's not DST
    end;

    procedure GetLastSundayOfMonth(Year: Integer; Month: Integer): DateTime
    var
        FirstDayOfMonth: Date;
        LastDay: Date;
        DayOfWeek: Integer;
    begin
        FirstDayOfMonth := DMY2Date(1, Month, Year);

        // Calculate the last day of the month
        LastDay := CALCDATE('<CM+1D-1D>', FirstDayOfMonth);

        // Get the day of the week for the last day of the month (1 = Monday, 7 = Sunday)
        DayOfWeek := DATE2DWY(LastDay, 1);

        // Adjust to the last Sunday
        if DayOfWeek <> 7 then
            LastDay := CALCDATE('<-1D>', LastDay - (DayOfWeek MOD 7));

        exit(CreateDateTime(LastDay, 000000T));
    end;

    procedure ConvertUTCToLocalTimeWithDST(UTCTime: DateTime; TimeZoneOffset: Integer): DateTime
    var
        LocalTime: DateTime;
        IsDSTApplicable: Boolean;
    begin
        // Check if DST applies for the given date
        IsDSTApplicable := IsDST(UTCTime, TimeZoneOffset);

        // Adjust the offset based on DST
        if IsDSTApplicable then
            TimeZoneOffset := TimeZoneOffset + 1; // Add 1 hour for DST

        // Convert UTC time to local time by applying the adjusted time zone offset
        LocalTime := UTCTime + (TimeZoneOffset * 60 * 60); // TimeZoneOffset is in hours, so multiply by 60*60 for seconds
        exit(LocalTime);
    end;

    var
        //         DateFrom: Datetime;
        //         DateTo: Datetime;
        DateFrom: Date;
        DateTo: Date;


}



