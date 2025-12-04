namespace TigerpakBC.TigerpakBC;

using Microsoft.CRM.Contact;

tableextension 70121 "Contact TExt" extends Contact
{
    fields
    {
        field(70110; Status; Text[10])   // #286 - Inactive Contact - To prevent selection of inactive contact in Customer Card
        {
            Caption = 'Status';
            DataClassification = CustomerContent;


        }
    }

}
