namespace TigerpakBC.TigerpakBC;

using Microsoft.Sales.Document;

page 70108 "Master Sales Quote Lines_API"
{
    ApplicationArea = All;
    Caption = 'Master Sales Quote Lines_API';
    PageType = List;
    SourceTable = "Sales Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the sales document to which the sales line belongs.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of the sales line, which can be either Item or Comment.';
                }


                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item number of the item that is being sold.';
                }
                field("Item reference"; Rec."Item Reference No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item reference for the sales line.';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the item that is being sold.';
                }

                field("Include in Make Quote"; Rec."Include in Make Quote")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the sales line should be included in the make quote.';
                }

                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the inventory location from which the item is being shipped.';
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of the item that is being sold.';
                }
                field("Qty. to Asm. to Order (Base)"; Rec."Qty. to Asm. to Order (Base)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity to be assembled to order in the base unit of measure.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the unit of measure for the quantity of the item that is being sold.';
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
                // field("Item Category Group"; Rec.item)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the item category group of the item being sold.';
                // }
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
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unit price for the item that is being sold.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total amount for the sales line, which is calculated as Quantity multiplied by Unit Price.';


                }
                field("TP Unit Cost_New"; Rec."TP Unit Cost_New")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Tigerpak unit cost for the item that is being sold.';
                }
                field("TP Profit %_New"; Rec."TP Profit%_New")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Tigerpak profit percentage for the item that is being sold.';
                }
                field("Qty. to Assign"; Rec."Qty. to Assign")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity that is to be assigned for the sales line.';
                }
                field("Qty. Assigned"; Rec."Qty. Assigned")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity that has been assigned for the sales line.';
                }
                field(Branch_TP; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Caption = 'Branch';
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }


            }
        }
    }
    var
        SH: Record "Sales Header";

    trigger OnOpenPage();
    begin
        Rec.SetFilter("Document Type", '%1', Rec."Document Type"::Quote);
        Rec.SetFilter("Document No.", 'MSQ*');
        //AA Testing Sales line   Rec.SetFilter("Backorder Status", '%1|%2', Rec."Backorder Status"::Backorder, Rec."Backorder Status"::Partial);
        // Rec.SetFilter("Outstanding Quantity", '>0');
        //Rec.SetFilter("No.", '%1..%2', '10000', '99999');
        // Rec.SetFilter(Reserve, '%1', Rec.Reserve::Optional);
    end;
}
