namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Document;

pageextension 70147 "Purchase Lines Ext" extends "Purchase Lines"
{
    layout
    {
        addafter("Item Category Code")
        {
            field("Item Category Group"; Rec."Item Category Group")
            {
                ApplicationArea = All;
                Visible = false;
            }

        }
    }
}
