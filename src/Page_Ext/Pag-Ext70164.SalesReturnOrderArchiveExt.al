pageextension 70164 "Sales Return Order Archive Ext" extends "Sales Return Order Archive"
{
    layout
    {
        addafter("Assigned User ID")
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
