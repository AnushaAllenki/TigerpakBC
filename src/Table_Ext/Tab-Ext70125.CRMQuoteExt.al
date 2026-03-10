namespace TigerpakBC.TigerpakBC;

using Microsoft.Integration.D365Sales;

tableextension 70125 "CRM QuoteExt" extends "CRM Quote"
{
    fields
    {
        field(70100; "Quote_Outcome"; Text[50])
        {
            ExternalName = 'tp_quoteoutcome';
            ExternalType = 'String';
            Description = '';
            Caption = 'Quote Outcome';
        }
        field(70101; "Quote_Type"; Text[50])
        {
            ExternalName = 'tp_quotetype';
            ExternalType = 'String';
            Description = '';
            Caption = 'Quote Type';
        }
    }
}
