@AbapCatalog.sqlViewName: 'Z08ETICONT_CABSQ'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Cabecalho Contabil T'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view Z08ET_I_CONTCAB
  as select from bkpf
  association [1..*] to Z08ET_I_CONTITM as _Item on  $projection.CompanyCode    = _Item.CompanyCode
                                                     and $projection.FiscalYear     = _Item.FiscalYear
                                                   and $projection.DocumentNumber = _Item.DocumentNumber
{
  key bkpf.bukrs as CompanyCode,
  key bkpf.gjahr as FiscalYear,
  key bkpf.belnr as DocumentNumber,
      bkpf.bldat as DocumentDate,
      bkpf.blart as DocumentType,
      bkpf.waers as Currency,
      
    
      _Item 
}
