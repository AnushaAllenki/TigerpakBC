namespace TigerpakBC.TigerpakBC;

using Microsoft.Integration.D365Sales;

tableextension 70127 "CRM AccountExt" extends "CRM Account"
{
    fields
    {
        field(70100; ""; Text[30])
        {
            ExternalName = '';
            ExternalType = 'String';
            Description = '';
            Caption = 'TP_Status';
        }
    }
}
