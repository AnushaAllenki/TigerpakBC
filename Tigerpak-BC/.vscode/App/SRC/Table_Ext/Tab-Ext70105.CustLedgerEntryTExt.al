tableextension 70105 "Cust. Ledger Entry TExt" extends "Cust. Ledger Entry"
{
    fields
    {
        field(70100; "TP Cr Margin Amount"; Decimal)
        {
            Caption = 'TP Cr Margin Amount';
            FieldClass = FlowField;
            CalcFormula = max("Sales Cr.Memo Header"."Margin Amount" where("No." = field("Document No."),
                            "Posting Date" = field("Posting Date")));


        }

        field(70111; "Inv Margin Amount_New"; Decimal)
        {
            Caption = 'Inv Margin Amount_New';
            FieldClass = FlowField;
            CalcFormula = max("Sales Invoice Header"."Margin Amount_New" where("No." = field("Document No."),
                            "Posting Date" = field("Posting Date")));


        }
    }
}
