namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Archive;

pageextension 70158 "Sales Quote Archives Ext" extends "Sales Quote Archives"
{
    layout
    {
        addafter("Interaction Exist")
        {
            field("Quote Type"; rec."Quote Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
