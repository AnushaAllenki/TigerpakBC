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
