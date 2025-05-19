@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection or consumption view for item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_uD_ITEM
  as projection on Zi_UD_ITEM
{
  key Vbeln,
  key Posnr,
      Matnr,
      @Semantics.quantity.unitOfMeasure : 'Vrkme'
      Kwmeng,
      Vrkme,
      Werks,
      @Semantics.amount.currencyCode : 'Waerk'
      Netwr,
      Waerk,
      @Semantics.quantity.unitOfMeasure : 'Gewei'
      Brgew,
      @Semantics.quantity.unitOfMeasure : 'Gewei'
      Ntgew,
      Gewei,
      Lgort,
      /* Associations */
      _Header : redirected to parent Zc_ud_salesHeader
}
