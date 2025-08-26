table 70100 "User Configuration"
{
    Caption = 'User Configuration';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "UserID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
            TableRelation = User."User name" where("User name" = field("UserID"));
            Editable = True;
        }

        field(2; "Allow Unblock Customers"; Boolean)
        {
            Caption = 'Allow Unblock Customers';
            DataClassification = ToBeClassified;
            Editable = True;

        }
    }
    keys
    {
        key(PK; "UserID")
        {
            Clustered = true;
        }

    }
}

