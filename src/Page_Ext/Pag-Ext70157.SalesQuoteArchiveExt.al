namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Archive;

pageextension 70157 "Sales Quote Archive Ext" extends "Sales Quote Archive"
{
    layout
    {
        addafter(Status)
        {
            field("Quote Type"; rec."Quote Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
