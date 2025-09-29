pageextension 70103 "Sales Order Subform_Ext" extends "Sales Order Subform"
{
    layout
    {
        // addafter("Line Discount Amount")   //#246-Customer ledger Entry Field
        // {
        //     field("TP Unit Cost_New"; Rec."TP Unit Cost_New")
        //     {
        //         ApplicationArea = All;
        //         Caption = 'TP Unit Cost_New';
        //         ToolTip = 'The TP Unit Cost field shows the TP unit cost for the sales order line.';
        //     }
        //     field("TP Profit%_New"; Rec."TP Profit%_New")
        //     {
        //         ApplicationArea = All;
        //         Caption = 'TP Profit%_New';
        //         ToolTip = 'The TP Profit%_New field shows the new TP profit percentage for the sales order line.';
        //     }
        // }

        // modify("TP Profit %")
        // {
        //     Visible = false;
        //     Enabled = false;
        // }
        modify("Line Discount %")
        {
            Visible = false;
            Editable = false;
            Enabled = false;

        }
        modify("Line Discount Amount")
        {
            Visible = false;
            Editable = false;
            Enabled = false;
        }

        modify("TP Unit Cost")
        {
            Visible = true;
            Editable = true;
            Enabled = true;

            trigger OnAfterValidate()


            var
                item: Record Item;
                //location: Record "Location";
                salesline: Record "Sales Line";
            begin
                item.SetRange("No.", Rec."no.");
                salesline.SetRange("Document No.", Rec."Document No.");
                //salesline.SetRange("Location Code", location.Code);
                if salesline.FindFirst() then
                    repeat
                        salesline."TP Unit Cost" := salesline."TP Unit Cost" - item."Provisional Cost%";
                        salesline.Modify();


                    until salesline.Next() = 0;

            end;

        }
        modify("Unit Price")
        {

            trigger OnAfterValidate()
            begin
                if rec."Unit Price" < Rec."TP Unit Cost" then begin

                    Message('Attention! Unit Price is less than TP Unit Cost');


                end;
            end;
        }



    }


}
