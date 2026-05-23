@AbapCatalog.sqlViewName: 'Z08ETICONT_ITMSQ'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Itens Contabeis T'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view Z08ET_I_CONTITM
  as select from bseg
  association [1..1] to Z08ET_I_CONTCAB as _Cabecalho on  $projection.CompanyCode    = _Cabecalho.CompanyCode
                                                     and $projection.FiscalYear     = _Cabecalho.FiscalYear
                                                      and $projection.DocumentNumber = _Cabecalho.DocumentNumber
{
  key bseg.bukrs as CompanyCode,
  key bseg.gjahr as FiscalYear,
  key bseg.belnr as DocumentNumber,
  key bseg.buzei as ItemNumber,
      bseg.hkont as GLAccount,
      @Semantics.amount.currencyCode: 'Currency'
      bseg.dmbtr as Amount,
      bseg.shkzg as DebitCreditCode,
      bseg.pswsl as Currency,
      
    
      _Cabecalho
}
