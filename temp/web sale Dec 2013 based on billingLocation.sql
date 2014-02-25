drop table report_db..WebSale2013Dec
drop table report_db..WebSaleCC2013Dec
--detail transaction

select p.xactionId, p.dateCreated,  p.cost as 'cost', p.tax as 'tax', p.costUSD as 'costUSD', p.taxUSD as 'taxUSD',
       pt.purchaseTypeId, pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId,
       b.merchantId 
into report_db..WebSaleCCTran2013Dec_feb13
from Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc, BillingLocation b, CreditCardTransaction cct
where p.purchaseTypeId = pt.purchaseTypeId
and p.creditCardId *= cc.creditCardId 
and p.taxCountryId = ct.countryId
and p.taxCountryId *= jt.countryId
and p.taxJurisdictionId *= jt.jurisdictionId
and p.dateCreated >= 'Dec 1 2013' and p.dateCreated < 'Jan 1 2014'
and p.cost > 0
and ct.dateExpired is null
and jt.dateExpired is null
and p.billingLocationId = b.billingLocationId
and p.xactionId = cct.xactionId
and cct.CCTranStatusId = 4
--group by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 
--order by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 

select * from report_db..WebSaleCCTran2013Dec
--summary
select * from report_db..WebSaleCC2013Dec

select sum(p.cost) as 'cost', sum(p.tax) as 'tax', sum(p.costUSD) as 'costUSD', sum(p.taxUSD) as 'taxUSD',
       pt.purchaseTypeId, pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId,
       b.merchantId 
--into report_db..WebSaleCC2013Dec
--into report_db..WebSaleCC2013Dec_feb13
into mda_db..WebSaleCC2013Dec_feb13
from Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc, BillingLocation b, CreditCardTransaction cct
where p.purchaseTypeId = pt.purchaseTypeId
and p.creditCardId *= cc.creditCardId 
and p.taxCountryId = ct.countryId
and p.taxCountryId *= jt.countryId
and p.taxJurisdictionId *= jt.jurisdictionId
and p.dateCreated >= 'Dec 1 2013' and p.dateCreated < 'Jan 1 2014'
and p.cost > 0
and ct.dateExpired is null
and jt.dateExpired is null
and p.billingLocationId = b.billingLocationId
and p.xactionId = cct.xactionId
and cct.CCTranStatusId = 4
group by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 
order by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 

select sum(p.cost) as 'cost', sum(p.tax) as 'tax', sum(p.costUSD) as 'costUSD', sum(p.taxUSD) as 'taxUSD',
       pt.purchaseTypeId, pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId,
       b.merchantId 
into report_db..WebSale2013Dec
from Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc, BillingLocation b
where p.purchaseTypeId = pt.purchaseTypeId
and p.creditCardId *= cc.creditCardId 
and p.taxCountryId = ct.countryId
and p.taxCountryId *= jt.countryId
and p.taxJurisdictionId *= jt.jurisdictionId
and p.dateCreated >= 'Dec 1 2013' and p.dateCreated < 'Jan 1 2014'
and p.cost > 0
and ct.dateExpired is null
and jt.dateExpired is null
and p.billingLocationId = b.billingLocationId
group by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 
order by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 

select * from report_db..WebSale2013Dec

select 
    cost            ,
    tax             ,
    costUSD         ,
    taxUSD          ,
    purchaseTypeId  ,
    paymentType     ,
    taxCountry      ,
    taxJurisdiction ,
    t.cardTypeId,
    c.cardTypeCode
 from report_db..WebSale2013Dec t, Accounting..CardType c
 where t.cardTypeId *= c.cardTypeId
order by   taxCountry, taxJurisdiction, paymentType, c.cardTypeCode

--######################################
-- START HERE 
--######################################

-- Optimal 99944836 - CAD - Web
-- taxCountry = 'Canada'
-- cardTypeCode IN ('VI', 'MC')
SELECT "=================================="
SELECT "[Optimal 99944836 - CAD - Web] Dec 2013"

SELECT
    CASE 
        WHEN taxJurisdiction = 'Alberta' THEN 'Alberta (5%) - HST'
        WHEN taxJurisdiction = 'British Columbia' THEN 'British Columbia ( see comment - in red) - GST/PST'
        WHEN taxJurisdiction = 'Manitoba' THEN 'Manitoba (5%) - HST'
        WHEN taxJurisdiction = 'New Brunswick' THEN 'New Brunswick (13%) - HST'
        WHEN taxJurisdiction = 'Newfoundland' THEN 'Newfoundland (13%) - HST'
        WHEN taxJurisdiction = 'Nova Scotia' THEN 'Nova Scotia (15%) - HST'
        WHEN taxJurisdiction = 'Nunavut' THEN 'Nunavut (5%) - HST'
        WHEN taxJurisdiction = 'Ontario' THEN 'Ontario (13%) - HST'
        WHEN taxJurisdiction = 'Prince Edward Island' THEN 'Prince Edward Island (see comment in red) - HST'
        WHEN taxJurisdiction = 'Quebec' THEN 'Quebec (14.975%) - GST/QST'
        WHEN taxJurisdiction = 'Saskatchewan' THEN 'Saskatchewan (5%) - HST'
        WHEN taxJurisdiction = 'Yukon Territory' THEN 'Yukon Territory (5%) - HST'
        ELSE taxJurisdiction
    END AS taxProvince,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSaleCC2013Dec_feb13 t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'Canada'
--   AND c.cardTypeCode  IN ('VI', 'MC')    
--   AND c.cardTypeCode != 'AX'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

-- Optimal 99945299 - USD - Web
-- taxCountry = 'USA'
SELECT "=================================="
SELECT "[Optimal 99945299 - USD - Web] Dec 2013"
SELECT
    "USA" AS taxCountry  ,
    sum(costUSD) as Cost,
--    sum(taxUSD ) as Tax, 
    SUM(costUSD) as Total 
  FROM report_db..WebSaleCC2013Dec t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
--   AND taxCountry = 'USA'
   AND t.merchantId = 11
--GROUP BY taxCountry
--ORDER BY taxCountry

SELECT "=================================="
SELECT "[Optimal 99943819(99944834) - AUD - Web] Dec 2013"
SELECT
    taxCountry  ,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSaleCC2013Dec t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'Australia'
GROUP BY taxCountry
ORDER BY taxCountry

SELECT "=================================="
SELECT "[AMEX 9302369799 - CAD - Web] Dec 2013"
SELECT
    CASE 
        WHEN taxJurisdiction = 'Alberta' THEN 'Alberta (5%) - HST'
        WHEN taxJurisdiction = 'British Columbia' THEN 'British Columbia ( see comment - in red) - GST/PST'
        WHEN taxJurisdiction = 'Manitoba' THEN 'Manitoba (5%) - HST'
        WHEN taxJurisdiction = 'New Brunswick' THEN 'New Brunswick (13%) - HST'
        WHEN taxJurisdiction = 'Newfoundland' THEN 'Newfoundland (13%) - HST'
        WHEN taxJurisdiction = 'Nova Scotia' THEN 'Nova Scotia (15%) - HST'
        WHEN taxJurisdiction = 'Nunavut' THEN 'Nunavut (5%) - HST'
        WHEN taxJurisdiction = 'Ontario' THEN 'Ontario (13%) - HST'
        WHEN taxJurisdiction = 'Prince Edward Island' THEN 'Prince Edward Island (see comment in red) - HST'
        WHEN taxJurisdiction = 'Quebec' THEN 'Quebec (14.975%) - GST/QST'
        WHEN taxJurisdiction = 'Saskatchewan' THEN 'Saskatchewan (5%) - HST'
        WHEN taxJurisdiction = 'Yukon Territory' THEN 'Yukon Territory (5%) - HST'
        ELSE taxJurisdiction
    END AS taxProvince,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSaleCC2013Dec t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'Canada'
   AND c.cardTypeCode = 'AX'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

--"AMEX - USD - Web"
--"Dec 2013"
SELECT "======================================="
SELECT "[AMEX 2070219142- USD - Web] Dec 2013"
SELECT
    taxCountry,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSaleCC2013Dec t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'USA'
   AND c.cardTypeCode = 'AX'
GROUP BY taxCountry
ORDER BY taxCountry

-- taxCountry = 'Canada'
-- PayPal
SELECT "=================================="
SELECT "[PayPal - CAD - Web] Dec 2013"
SELECT
    CASE 
        WHEN taxJurisdiction = 'Alberta' THEN 'Alberta (5%) - HST'
        WHEN taxJurisdiction = 'British Columbia' THEN 'British Columbia ( see comment - in red) - GST/PST'
        WHEN taxJurisdiction = 'Manitoba' THEN 'Manitoba (5%) - HST'
        WHEN taxJurisdiction = 'New Brunswick' THEN 'New Brunswick (13%) - HST'
        WHEN taxJurisdiction = 'Newfoundland' THEN 'Newfoundland (13%) - HST'
        WHEN taxJurisdiction = 'Nova Scotia' THEN 'Nova Scotia (15%) - HST'
        WHEN taxJurisdiction = 'Nunavut' THEN 'Nunavut (5%) - HST'
        WHEN taxJurisdiction = 'Ontario' THEN 'Ontario (13%) - HST'
        WHEN taxJurisdiction = 'Prince Edward Island' THEN 'Prince Edward Island (see comment in red) - HST'
        WHEN taxJurisdiction = 'Quebec' THEN 'Quebec (14.975%) - GST/QST'
        WHEN taxJurisdiction = 'Saskatchewan' THEN 'Saskatchewan (5%) - HST'
        WHEN taxJurisdiction = 'Yukon Territory' THEN 'Yukon Territory (5%) - HST'
        ELSE taxJurisdiction
    END AS taxProvince,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSale2013Dec t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'PayPal'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

--"PayPal - USD - Web"
--"Dec 2013"
SELECT "=================================="
SELECT "[PayPal - USD - Web] Dec 2013"
SELECT
    taxCountry  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Dec t
 WHERE paymentType = 'PayPal'
   AND taxCountry = 'USA'
GROUP BY taxCountry
ORDER BY taxCountry

--"PayPal - AUD - Web"
--"Dec 2013"
SELECT "=================================="
SELECT "[PayPal - AUD - Web] Dec 2013"
SELECT
    taxCountry  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Dec t
 WHERE paymentType = 'PayPal'
   AND taxCountry = 'Australia'
GROUP BY taxCountry
ORDER BY taxCountry

-- taxCountry = 'Canada'
-- paymentType = 'INTERAC'
SELECT "=================================="
SELECT "[INTERAC 87184510014 - CAD - Web] Dec 2013"
SELECT
    CASE 
        WHEN taxJurisdiction = 'Alberta' THEN 'Alberta (5%) - HST'
        WHEN taxJurisdiction = 'British Columbia' THEN 'British Columbia ( see comment - in red) - GST/PST'
        WHEN taxJurisdiction = 'Manitoba' THEN 'Manitoba (5%) - HST'
        WHEN taxJurisdiction = 'New Brunswick' THEN 'New Brunswick (13%) - HST'
        WHEN taxJurisdiction = 'Newfoundland' THEN 'Newfoundland (13%) - HST'
        WHEN taxJurisdiction = 'Nova Scotia' THEN 'Nova Scotia (15%) - HST'
        WHEN taxJurisdiction = 'Nunavut' THEN 'Nunavut (5%) - HST'
        WHEN taxJurisdiction = 'Ontario' THEN 'Ontario (13%) - HST'
        WHEN taxJurisdiction = 'Prince Edward Island' THEN 'Prince Edward Island (see comment in red) - HST'
        WHEN taxJurisdiction = 'Quebec' THEN 'Quebec (14.975%) - GST/QST'
        WHEN taxJurisdiction = 'Saskatchewan' THEN 'Saskatchewan (5%) - HST'
        WHEN taxJurisdiction = 'Yukon Territory' THEN 'Yukon Territory (5%) - HST'
        ELSE taxJurisdiction
    END AS taxProvince,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSale2013Dec t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'INTERAC'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

-- taxCountry = 'Canada'
-- paymentType = 'Cash & Money Orders'
SELECT "==========================================="
SELECT "[Cash & Money Orders - CAD - Web] Dec 2013"
SELECT
    CASE 
        WHEN taxJurisdiction = 'Alberta' THEN 'Alberta (5%) - HST'
        WHEN taxJurisdiction = 'British Columbia' THEN 'British Columbia ( see comment - in red) - GST/PST'
        WHEN taxJurisdiction = 'Manitoba' THEN 'Manitoba (5%) - HST'
        WHEN taxJurisdiction = 'New Brunswick' THEN 'New Brunswick (13%) - HST'
        WHEN taxJurisdiction = 'Newfoundland' THEN 'Newfoundland (13%) - HST'
        WHEN taxJurisdiction = 'Nova Scotia' THEN 'Nova Scotia (15%) - HST'
        WHEN taxJurisdiction = 'Nunavut' THEN 'Nunavut (5%) - HST'
        WHEN taxJurisdiction = 'Ontario' THEN 'Ontario (13%) - HST'
        WHEN taxJurisdiction = 'Prince Edward Island' THEN 'Prince Edward Island (see comment in red) - HST'
        WHEN taxJurisdiction = 'Quebec' THEN 'Quebec (14.975%) - GST/QST'
        WHEN taxJurisdiction = 'Saskatchewan' THEN 'Saskatchewan (5%) - HST'
        WHEN taxJurisdiction = 'Yukon Territory' THEN 'Yukon Territory (5%) - HST'
        ELSE taxJurisdiction
    END AS taxProvince,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSale2013Dec t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'MONEY ORDER'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

--"Cash & Money Orders - USD - Web"
--"Dec 2013"
SELECT "=========================================="
SELECT "[Cash & Money Orders - USD - Web] Dec 2013"
SELECT
    taxCountry  ,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSale2013Dec t
 WHERE paymentType = 'MONEY ORDER'
   AND taxCountry = 'USA'
GROUP BY taxCountry
ORDER BY taxCountry

--######################################
-- STOP HERE 
--######################################

--detailed transaction

select p.xactionId, p.cost as 'cost', p.tax as 'tax', p.costUSD as 'costUSD', p.taxUSD as 'taxUSD',
       pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId, cc.partialCardNum
into report_db..WebSaleTran2013Dec
from Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc 
where p.purchaseTypeId = pt.purchaseTypeId
and p.creditCardId *= cc.creditCardId 
and p.taxCountryId = ct.countryId
and p.taxCountryId *= jt.countryId
and p.taxJurisdictionId *= jt.jurisdictionId
and p.dateCreated >= 'Dec 1 2013' and p.dateCreated < 'Jan 1 2014'
and p.cost > 0
and ct.dateExpired is null
and jt.dateExpired is null

select * from report_db..WebSaleTran2013Dec