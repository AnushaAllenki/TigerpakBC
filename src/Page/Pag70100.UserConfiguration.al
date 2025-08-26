namespace ALProject.ALProject;
using System.Security.AccessControl;

page 70100 "User Configuration "
{
    ApplicationArea = All;
    Caption = 'User Configuration ';
    PageType = List;
    SourceTable = "User Configuration";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("UserID"; Rec."UserID")
                {
                    ApplicationArea = All;
                    ToolTip = 'User ID';
                    Editable = false;
                    Caption = 'User ID';
                }

                field("Allow Unblock Customers"; Rec."Allow Unblock Customers")
                {
                    ApplicationArea = All;
                    ToolTip = 'Allow Unblock Customers';
                }
            }
        }
    }


    // layout
    // {

    //     {
    //         field("UserID"; Rec."UserID")
    //         {
    //             ApplicationArea = All;
    //             ToolTip = 'User ID';
    //             Editable = false;
    //             Caption = 'User ID';



    //         }

    //         field("Allow Unblock Customers"; Rec."Allow Unblock Customers")
    //         {
    //             ApplicationArea = All;
    //             ToolTip = 'Allow Unblock Customers';


    //         }





    //     }
    // }



}
