pageextension 70165 "Sales Order Archive Ext" extends "Sales Order Archive"
{
    layout
    {
        addafter("Salesperson Code")
        {
            field(CreatedBy; Rec.CreatedBy)
            {
                ApplicationArea = All;
                Caption = 'Created By';
                ToolTip = 'Shows the user who created the record.';
            }
        }
    }
}
