namespace ALProject.ALProject;

using Microsoft.Sales.History;

pageextension 70136 "Posted Sales Shipment Ext" extends "Posted Sales Shipment"
{

    actions
    {
        addafter("Co&mments")
        {
            action("Increase No. of Printed")
            {
                ApplicationArea = All;
                Caption = 'Increase No. of Printed';
                Image = Print;
                ToolTip = 'Increase the number of printed copies for the posted sales shipment.';

                trigger OnAction()

                var
                    eventSub: Codeunit EventSubscribers1;

                begin
                    eventSub.Updateprinted(Rec."No.");
                end;
            }


        }
    }
}
