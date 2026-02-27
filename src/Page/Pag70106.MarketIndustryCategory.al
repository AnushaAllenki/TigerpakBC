namespace TigerpakBC.TigerpakBC;

page 70106 "Market Industry_Category"
{
    ApplicationArea = All;
    Caption = 'Market Industry_Category';
    PageType = List;
    SourceTable = "Market Industry Category";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Market Industry Category"; rec."Market Industry Category")
                {
                    ApplicationArea = All;
                    Caption = 'Market Industry Category';
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
            }
        }
    }
}
