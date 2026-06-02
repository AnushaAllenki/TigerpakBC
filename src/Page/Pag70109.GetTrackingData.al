page 70109 "Get Tracking Data"
{
    ApplicationArea = All;
    Caption = 'Get Tracking Data';
    PageType = List;
    SourceTable = "Posted Whse. Shipment Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                }
                field("Web Order No."; Rec."Web Order No.")
                {
                    ApplicationArea = All;
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = All;
                }
                field("DC Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    trigger OnOpenPage();
    begin

        Rec.SetFilter("Your Reference", '%1', 'WEB*');


    end;
}
