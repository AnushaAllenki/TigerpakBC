namespace TigerpakBC.TigerpakBC;

using Microsoft.Purchases.Vendor;

tableextension 70124 "Vendor TExt" extends Vendor
{
    fields
    {

        field(70100; "In TigerSource"; Boolean)
        {
            Caption = 'In TigerSource';
            DataClassification = ToBeClassified;
        }

        field(70101; "Item Category Group"; Option)
        {
            Caption = 'Item Category Group';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Adhesive & Wrapping Solutions","Primary Packaging Materials","Shipping & Protective Solutions","Industrial & Workplace Essentials";
        }
    }
}
