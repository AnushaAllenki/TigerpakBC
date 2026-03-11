namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Archive;

pageextension 70156 "Sales Quote Archive Ext" extends "Sales Quote Archive"
{
    layout
    {
        addafter(Status)
        {
            field("Quote Type"; Rec."Quote Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
