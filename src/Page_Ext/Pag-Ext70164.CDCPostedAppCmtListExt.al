pageextension 70164 "CDC Posted App. Cmt. List Ext" extends "CDC Posted App. Cmt. List"
{
    layout  //Fields added to CDC Posted App. Cmt. List Ext for web services - Greg
    {
        addafter(Comment)
        {
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
                Caption = 'Created At';
                ToolTip = 'Specifies the date and time when the record was created in the system.';
            }
        }
        addafter("Date and Time")
        {
            field("Document No."; Rec."Document No.")
            {
                ApplicationArea = All;
                Caption = 'Document No.';
                ToolTip = 'Specifies the document number associated with the record.';
            }
            field("Entry No."; Rec."Entry No.")
            {
                ApplicationArea = All;
                Caption = 'Entry No.';
                ToolTip = 'Specifies the entry number associated with the record.';
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                ApplicationArea = All;
                Caption = 'Modified At';
                ToolTip = 'Specifies the date and time when the record was last modified in the system.';
            }
            field("Posted Record ID"; Rec."Posted Record ID")
            {
                ApplicationArea = All;
                Caption = 'Posted Record ID';
                ToolTip = 'Specifies the unique identifier of the posted record associated with the comment.';
            }
            field("Table ID"; Rec."Table ID")
            {
                ApplicationArea = All;
                Caption = 'Table ID';
                ToolTip = 'Specifies the unique identifier of the table associated with the comment.';
            }

        }
        modify("User ID")
        {
            Visible = true;
        }

    }


}
