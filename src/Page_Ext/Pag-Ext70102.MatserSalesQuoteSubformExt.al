pageextension 70102 "Matser Sales Quote Subform_Ext" extends "Matser Sales Quote Subform"
{
    layout
    {
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
        addafter("Line Discount Amount")
        {
            field("TP Unit Cost_New"; Rec."TP Unit Cost_New")
            {
                ApplicationArea = All;
                Caption = 'TP Unit Cost_New';
                ToolTip = 'The TP Unit Cost_New field shows the new TP unit cost for the sales quote line.';
            }

            field("TP Profit%_New"; Rec."TP Profit%_New")
            {
                ApplicationArea = All;
                Caption = 'TP Profit%_New';
                ToolTip = 'The TP Profit%_New field shows the new TP profit percentage for the sales quote line.';
            }
        }
        modify("TP Unit Cost")
        {
            Visible = false;
            Enabled = false;
        }
        modify("TP Profit %")
        {
            Visible = false;
            Enabled = false;
        }

    }
    actions
    {
        addafter("Update Sales Price")
        {
            action("Delete Line & Price Line")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Delete Line & Price Line';
                Ellipsis = true;
                Image = Action;
                trigger OnAction()
                var
                    Pricelistline: Record "Price List Line";
                    SRsetup: Record "Sales & Receivables Setup";
                begin
                    SRsetup.get;
                    Pricelistline.SetRange("Price List Code", SRsetup."Default Price List Code");
                    Pricelistline.SetRange("Source Type", Pricelistline."Source Type"::Customer);
                    Pricelistline.SetRange("Assign-to No.", rec."Sell-to Customer No.");
                    Pricelistline.SetRange("Product No.", rec."No.");
                    Pricelistline.SetRange("Minimum Quantity", Rec."Quantity");
                    Pricelistline.SetRange("Unit of Measure Code", Rec."Unit of Measure Code");
                    if Pricelistline.FindFirst() then begin
                        Pricelistline.Delete();
                    end;
                    rec.Delete();


                end;
            }






        }

    }
}

