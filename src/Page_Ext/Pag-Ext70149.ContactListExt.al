namespace TigerpakBC.TigerpakBC;

using Microsoft.CRM.Contact;

pageextension 70149 "Contact List Ext" extends "Contact List"
{
    // layout
    // {
    //     addafter(Name)
    //     {
    //         field("Inactive"; Rec."Inactive")  // #286 - Inactive Contact - To prevent selection of inactive contact in Customer Card
    //         {
    //             ApplicationArea = All;
    //             Caption = 'Inactive';
    //             trigger OnValidate()
    //             begin
    //                 if Rec."Inactive" then
    //                     Message('This contact is inactive');

    //             end;
    //         }
    //     }
    // }


}
