@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view for warehouse'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCD_WAREHOUSE
  as select from zwarehouse
  composition [0..*] of ZCD_MATERIALS as _Material
  association [0..1] to ZI_Master_ZIP as _Zip on $projection.ZipCode = _Zip.Zipcode
{
  key warehouse_id   as WarehouseId,
      warehouse_name as WarehouseName,
      zipcode        as ZipCode,
      //      longitude      as Longitude,
      _Zip.Latitude  as Latitude,
      _Zip.Longitude as Longitude,
      _Material,
      _Zip
}
