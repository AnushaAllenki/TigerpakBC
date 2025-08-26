namespace ALProject.ALProject;

using System.Security.User;

pageextension 70125 "User Setup Ext" extends "User Setup"
{
    layout
    {
        addafter("Allo0w Block Credit")
        {
            field("Allow Unblock Customer"; rec."Allow Unblock Customer")
            {
                ApplicationArea = All;
                Caption = 'Allow Unblock Customer';
                ToolTip = 'Allow Unblock Customer';
                Editable = true;
                Enabled = true;
                Visible = false;





            }


        }


    }
}
