namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.History;

page 70102 "TP Sales Invoiced API TS"
{
    ApplicationArea = All;
    Caption = 'TP Sales Invoiced API TS';
    PageType = Card;
    SourceTable = "Sales Invoice Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(documentNo; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(postingDate; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
                }
                field(number; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user the created that created the invoice';
                }
                field(createdBy; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user the created that created the invoice';
                }
                field("WHSE Shipment Created By"; rec."WHSE Shipment Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user that created the warehouse shipment for the invoice.';
                }
                field("ModifiedBy"; rec."Modified By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user the created that modified the record';
                }
                field(pickedBy; Rec."Picked By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user that created the pick for the invoice.';
                }
                field(packedBy; Rec."Packed By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user that created the pack for the invoice.';
                }
                field("Pick Duration in Mins"; Rec."Pick Duration in Mins")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the duration taken to pick the items for the invoice in minutes.';
                }

                field(branch; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Ordercreationtimedate"; Format(Rec."Order creation time/date", 0, '<Year4>-<Month,2>-<Day,2> <Hours24,2>.<Minutes,2>.<Seconds,2>'))
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field(NoofLines; Rec.NoofLines)
                {
                    ApplicationArea = all;
                }

            }
        }
    }

    trigger OnOpenPage()     // Current month filter applied to the API page
    var
        DateFrom: Date;
        DateTo: Date;
    begin
        DateFrom := CalcDate('<-CM>', Today);
        DateTo := CalcDate('<CM>', Today);
        Rec.SetFilter("Posting Date", '%1..%2', DateFrom, DateTo);
        if Rec.FindSet() then;
    end;

    var
        Linecount: Integer;
}
