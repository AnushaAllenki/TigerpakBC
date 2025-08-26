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
    }

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

