namespace ALProject.ALProject;

pageextension 70129 "Master Sales Quote Ext" extends "Master Sales Quote"
{

    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Account Instructions"; Rec."Account Instructions")
            {
                ApplicationArea = All;
                ToolTip = 'Account Instructions';
                Editable = true;
            }

        }


        addafter(Status)
        {
            field("Quote Type"; Rec."Quote Type")
            {
                ApplicationArea = All;
                Caption = 'Quote Type';
                ToolTip = 'Quote Type';
                Editable = true;
                ShowMandatory = true;
            }

            field("Quote Status"; Rec."Quote Status")
            {
                ApplicationArea = All;
                Caption = 'Quote Status';
                ToolTip = 'Quote Status';
                Editable = true;
                ShowMandatory = true;
            }

        }
    }


}
