namespace ALProject.ALProject;

using System.Security.User;

pageextension 70127 "User Card Ext" extends "User Card"
{
    actions
    {
        addafter("Effective Permissions")
        {
            action("Unblock Customers")
            {
                ApplicationArea = All;
                Caption = 'Unblock Customers';
                ToolTip = 'Unblock Customers';
                Image = Action;


                trigger OnAction()
                var
                    userConfig: Record "User Configuration";
                begin
                    userConfig.SetRange("UserID", Rec."User name");
                    page.Run(70100, userConfig);
                end;
            }
        }
    }
}
