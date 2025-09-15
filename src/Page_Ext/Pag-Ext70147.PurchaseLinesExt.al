namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Document;

pageextension 70147 "Purchase Lines Ext" extends "Purchase Lines"
{
    // Added this field to expose in BC Purchase Line API
    //#259 Expose Fileds in BCpurchase line API
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
