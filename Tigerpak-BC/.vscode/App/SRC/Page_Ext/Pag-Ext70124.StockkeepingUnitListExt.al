namespace ALProject.ALProject;

using Microsoft.Inventory.Location;
using Microsoft.Sales.History;
using Microsoft.Inventory.Item;

pageextension 70124 "Stockkeeping Unit List Ext" extends "Stockkeeping Unit List"
{
    layout
    {
        addafter("Unit Cost")
        {
            field("TP Unit Cost_New"; rec."TP Unit Cost_New")
            {
                ApplicationArea = All;
                Caption = 'TP Unit Cost_New';
                ToolTip = 'TP Unit Cost_New';
                Editable = false;
                Enabled = true;
                Visible = true;



            }
        }
    }
    actions
    {
        addafter("C&alculate Counting Period")
        {
            action("Update TP Unit Cost_New")
            {
                ApplicationArea = All;
                Caption = 'Update "TP Unit Cost_New"';
                ToolTip = 'Update "TP Unit Cost_New"';
                Image = Action;

                trigger OnAction()
                var
                    //location: Record location;
                    item: Record Item;
                    SKU: Record "Stockkeeping Unit";
                begin
                    if SKU.FindFirst() then
                        repeat
                            if item.get(SKU."Item No.") then begin
                                SKU."TP Unit Cost_New" := SKU."TP Unit Cost" - (SKU."TP Unit Cost") * item."Provisional Cost%" / 100;

                                SKU.Modify();
                            end;
                        until SKU.Next() = 0;


                end;

            }

        }

    }



}
