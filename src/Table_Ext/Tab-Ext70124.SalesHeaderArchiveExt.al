namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Archive;

tableextension 70124 "Sales Header Archive Ext" extends "Sales Header Archive"
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
