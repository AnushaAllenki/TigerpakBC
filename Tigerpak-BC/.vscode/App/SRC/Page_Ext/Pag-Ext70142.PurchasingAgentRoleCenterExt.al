namespace ALProject.ALProject;

using Microsoft.Purchases.RoleCenters;

pageextension 70142 "PurchasingAgentRoleCenter Ext" extends "Purchasing Agent Role Center"
{
    layout
    {
        addlast(rolecenter)

        {
            part(CDCActivity; "CDC Doc. Capture Activities")
            {
                ApplicationArea = CDCBasic;
                Caption = 'Continia Document Capture Activities';
                AccessByPermission = tabledata "CDC Document Capture Cue" = I;
            }
        }
    }
}
