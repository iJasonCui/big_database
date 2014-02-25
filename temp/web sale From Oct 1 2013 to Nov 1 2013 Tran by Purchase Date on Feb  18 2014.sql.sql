--drop table report_db..WebSale2013Oct
--drop table report_db..WebSaleCC2013Oct

drop table report_db..WebSaleCCTran2013Oct_feb18
drop table report_db..WebSaleTran2013Oct_feb18

--detail transaction
select p.xactionId, p.dateCreated,  cct.dateSettled, p.cost as 'cost', p.tax as 'tax', p.costUSD as 'costUSD', p.taxUSD as 'taxUSD',
       pt.purchaseTypeId, pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId,
       b.merchantId, cc.creditCardId, cc.partialCardNum, cc.encodedCardId, cc.encodedCardNum, p.userId
into report_db..WebSaleCCTran2013Oct_feb18
from Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc, BillingLocation b, CreditCardTransaction cct
where p.purchaseTypeId = pt.purchaseTypeId
and p.creditCardId *= cc.creditCardId 
and p.taxCountryId = ct.countryId
and p.taxCountryId *= jt.countryId
and p.taxJurisdictionId *= jt.jurisdictionId
and p.dateCreated >= 'Oct 1 2013' and p.dateCreated < 'Nov 1 2013'
and p.cost > 0
and ct.dateExpired is null
and jt.dateExpired is null
and p.billingLocationId = b.billingLocationId
and p.xactionId = cct.xactionId
and cct.CCTranStatusId = 4
and cct.dateSettled <= 'Dec 3 2013 11:00'

--non credit card
select p.xactionId, p.dateCreated, p.cost as 'cost', p.tax as 'tax', p.costUSD as 'costUSD', p.taxUSD as 'taxUSD',
       pt.purchaseTypeId, pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId,
       b.merchantId, p.userId  
into report_db..WebSaleTran2013Oct_feb18
from Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc, BillingLocation b
where p.purchaseTypeId = pt.purchaseTypeId
and p.creditCardId *= cc.creditCardId 
and p.taxCountryId = ct.countryId
and p.taxCountryId *= jt.countryId
and p.taxJurisdictionId *= jt.jurisdictionId
and p.dateCreated >= 'Oct 1 2013' and p.dateCreated < 'Nov 1 2013'
and p.cost > 0
and ct.dateExpired is null
and jt.dateExpired is null
and p.billingLocationId = b.billingLocationId
--group by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 
--order by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 

--end of the details
--###############################

select a.*, a.xactionId, a.cost, a.tax, a.taxJurisdiction, a.taxCountry
from report_db..WebSaleCCTran2013Oct_feb14 a, report_db..louie b
where a.xactionId = b.xactionId
order by b.id

select * from CreditCardTransaction cct where dateCreated >= "Oct 1 2013" and cct.CCTranStatusId = 4
order by cct.dateCreated

select * from report_db..WebSaleCCTran2013Oct
--summary
select * from report_db..WebSaleCC2013Oct

drop table report_db..WebSaleCC2013Oct_feb13
select sum(p.cost) as 'cost', sum(p.tax) as 'tax', sum(p.costUSD) as 'costUSD', sum(p.taxUSD) as 'taxUSD',
       pt.purchaseTypeId, pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId,
       b.merchantId 
into report_db..WebSaleCC2013Oct_feb13
from Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc, BillingLocation b, CreditCardTransaction cct
where p.purchaseTypeId = pt.purchaseTypeId
and p.creditCardId *= cc.creditCardId 
and p.taxCountryId = ct.countryId
and p.taxCountryId *= jt.countryId
and p.taxJurisdictionId *= jt.jurisdictionId
and p.dateCreated >= 'Oct 1 2013' and p.dateCreated < 'Nov 1 2013'
and p.cost > 0
and ct.dateExpired is null
and jt.dateExpired is null
and p.billingLocationId = b.billingLocationId
and p.xactionId = cct.xactionId
and cct.CCTranStatusId = 4
and cct.dateSettled <= 'jan 2 2014 11:00'
group by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 
order by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 

select sum(p.cost) as 'cost', sum(p.tax) as 'tax', sum(p.costUSD) as 'costUSD', sum(p.taxUSD) as 'taxUSD',
       pt.purchaseTypeId, pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId,
       b.merchantId 
into report_db..WebSale2013Oct_feb13
from Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc, BillingLocation b
where p.purchaseTypeId = pt.purchaseTypeId
and p.creditCardId *= cc.creditCardId 
and p.taxCountryId = ct.countryId
and p.taxCountryId *= jt.countryId
and p.taxJurisdictionId *= jt.jurisdictionId
and p.dateCreated >= 'Oct 1 2013' and p.dateCreated < 'Nov 1 2013'
and p.cost > 0
and ct.dateExpired is null
and jt.dateExpired is null
and p.billingLocationId = b.billingLocationId
group by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 
order by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId, b.merchantId 

select * from report_db..WebSale2013Oct
select * from report_db..WebSale2013Oct_feb13

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
 from report_db..WebSale2013Oct t, Accounting..CardType c
 where t.cardTypeId *= c.cardTypeId
order by   taxCountry, taxJurisdiction, paymentType, c.cardTypeCode

--######################################
-- START HERE 
--######################################

-- Optimal 99944836 - CAD - Web
-- taxCountry = 'Canada'
-- cardTypeCode IN ('VI', 'MC')
SELECT "=================================="
SELECT "[Optimal 99944836 - CAD - Web] Nov 2013"

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
    cost,
    tax,
    cost + tax as Total,
    t.xactionId,
    t.dateCreated as datePurchsed,
    t.userId,
    t.dateSettled, 
    cnt.contentDesc,
    t.partialCardNum
  FROM report_db..WebSaleCCTran2013Oct_feb18 t, Accounting..CardType c, Accounting..Content cnt
 WHERE t.cardTypeId = c.cardTypeId
   AND c.contentId = cnt.contentId
   AND taxCountry = 'Canada'
ORDER BY taxJurisdiction

-- Optimal 99945299 - USD - Web
-- taxCountry = 'USA'
SELECT "=================================="
SELECT "[Optimal 99945299 - USD - Web] Nov 2013"
SELECT
    "USA" AS taxCountry  ,
    costUSD as Cost,
    taxUSD  as Tax, 
    costUSD + taxUSD as Total,
    t.xactionId,
    t.dateCreated as datePurchsed,
    t.userId,
    t.dateSettled, 
    cnt.contentDesc,
    t.partialCardNum
  FROM report_db..WebSaleCCTran2013Oct_feb18 t, Accounting..CardType c, Accounting..Content cnt
 WHERE t.cardTypeId = c.cardTypeId
   AND c.contentId = cnt.contentId
    AND t.merchantId = 11

SELECT "=================================="
SELECT "[Optimal 99943819(99944834) - AUD - Web] Nov 2013"
SELECT
    taxCountry  ,
    cost as Cost,
    tax as Tax, 
    cost + tax as Total,
    t.xactionId,
    t.dateCreated as datePurchsed,
    t.userId,
    t.dateSettled, 
    cnt.contentDesc,
    t.partialCardNum
  FROM report_db..WebSaleCCTran2013Oct_feb18 t, Accounting..CardType c, Accounting..Content cnt
 WHERE t.cardTypeId = c.cardTypeId
   AND c.contentId = cnt.contentId
   AND taxCountry = 'Australia'

SELECT "=================================="
SELECT "[AMEX 9302369799 - CAD - Web] Nov 2013"
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
    cost as Cost,
    tax  as Tax, 
    cost + tax as  Total ,
    t.xactionId,
    t.dateCreated as datePurchsed,
    t.userId,
    t.dateSettled, 
    cnt.contentDesc,
    t.partialCardNum
  FROM report_db..WebSaleCCTran2013Oct_feb18 t, Accounting..CardType c, Accounting..Content cnt
 WHERE t.cardTypeId = c.cardTypeId
   AND c.contentId = cnt.contentId    
   AND taxCountry = 'Canada'
   AND c.cardTypeCode = 'AX'
--GROUP BY taxJurisdiction
--ORDER BY taxJurisdiction

--"AMEX - USD - Web"
--"Nov 2013"
SELECT "======================================="
SELECT "[AMEX 2070219142- USD - Web] Nov 2013"
SELECT
    taxCountry,
    cost as Cost,
    tax  as Tax, 
    cost + tax as Total,
    t.xactionId,
    t.dateCreated as datePurchsed,
    t.userId,
    t.dateSettled, 
    cnt.contentDesc,
    t.partialCardNum
  FROM report_db..WebSaleCCTran2013Oct_feb18 t, Accounting..CardType c, Accounting..Content cnt
 WHERE t.cardTypeId = c.cardTypeId
   AND c.contentId = cnt.contentId    
   AND taxCountry = 'USA'
   AND c.cardTypeCode = 'AX'

-- taxCountry = 'Canada'
-- PayPal
SELECT "=================================="
SELECT "[PayPal - CAD - Web] Nov 2013"
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
    cost as Cost,
    tax  as Tax, 
    cost + tax as Total,
    xactionId,
    dateCreated,
    t.userId 
  FROM report_db..WebSaleTran2013Oct_feb18 t
--  FROM report_db..WebSale2013Oct t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'PayPal'
--GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

--"PayPal - USD - Web"
--"Nov 2013"
SELECT "=================================="
SELECT "[PayPal - USD - Web] Nov 2013"
SELECT
    taxCountry ,
    cost as cost,
    tax  as tax, 
    cost + tax as Total,
    xactionId,
    dateCreated,
    t.userId 
  FROM report_db..WebSaleTran2013Oct_feb18 t
--  FROM report_db..WebSale2013Oct t
 WHERE paymentType = 'PayPal'
   AND taxCountry = 'USA'
--GROUP BY taxCountry
ORDER BY taxCountry

--"PayPal - AUD - Web"
--"Nov 2013"
SELECT "=================================="
SELECT "[PayPal - AUD - Web] Nov 2013"
SELECT
    taxCountry  ,
    cost as cost,
    tax  as tax , 
    cost + tax as Total,
    xactionId,
    dateCreated,
    t.userId 
  FROM report_db..WebSaleTran2013Oct_feb18 t
 WHERE paymentType = 'PayPal'
   AND taxCountry = 'Australia'
--GROUP BY taxCountry
ORDER BY taxCountry

-- taxCountry = 'Canada'
-- paymentType = 'INTERAC'
SELECT "=================================="
SELECT "[INTERAC 87184510014 - CAD - Web] Nov 2013"
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
    cost as cost,
    tax  as tax , 
    cost + tax as Total,
    xactionId,
    dateCreated,
    t.userId 
  FROM report_db..WebSaleTran2013Oct_feb18 t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'INTERAC'
ORDER BY taxJurisdiction

-- taxCountry = 'Canada'
-- paymentType = 'Cash & Money Orders'
SELECT "==========================================="
SELECT "[Cash & Money Orders - CAD - Web] Nov 2013"
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
    cost as cost,
    tax  as tax , 
    cost + tax as Total,
    xactionId,
    dateCreated,
    t.userId 
  FROM report_db..WebSaleTran2013Oct_feb18 t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'MONEY ORDER'
ORDER BY taxJurisdiction

--"Cash & Money Orders - USD - Web"
--"Nov 2013"
SELECT "=========================================="
SELECT "[Cash & Money Orders - USD - Web] Nov 2013"
SELECT
    taxCountry  ,
    cost as cost,
    tax  as tax , 
    cost + tax as Total,
    xactionId,
    dateCreated,
    t.userId 
  FROM report_db..WebSaleTran2013Oct_feb18 t
 WHERE paymentType = 'MONEY ORDER'
   AND taxCountry = 'USA'
ORDER BY taxCountry

--######################################
-- STOP HERE 
--######################################

--detailed transaction

select p.xactionId, p.cost as 'cost', p.tax as 'tax', p.costUSD as 'costUSD', p.taxUSD as 'taxUSD',
       pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId, cc.partialCardNum
into report_db..WebSaleTran2013Oct
from Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc 
where p.purchaseTypeId = pt.purchaseTypeId
and p.creditCardId *= cc.creditCardId 
and p.taxCountryId = ct.countryId
and p.taxCountryId *= jt.countryId
and p.taxJurisdictionId *= jt.jurisdictionId
and p.dateCreated >= 'Oct 1 2013' and p.dateCreated < 'Nov 1 2013'
and p.cost > 0
and ct.dateExpired is null
and jt.dateExpired is null

select * from report_db..WebSaleTran2013Oct