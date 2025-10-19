namespace TigerpakBC.TigerpakBC;

using Microsoft.CRM.Contact;

pageextension 70148 "Contact Card Ext" extends "Contact Card"
{
    layout
    {
        addafter(Minor)
        {
            field("Inactive"; Rec."Inactive")
            {
                ApplicationArea = All;
                Caption = 'Inactive';
            }
        }
    }
}
