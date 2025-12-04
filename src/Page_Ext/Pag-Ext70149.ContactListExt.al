namespace TigerpakBC.TigerpakBC;

using Microsoft.CRM.Contact;

pageextension 70149 "Contact List Ext" extends "Contact List"
{
    layout
    {
        addafter(Name)
        {
            field(Status; Rec.Status)  // #286 - Inactive Contact - To prevent selection of inactive contact in Customer Card
            {
                ApplicationArea = All;
                Caption = 'Status';
                trigger OnValidate()
                begin
                    if Rec.Status = 'Inactive' then
                        Message('This contact is inactive');

                end;
            }
        }
    }


}
