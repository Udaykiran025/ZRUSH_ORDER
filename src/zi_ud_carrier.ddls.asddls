@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for carrier detaials'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_UD_CARRIER
  as select from zud_carrier_s
  association        to parent Zi_ud_SalesHeader as _Header on $projection.Vbeln = _Header.Vbeln
  association [0..*] to ZI_UD_CARRIER            as _Item   on $projection.Posnr = _Item.Posnr
{
  key delivery_id as DeliveryId,
      vbeln       as Vbeln,
      posnr       as Posnr,
      carrier     as Carrier,
      _Header,
      _Item
}
