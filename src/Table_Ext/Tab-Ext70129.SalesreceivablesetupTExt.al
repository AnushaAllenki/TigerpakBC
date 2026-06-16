tableextension 70129 "Sales&receivable setup TExt" extends "Sales & Receivables Setup"
{
    fields
    {
        field(70100; "Master Sales Quote Nos"; Code[20])
        {
            Caption = 'Master Sales Quote Nos';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
