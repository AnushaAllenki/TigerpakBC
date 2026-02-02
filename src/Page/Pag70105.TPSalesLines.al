namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Document;

page 70105 "TP Sales Lines"
{
    ApplicationArea = All;
    Caption = 'TP Sales Lines';
    PageType = List;
    SourceTable = "Sales Line";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the sales document to which the sales line belongs.';
                }
                // field(OrederCreationTimeDate; Rec."TP_Order Creation Date/Time")   //Commented because of empty set warning error in sales order and need to identify the issue and fix it back
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the date and time when order was created.';

                // }

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item number of the item that is being sold.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the item that is being sold.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of the item that is being sold.';
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity that is still outstanding for the sales line.';
                }
                field(Branch; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Caption = 'Branch';
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the inventory location from which the item is being shipped.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the customer to whom the item is being sold.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the customer to whom the item is being sold.';
                }
                field("Item Category Group"; Rec."Item Category Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item category group of the item being sold.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the general product posting group that is used to determine the general ledger accounts to be used for posting the sales line.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the item is shipped to the customer.';
                }


            }
        }
    }
    var
        SH: Record "Sales Header";

    trigger OnOpenPage();
    begin
        Rec.SetFilter("Document Type", '%1', Rec."Document Type"::Order);
        //AA Testing Sales line   Rec.SetFilter("Backorder Status", '%1|%2', Rec."Backorder Status"::Backorder, Rec."Backorder Status"::Partial);
        Rec.SetFilter("Outstanding Quantity", '>0');
        Rec.SetFilter("No.", '%1..%2', '10000', '99999');
        Rec.SetFilter(Reserve, '%1', Rec.Reserve::Optional);
    end;

}
