@AbapCatalog.sqlViewName: 'Z08ETCCONT_CABSQ'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projecao - Cabecalho Contabil T'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@OData.publish: true 
@Metadata.allowExtensions: true
define root view Z08ET_C_CONTCAB
  as select from Z08ET_I_CONTCAB
  association [1..*] to Z08ET_C_CONTITM as _Item on  $projection.companyCode    = _Item.companyCode
                                                  and $projection.fiscalYear     = _Item.fiscalYear
                                                  and $projection.documentNumber = _Item.documentNumber
{
  key CompanyCode    as companyCode,
  key FiscalYear     as fiscalYear,
  key DocumentNumber as documentNumber,
      DocumentDate   as documentDate,
      DocumentType   as documentType,
      Currency       as currency,
      
      
      _Item
}
