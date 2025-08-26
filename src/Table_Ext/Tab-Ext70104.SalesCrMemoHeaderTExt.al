tableextension 70104 "Sales Cr.Memo Header TExt" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(70210; "Margin Amount"; Decimal)
        {
            Caption = 'Margin Amount';
            DataClassification = ToBeClassified;
        }
        field(70211; "Total Cost"; Decimal)
        {
            Caption = 'Total Cost';
            DataClassification = ToBeClassified;
        }

        field(70212; "Margin %"; Decimal)
        {
            Caption = 'Margin %';
            DataClassification = ToBeClassified;
        }

        field(70301; "Auto Email - Post"; Boolean)
        {
            Caption = 'Auto Email - Post';
            DataClassification = ToBeClassified;
        }

    }



    // var
    //     salesCrMemoHeader: Record "Sales Cr.Memo Header";
    //     SalescrMemoLine: Record "Sales Cr.Memo Line";
    //     salesInvoiceHeader: Record "Sales Invoice Header";
    //     TotalUnitCost : Decimal;

    // trigger Onvalidate()
    // begin
    //     repeat
    //         salesCrMemoHeader."Unit Cost" := salesCrMemoHeader."Unit Cost" + salesCrMemoLine."Unit Cost (LCY)";
    //     until SalescrMemoLine.Next() = 0;
    // end;








    // trigger OnAfterModify()

    // begin
    //     salesCrMemoHeader := Rec;
    //     salesCrMemoHeader."Margin Amount" := salesCrMemoHeader.Amount - salesCrMemoHeader."Unit Cost";
    // end;


}

