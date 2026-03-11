namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Archive;

tableextension 70128 "Sales Header Archive TExt" extends "Sales Header Archive"
{
    fields
    {
        field(70310; "Quote Type"; Option)
        {
            Caption = 'Quote Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ","RFQ - Request for Quote","CPL - Customer Price List","NBQ - New Business Quote";
        }
    }
}
