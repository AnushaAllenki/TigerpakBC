pageextension 70162 "Sales Return Order_Ext" extends "Sales Return Order"
{
    layout
    {

        addafter("Assigned User ID")
        {
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = All;
                Caption = 'Created By';
                ToolTip = 'Shows the user who created the record.';
            }
        }



    }
}
