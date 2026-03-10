namespace TigerpakBC.TigerpakBC;

using Microsoft.Integration.D365Sales;

tableextension 70127 "CRM AccountExt" extends "CRM Account"
{
    fields
    {
        field(70100; "Marketing Industry"; Text[50])
        {
            ExternalName = 'tp_marketingindustry';
            ExternalType = 'String';
            Description = '';
            Caption = 'Marketing Industry';
        }
    }
}
