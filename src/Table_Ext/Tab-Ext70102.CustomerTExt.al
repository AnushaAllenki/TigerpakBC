tableextension 70102 Customer_TExt extends Customer
{
    fields
    {
        field(70100; "Xmas Trading Hours"; Text[50])
        {
            Caption = 'Xmas Trading Hours';
            DataClassification = ToBeClassified;
        }

        modify("Primary Contact No.")  // #286 - Inactive Contact - To prevent selection of inactive contact in Customer Card
        {
            TableRelation = Contact where("No." = field("Primary Contact No."), "Inactive" = const(false));

            trigger OnAfterValidate()
            var
                ContactRec: Record Contact;
            begin
                if ContactRec.get(Rec."Primary Contact No.") then begin
                    if ContactRec."Inactive" then
                        Error('This contact is inactive');
                end;
            end;
        }


    }




}
