namespace ALProject.ALProject;

using System.Security.User;

tableextension 70109 "User Setup TExt" extends "User Setup"
{
    fields
    {
        field(70100; "Allow Unblock Customer"; Boolean)
        {
            Caption = 'Allow Unblock Customer';
            DataClassification = ToBeClassified;
            Enabled = false;
        }
    }
}
