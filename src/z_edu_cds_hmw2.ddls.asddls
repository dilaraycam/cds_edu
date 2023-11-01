@AbapCatalog.sqlViewName: 'ZEDU_CDS_HMW2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Homework 2'
define view Z_EDU_CDS_HMW2 as select from Z_EDU_CDS_HMW
{
    key Fatura_No,
    key Fatura,
    sum(conversion_netwr) as ToplamNetDeger,
    kunnrAd,
    left( Faturalama_Yili, 4) as Faturalama_Yili2,
    substring( Faturalama_Yili, 5, 2) as Faturalama_Ayi,
    substring( Faturalama_Yili, 7, 2) as Faturalama_Gunu,
    substring( Incoterm_Yeri, 1, 3 ) as Incoterm_Yeri2
     
}

group by Fatura_No, Fatura, kunnrAd, Faturalama_Yili, Incoterm_Yeri
