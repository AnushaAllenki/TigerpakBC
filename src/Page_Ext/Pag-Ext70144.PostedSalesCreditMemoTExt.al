namespace ALProject.ALProject;

using Microsoft.Sales.History;

pageextension 70144 "Posted Sales Credit Memo TExt" extends "Posted Sales Credit Memo"
{
    layout
    {
        addafter("No. Printed")
        {
            field("Auto Email - Post"; Rec."Auto Email - Post")
            {
                ApplicationArea = All;
                Caption = 'Auto Email - Post';

            }
        }
    }
}
