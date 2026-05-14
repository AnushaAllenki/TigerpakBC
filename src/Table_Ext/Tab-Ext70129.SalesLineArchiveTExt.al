tableextension 70129 "Sales Line Archive TExt" extends "Sales Line Archive"
{
    fields
    {
        field(70101; "Order Date"; Date)     //Order Date field added to Sales Line Archive- 6619 web services - Tommy
        {
            Caption = 'Order Date';
            DataClassification = ToBeClassified;
            TableRelation = "Sales Header Archive"."Order Date" where("Document Type" = field("Document Type"),
                                                                "Version No." = field("Version No."));
            ToolTip = 'Order Date';

        }
    }
}
