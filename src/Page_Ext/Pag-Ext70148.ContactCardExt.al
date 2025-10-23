namespace TigerpakBC.TigerpakBC;

using Microsoft.CRM.Contact;

pageextension 70148 "Contact Card Ext" extends "Contact Card"
{
    layout
    {
        addafter(Minor)
        {
            field(Status; Rec.Status)  // #286 - Inactive Contact - To prevent selection of inactive contact in Customer Card
            {
                ApplicationArea = All;
                Caption = 'Status';
            }
        }
    }
}
