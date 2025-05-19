@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS for material'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCD_MATERIALS
  as select from zmaterial_stock
  association to parent ZCD_WAREHOUSE as _warehouse on $projection.WarehouseId = _warehouse.WarehouseId
{
  key warehouse_id  as WarehouseId,
  key material_id   as MaterialId,
      material_name as MaterialName,
      quantity      as Quantity,
      _warehouse
}
