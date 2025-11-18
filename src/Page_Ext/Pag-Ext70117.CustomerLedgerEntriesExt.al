pageextension 70117 "Customer Ledger Entries Ext" extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Amount")
        {
            field("Cr Margin Amount"; Rec."TP Cr Margin Amount")
            {
                ApplicationArea = All;
                Caption = 'Cr Margin Amount';
                Editable = false;
                ToolTip = 'Sales Credit Memo Margin Amount';
            }
        }

        addafter("Cr Margin Amount")
        {
            field("Inv Margin Amount_New"; Rec."Inv Margin Amount_New")
            {
                ApplicationArea = All;
                Caption = 'Inv Margin Amount_New';
                Editable = false;

            }
        }


        modify("WT Margin Amount")
        {
            Caption = 'Inv Margin Amount';
            ToolTip = 'Sales Invoice Margin Amount';
            ApplicationArea = All;
            Editable = false;
        }

        addafter("Document Type")
        {
            field("WHSE Shipment Created By"; Rec."WHSE Shipment Created By")
            {
                ApplicationArea = All;
                Caption = 'WHSE Shipment Created By';
                Editable = false;
            }
        }
    }

    actions
    {
        addafter("Create Reminder")
        {
            action("Update All Margin amount")
            {
                ApplicationArea = All;
                Caption = 'Update All Margin amount';
                Image = Action;

                trigger OnAction()
                var
                    EventSub: Codeunit "EventSubscribers1";
                begin
                    EventSub.UpdateAllCLEMA();
                end;
            }
        }

        addafter("Create Reminder")
        {
            action("Update All Inv Margin amount_New")
            {
                ApplicationArea = All;
                Caption = 'Update All Inv Margin amount_New';
                Image = Action;

                trigger OnAction()
                var
                    EventSub: Codeunit "EventSubscribers1";
                begin
                    EventSub.UpdateAllCLEIMA_New();

                end;
            }


        }
    }
}