@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for sale header details'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Zi_ud_SalesHeader
  as select from zud_salesorder_h
  composition [0..*] of Zi_UD_ITEM    as _Item
  composition [0..*] of ZI_UD_CARRIER as _Carrier

{
  key vbeln   as Vbeln,
      kunnr   as Kunnr,
      @Semantics.amount.currencyCode : 'Waerk'
      netwr   as Netwr,
      waerk   as Waerk,
      bstnk   as Bstnk,
      route   as Route,
      vdatu   as Vdatu,
      name_co as NameCo,
      street  as Street,
      state   as State,
      pin     as Pin,
      _Item,
      _Carrier // Make association public
}
