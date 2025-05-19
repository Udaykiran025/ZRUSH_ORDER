@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds view for zip code'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Master_ZIP
  as select from zmaster_zip
{
  key zipcode      as Zipcode,
      country_code as CountryCode,
      place        as Place,
      latitude     as Latitude,
      longitude    as Longitude
}
