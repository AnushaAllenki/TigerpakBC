namespace TigerpakBC.TigerpakBC;

using Microsoft.Integration.D365Sales;

tableextension 70122 "CRM Contact TExt" extends "CRM Contact"
{
    fields
    {
        field(70100; "tp_TP_Status"; Text[30])
        {
            ExternalName = 'tp_tp_status';
            ExternalType = 'String';
            Description = '';
            Caption = 'TP_Status';
        }
    }
}
