@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface cds view for warehouse'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_UD_WAREHOUSE
  as select from zud_wharehouse
{
      //      @UI.selectionField: [{ position: 10 }]
      //      @UI.lineItem: [{ position: 10 , label: 'Warehouse ID'}]
      //      @EndUserText.label: 'Warehouse'
  key lgort          as Lgort,
      //      @EndUserText.label: 'Material Number'
      //      @UI.selectionField: [{ position: 20 }]
      //      @UI.lineItem: [{ position: 20 , label: 'Material Number'}]
  key matnr          as Matnr,
      @Semantics.quantity.unitOfMeasure : 'Vrkme'
      //      @UI.lineItem: [{ position: 30 , label: 'Quantity'}]
      quantity_avail as QuantityAvail,

      vrkme          as Vrkme,
      @Semantics.quantity.unitOfMeasure : 'DistUom'
      //      @UI.lineItem: [{ position: 40 , label: 'Distance'}]
      distance_to    as DistanceTo,

      dist_uom       as DistUom
}
