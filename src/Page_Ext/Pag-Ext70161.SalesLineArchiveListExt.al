pageextension 70161 "Sales Line Archive List Ext" extends "Sales Line Archive List"
{
    layout
    {
        addafter("Location Code")
        {
            field("Order Date"; Rec."Order Date")    //Order Date field added to Sales Line Archive- 6619 web services - Tommy
            {
                ApplicationArea = All;
                Caption = 'Order Date';
                ToolTip = 'Order Date';
            }

        }
    }
    actions
    {
        addafter(ShowDocument)
        {
            action("Update Order Date")
            {
                ApplicationArea = All;
                Caption = 'Update Order Date';
                ToolTip = 'Update Order Date';
                Image = Edit;

                trigger OnAction()
                var
                    salesHeaderArchive: Record "Sales Header Archive";
                begin
                    repeat
                        salesHeaderArchive.SetRange("No.", Rec."Document No.");
                        if salesHeaderArchive.FindFirst() then begin
                            Rec."Order Date" := salesHeaderArchive."Order Date";
                            Rec.Modify();
                        end;
                    until Rec.Next() = 0;
                end;



            }
        }
    }
}
