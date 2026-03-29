namespace TigerpakBC.TigerpakBC;

reportextension 70107 "Delivery Docket Ext" extends "Delivery Docket"
{

    rendering
    {
        layout("Delivery Docket")
        {
            Type = RDLC;
            LayoutFile = './Layouts/DeliveryDocket_Latest.rdl';
        }
    }
}
