tableextension 70132 "CRM Invoice TExt" extends "CRM Invoice"
{
    fields
    {
        field(70100; "Package Tracking No."; Text[50])
        {
            ExternalName = 'tp_packagetrackingno';
            ExternalType = 'String';
            Description = '';
            Caption = 'Package Tracking No.';
        }
    }
}
