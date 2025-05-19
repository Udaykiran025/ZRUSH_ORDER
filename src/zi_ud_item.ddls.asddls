@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for item details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zi_UD_ITEM
  as select from zud_item_i
  association        to parent Zi_ud_SalesHeader as _Header    on $projection.Vbeln = _Header.Vbeln
  association [0..*] to ZWAREHOUSE_UD            as _Warehouse on $projection.Matnr = _Warehouse.Matnr
{
  key vbeln  as Vbeln,
  key posnr  as Posnr,
      matnr  as Matnr,
      @Semantics.quantity.unitOfMeasure : 'Vrkme'
      kwmeng as Kwmeng,
      vrkme  as Vrkme,
      werks  as Werks,
      @Semantics.amount.currencyCode : 'Waerk'
      netwr  as Netwr,
      waerk  as Waerk,
      @Semantics.quantity.unitOfMeasure : 'Gewei'
      brgew  as Brgew,
      @Semantics.quantity.unitOfMeasure : 'Gewei'
      ntgew  as Ntgew,
      gewei  as Gewei,
      lgort  as Lgort,
      _Header,
      _Warehouse
}
