table 70103 "Top10DormantItems Buffer"
{
    Caption = 'Top 10 Dormant Items Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(70001; "Item No."; Code[20]) { }
        field(70002; Description; Text[100]) { }
        field(70003; "Total Sales Amount"; Decimal) { }
        field(70004; "Last Sale Date"; Date) { }
        field(70005; "Days Since Last Sale"; Integer) { }
    }

    keys
    {
        key(PK; "Item No.") { Clustered = true; }
        key(TotalSalesKey; "Total Sales Amount") { }
    }
}
