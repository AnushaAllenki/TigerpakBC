namespace TigerpakBC.TigerpakBC;

reportextension 70103 "Delivery Docket Ext" extends "Delivery Docket"
{

    rendering
    {
        layout(XmasTrading)
        {
            Type = RDLC;
            LayoutFile = './Layouts/DeliveryDocker (2).rdl';
        }
    }
}
