namespace TigerpakBC.TigerpakBC;

tableextension 70126 "Sales Quotes Ext" extends "Sales Quotes"    // fields created to couple in dataverse
{
    fields
    {
        field(70330; "Quote_Type_Text"; Text[50])
        {
            Caption = 'Quote Type Text';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70340; "Quote_Outcome_Text"; Text[50])
        {
            Caption = 'Quote Outcome Text';
            DataClassification = ToBeClassified;
            Editable = false;

        }
    }
}
