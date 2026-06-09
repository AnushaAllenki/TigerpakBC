namespace ALProject.ALProject;

using Microsoft.Sales.History;
using Microsoft.Sales.Document;
using Microsoft.Inventory.Item;

pageextension 70133 "Posted Sales Invoice Lines Ext" extends "Posted Sales Invoice Lines"
{

    layout
    {
        addafter(Amount)
        {
            field("TP Unit Cost_New"; Rec."TP Unit Cost_New")
            {
                ApplicationArea = All;
                Caption = 'TP Unit Cost_New';
                ToolTip = 'The TP Unit Cost_New field shows the new unit cost for the item.';
            }
        }
        addafter("Sell-to Customer Name")
        {
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = All;
                Caption = 'External Document No.';
                ToolTip = 'The External Document No. field shows the external document number associated with the posted sales invoice line.';
            }
        }
        addafter("External Document No.")
        {
            field("Item Category Group"; Rec."Item Category Group")
            {
                ApplicationArea = All;
                Caption = 'Item Category Group';
                ToolTip = 'The Item Category Group field shows the category group of the item.';
            }
            field(Blocked_Item; Rec.Blocked_Item)
            {
                ApplicationArea = All;
                Caption = 'Blocked Item';
                ToolTip = 'The Blocked Item field indicates whether the item is blocked.';
            }
            field("Salesperson Code"; Rec."Salesperson Code")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Code';
                ToolTip = 'The Salesperson Code field shows the code of the salesperson associated with the sales invoice line.';
                //TableRelation = "Sales Invoice Header"."Salesperson Code" where("No." = field("Document No."), "Salesperson Code" = field("Salesperson Code"));
            }
            field("Blocked_Days Since"; Rec."Blocked_Days Since")
            {
                ApplicationArea = All;
                Caption = 'Blocked Days Since';
                ToolTip = 'The Blocked Days Since field shows the number of days since the item was blocked.';
            }


        }
    }
    actions
    {
        addafter("Show Document")
        {
            action("Updated External Document No.")
            {
                ApplicationArea = All;
                Caption = 'Update External Document No.';
                ToolTip = 'Update External Document No.';
                Image = Action;

                trigger OnAction()
                var
                    eventSub: Codeunit "EventSubscribers1";   // #290 Posted Sales Invoice Lines - External Document No. field update from Sales Invoice Header
                begin
                    eventSub.UpdateExternalDocNo();

                end;
            }
            action("Update Item Category Group")
            {
                ApplicationArea = All;
                Caption = 'Update Item Category Group';
                ToolTip = 'Update Item Category Group';
                Image = Action;

                trigger OnAction()
                var
                    eventSub: Codeunit "EventSubscribers1";  // Item Category Group for Customer Statistics Report

                begin
                    eventSub.UpdateItemCategoryGroup();
                end;
            }
            action("Update Blocked Item")
            {
                ApplicationArea = All;
                Caption = 'Update Blocked Item';
                ToolTip = 'Update Blocked Item';
                Image = Action;

                trigger OnAction()
                var
                    eventSub: Codeunit "EventSubscribers1";  // Update Blocked Item for Customer Statistics Report

                begin
                    eventSub.UpdateItemsBlocked();
                end;
            }
            action("Update Salesperson Code")
            {
                ApplicationArea = All;
                Caption = 'Update Salesperson Code';
                ToolTip = 'Update Salesperson Code';
                Image = Action;

                trigger OnAction()
                var
                    eventSub: Codeunit "EventSubscribers1";
                begin
                    eventSub.UpdateAllSalespersonCode();
                end;
            }


        }
    }
    var
        SIH: Record "Sales Invoice Header";

    // actions
    // {
    //     addafter("Show Document")
    //     {
    //         action("Update TP Unit Cost_New")
    //         {
    //             ApplicationArea = All;
    //             Caption = 'Update "TP Unit Cost_New"';
    //             ToolTip = 'Update "TP Unit Cost_New"';
    //             Image = Action;

    //             trigger OnAction()
    //             var
    //                 EventSub: Codeunit "EventSubscribers1";
    //             begin
    //                 EventSub.UpdateAllTPUnitCostNew();
    //             end;
    //         }
    // }
}

