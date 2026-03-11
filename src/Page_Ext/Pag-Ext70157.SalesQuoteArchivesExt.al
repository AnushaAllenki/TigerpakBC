namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Archive;

pageextension 70157 "Sales Quote Archives Ext" extends "Sales Quote Archives"
{
    layout
    {
        addafter("Interaction Exist")
        {
            field("Quote Type"; Rec."Quote Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
