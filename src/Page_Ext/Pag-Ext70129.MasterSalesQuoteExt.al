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
    }


}
