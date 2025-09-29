namespace ALProject.ALProject;

using Microsoft.Sales.History;
using Microsoft.Sales.Document;

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

