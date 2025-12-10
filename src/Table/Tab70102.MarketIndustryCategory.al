table 70102 "Market Industry Category"
{
    Caption = 'Market Industry Category';
    DataClassification = ToBeClassified;
    LookupPageId = "Market Industry_Category";



    fields
    {
        field(70103; "Market Industry Category"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Market Industry Category';
        }
        field(70104; Description; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; "market Industry Category")
        {
            Clustered = true;
        }
    }

}
