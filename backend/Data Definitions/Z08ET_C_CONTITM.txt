@AbapCatalog.sqlViewName: 'Z08ETCCONT_ITMSQ'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projecao - Itens Contabeis T'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view Z08ET_C_CONTITM
  as select from Z08ET_I_CONTITM
  association [1..1] to Z08ET_C_CONTCAB as _Cabecalho on  $projection.companyCode    = _Cabecalho.companyCode
                                                      and $projection.fiscalYear     = _Cabecalho.fiscalYear
                                                     and $projection.documentNumber = _Cabecalho.documentNumber
{
  key CompanyCode     as companyCode,
  key FiscalYear      as fiscalYear,
  key DocumentNumber  as documentNumber,
  key ItemNumber      as itemNumber,
      GLAccount       as glAccount,
      Amount          as amount,
      DebitCreditCode as debitCreditCode,
      Currency        as currency,
      
      _Cabecalho
}
