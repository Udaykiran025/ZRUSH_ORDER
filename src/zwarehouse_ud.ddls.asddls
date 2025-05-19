@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view for warehouse'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZWAREHOUSE_UD
  as select from zud_wharehouse

{
      @UI.lineItem: [{ position: 10 , label: 'Warehouse ID'}]
  key lgort          as Lgort,
      @UI.lineItem: [{ position: 20 , label: 'Material Number'}]
  key matnr          as Matnr,
      @Semantics.quantity.unitOfMeasure: 'Vrkme'
      @UI.lineItem: [{ position: 30 , label: 'Quantity'}]
      quantity_avail as QuantityAvail,
      vrkme          as Vrkme,
      @Semantics.quantity.unitOfMeasure : 'DistUom'
      @UI.lineItem: [{ position: 40 , label: 'Distance'}]
      distance_to    as DistanceTo,

      dist_uom       as DistUom
}
