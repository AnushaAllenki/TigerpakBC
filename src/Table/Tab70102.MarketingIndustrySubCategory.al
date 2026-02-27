table 70102 "Marketing Industry SubCategory"
{
    Caption = 'Marketing Industry SubCategory';
    DataClassification = ToBeClassified;
    LookupPageId = "Marketing Industry_SubCat";


    fields
    {
        field(70100; "Marketing Subcategory"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Marketing Subcategory';

        }

        field(70101; Decscription; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';

        }

        field(70102; "Marketing Industry Category"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Marketing Industry Category';

        }

    }
    keys
    {
        key(PK; "Marketing Subcategory")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Marketing Subcategory", "Marketing Industry Category")
        {
        }
    }

}
