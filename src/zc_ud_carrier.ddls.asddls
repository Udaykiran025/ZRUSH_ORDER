@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for carrier'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_UD_CARRIER
  as projection on ZI_UD_CARRIER
{


      @UI.lineItem: [{ position: 10 , label: 'Delivery ID'},
      { position: 20,  type: #FOR_ACTION, dataAction: 'getCarrier', label: 'Get Carrier' }]
  key DeliveryId,
      Vbeln,
      Posnr,
      @UI.lineItem: [{ position: 10 , label: 'Carrier'}]
      Carrier,
      /* Associations */
      _Header : redirected to parent Zc_ud_salesHeader

}
