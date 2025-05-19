@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for header detials'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity Zc_ud_salesHeader
  as projection on Zi_ud_SalesHeader
{
  key Vbeln,
      Kunnr,
      @Semantics.amount.currencyCode : 'Waerk'
      Netwr,
      Waerk,
      Bstnk,
      Route,
      Vdatu,
      NameCo,
      Street,
      State,
      Pin,
      /* Associations */
      _Item    : redirected to composition child ZC_uD_ITEM,
      _Carrier : redirected to composition child ZC_UD_CARRIER
}
