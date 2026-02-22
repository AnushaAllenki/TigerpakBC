namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Vendor;

pageextension 70155 "Vendor Card Ext" extends "Vendor Card"
{

    layout
    {
        addafter("Pop-up Alert")
        {
            field("In TigerSource"; Rec."In TigerSource")
            {
                ApplicationArea = All;
            }

            field("Item Category Group"; Rec."Item Category Group")
            {
                ApplicationArea = All;
            }
        }
    }


}
