namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Receivables;

page 70103 TPcustLedgerEntriesTimestamps
{
    ApplicationArea = All;
    Caption = 'TPcustLedgerEntriesTimestamps';
    PageType = Card;
    SourceTable = "Cust. Ledger Entry";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique number of the customer ledger entry.';
                }
                field(postingDate; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
                }
                field(orderDateTimeCreated; Format(Rec."Order creation time/date", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>.<Minutes,2>.<Seconds,2>'))
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time when order was created.';
                }
                field(dateTimeSentToWMS; Format(Rec."Sent to WMS time/date", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>.<Minutes,2>.<Seconds,2>'))
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and time when order was sent to WMS';
                }
                field(documentType; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document type that the customer entry belongs to.';
                }
                field(documenNo; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry''s document number.';
                }
                field(customerNo; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the customer to whom the entry belongs.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(branch; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field(salesLCY; Rec."Sales (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total sales amount excl. VAT to the customer in LCY.';
                }
                field(yourReference; Rec."Your Reference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s reference.';
                }
                field(salesperson; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the salesperson whom the entry is linked to.';
                }
                field(dateTimeCreated; Format(Rec.SystemCreatedAt, 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>.<Minutes,2>.<Seconds,2>'))
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date time when the record was created';
                }
                field(createdBy; Rec."WT Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user the created that modified the record';
                }
                field("ModifiedBy"; Rec."WT Modified By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user the created that created the record';
                }
                field(marginAmount; Rec."WT Margin Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the invoice margin amount.';
                }
                field(crMarginAmount; Rec."Cr Margin Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the invoice margin amount.';
                }
                field("Inv Margin Amount_New"; Rec."Inv Margin Amount_New")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the invoice margin amount.';
                }
                field(pickedBy; Rec."WT Picked By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user that created the pick for the invoice.';
                }
                field(packedBy; Rec."WT Packed By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user that created the pack for the invoice.';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        DateFrom: Date;
        DateTo: Date;
    begin
        DateFrom := CalcDate('<-CM>', Today);
        DateTo := CalcDate('<CM>', Today);
        Rec.SetFilter("Posting Date", '%1..%2', DateFrom, DateTo);
        Rec.SetFilter("Document Type", '%1|%2', Rec."Document Type"::Invoice, Rec."Document Type"::"Credit Memo");
        if Rec.FindSet() then;
    end;

}



