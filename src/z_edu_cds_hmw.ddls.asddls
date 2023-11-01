@AbapCatalog.sqlViewName: 'ZEDU_CDS_HMWRK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Homework 1'
define view Z_EDU_CDS_HMW as select from vbrp
inner join vbrk on vbrk.vbeln = vbrp.vbeln
inner join mara on mara.matnr = vbrp.matnr
                and mara.mandt = vbrp.mandt
left outer join vbak on vbak.vbeln = vbrp.aubel
                     and vbak.mandt = vbrp.mandt
                     and vbak.vbeln = vbrp.aubel
left outer join kna1 on kna1.kunnr = vbak.kunnr
                     and kna1.mandt = vbrp.mandt
left outer join makt on makt.spras = $session.system_language
                     and makt.mandt = vbrp.mandt
{
    key vbrp.vbeln as Fatura_No,
    key vbrp.posnr as Fatura,
    vbrp.aubel,
    vbrp.aupos,
    vbak.kunnr,
    concat_with_space(kna1.name1, kna1.name2, 1) as kunnrAd,
    currency_conversion( amount => vbrp.netwr,
                         source_currency => vbrk.waerk,
                         target_currency => cast('EUR' as abap.cuky),
                         exchange_rate_Date => vbrk.fkdat) as conversion_netwr,                       
    left(kna1.kunnr, 3) as left_kunnr,
    length(mara.matnr) as matnr_length,
    case 
    when vbrk.fkart = 'FAS' then 'Peşinat Talebi İptali'
    when vbrk.fkart = 'FAZ' then 'Peşinat Talebi' else 'Fatura' end as Faturalama_Turu,
    vbrk.fkdat as Faturalama_Yili,
    vbrk.inco2_l as Incoterm_Yeri
      
    
}
