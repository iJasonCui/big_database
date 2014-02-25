drop table report_db..WebSaleTran2014Jan
drop table report_db..WebSaleCCTran2014Jan

--############################
--THE DETAILED TRANSACTION
--detail transaction

declare @startDate datetime
declare @endDate   datetime
declare @startDateLL datetime
declare @endDateLL   datetime

SELECT @startDate = 'Jan 1 2014'
SELECT @endDate = DATEADD(month, 1 , @startDate)
SELECT @startDateLL = DATEADD(day, -10 , @startDate)
SELECT @endDateLL = DATEADD(day, +10 , @endDate)

SELECT p.xactionId, p.dateCreated,  cct.dateSettled, p.cost as 'cost', p.tax as 'tax', p.costUSD as 'costUSD', p.taxUSD as 'taxUSD',
       pt.purchaseTypeId, pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId,
       b.merchantId, cc.creditCardId, cc.partialCardNum, cc.encodedCardId, cc.encodedCardNum, p.userId
INTO report_db..WebSaleCCTran2014Jan
FROM Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc, BillingLocation b, CreditCardTransaction cct
WHERE p.purchaseTypeId = pt.purchaseTypeId
  and p.creditCardId *= cc.creditCardId 
  and p.taxCountryId = ct.countryId
  and p.taxCountryId *= jt.countryId
  and p.taxJurisdictionId *= jt.jurisdictionId
  and p.dateCreated >= @startDateLL and p.dateCreated < @endDateLL
  and p.cost > 0
  and ct.dateExpired is null
  and jt.dateExpired is null
  and p.billingLocationId = b.billingLocationId
  and p.xactionId = cct.xactionId
  and cct.CCTranStatusId = 4
  and cct.dateSettled >= @startDate and cct.dateSettled < @endDate


--non credit card
select p.xactionId, p.dateCreated, p.cost as 'cost', p.tax as 'tax', p.costUSD as 'costUSD', p.taxUSD as 'taxUSD',
       pt.purchaseTypeId, pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId,
       b.merchantId, p.userId  
into report_db..WebSaleTran2014Jan
from Purchase p, PurchaseType pt, CountryTaxRate ct, JurisdictionTaxRate jt, CreditCard cc, BillingLocation b
where p.purchaseTypeId = pt.purchaseTypeId
and p.creditCardId *= cc.creditCardId 
and p.taxCountryId = ct.countryId
and p.taxCountryId *= jt.countryId
and p.taxJurisdictionId *= jt.jurisdictionId
and p.dateCreated >= @startDate and p.dateCreated < @endDate
and p.cost > 0
and ct.dateExpired is null
and jt.dateExpired is null
and p.billingLocationId = b.billingLocationId
       
--end of the details
--END OF THE DETAILED TRANSACTION

--###############################
--summary
--drop table report_db..WebSaleCC2014JanNew
--drop table report_db..WebSale2014JanNew
 
select sum(cost) as 'cost', sum(tax) as 'tax', sum(costUSD) as 'costUSD', sum(taxUSD) as 'taxUSD',
       purchaseTypeId, paymentType, taxCountry, taxJurisdiction, cardTypeId, merchantId 
into report_db..WebSaleCC2014JanNew
from report_db..WebSaleCCTran2014Jan 
group by  taxCountry, taxJurisdiction, purchaseTypeId, paymentType, cardTypeId, merchantId 
order by  taxCountry, taxJurisdiction, purchaseTypeId, paymentType, cardTypeId, merchantId 

select sum(cost) as 'cost', sum(tax) as 'tax', sum(costUSD) as 'costUSD', sum(taxUSD) as 'taxUSD',
       purchaseTypeId, paymentType, taxCountry, taxJurisdiction, cardTypeId, merchantId 
into report_db..WebSale2014JanNew
from report_db..WebSaleTran2014Jan 
group by  taxCountry, taxJurisdiction, purchaseTypeId, paymentType, cardTypeId, merchantId 
order by  taxCountry, taxJurisdiction, purchaseTypeId, paymentType, cardTypeId, merchantId 

--######################################
-- START HERE 
--
-- DETAILED REPORT
--######################################

-- Optimal 99944836 - CAD - Web
-- taxCountry = 'Canada'
-- cardTypeCode IN ('VI', 'MC')
SELECT "=================================="
SELECT "[Optimal 99944836 - CAD - Web] Jan 2014"

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
  FROM report_db..WebSaleCCTran2014Jan t, Accounting..CardType c, Accounting..Content cnt
 WHERE t.cardTypeId = c.cardTypeId
   AND c.contentId = cnt.contentId
   AND taxCountry = 'Canada'
ORDER BY taxJurisdiction, t.dateSettled

-- Optimal 99945299 - USD - Web
-- taxCountry = 'USA'
SELECT "=================================="
SELECT "[Optimal 99945299 - USD - Web] Jan 2014"
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
  FROM report_db..WebSaleCCTran2014Jan t, Accounting..CardType c, Accounting..Content cnt
 WHERE t.cardTypeId = c.cardTypeId
   AND c.contentId = cnt.contentId
    AND t.merchantId = 11
ORDER BY t.dateSettled    

SELECT "=================================="
SELECT "[Optimal 99943819(99944834) - AUD - Web] Jan 2014"
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
  FROM report_db..WebSaleCCTran2014Jan t, Accounting..CardType c, Accounting..Content cnt
 WHERE t.cardTypeId = c.cardTypeId
   AND c.contentId = cnt.contentId
   AND taxCountry = 'Australia'
ORDER BY t.dateSettled    

SELECT "=================================="
SELECT "[AMEX 9302369799 - CAD - Web] Jan 2014"
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
  FROM report_db..WebSaleCCTran2014Jan t, Accounting..CardType c, Accounting..Content cnt
 WHERE t.cardTypeId = c.cardTypeId
   AND c.contentId = cnt.contentId    
   AND taxCountry = 'Canada'
   AND c.cardTypeCode = 'AX'
ORDER BY taxJurisdiction, t.dateSettled    

--"AMEX - USD - Web"
--"Jan 2014"
SELECT "======================================="
SELECT "[AMEX 2070219142- USD - Web] Jan 2014"
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
  FROM report_db..WebSaleCCTran2014Jan t, Accounting..CardType c, Accounting..Content cnt
 WHERE t.cardTypeId = c.cardTypeId
   AND c.contentId = cnt.contentId    
   AND taxCountry = 'USA'
   AND c.cardTypeCode = 'AX'
ORDER BY t.dateSettled       

-- taxCountry = 'Canada'
-- PayPal
SELECT "=================================="
SELECT "[PayPal - CAD - Web] Jan 2014"
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
  FROM report_db..WebSaleTran2014Jan t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'PayPal'
--GROUP BY taxJurisdiction
ORDER BY taxJurisdiction, t.dateCreated

--"PayPal - USD - Web"
--"Jan 2014"
SELECT "=================================="
SELECT "[PayPal - USD - Web] Jan 2014"
SELECT
    taxCountry ,
    cost as cost,
    tax  as tax, 
    cost + tax as Total,
    xactionId,
    dateCreated,
    t.userId 
  FROM report_db..WebSaleTran2014Jan t
--  FROM report_db..WebSale2013Dec t
 WHERE paymentType = 'PayPal'
   AND taxCountry = 'USA'
--GROUP BY taxCountry
ORDER BY taxCountry

--"PayPal - AUD - Web"
--"Jan 2014"
SELECT "=================================="
SELECT "[PayPal - AUD - Web] Jan 2014"
SELECT
    taxCountry  ,
    cost as cost,
    tax  as tax , 
    cost + tax as Total,
    xactionId,
    dateCreated,
    t.userId 
  FROM report_db..WebSaleTran2014Jan t
 WHERE paymentType = 'PayPal'
   AND taxCountry = 'Australia'
--GROUP BY taxCountry
ORDER BY taxCountry

-- taxCountry = 'Canada'
-- paymentType = 'INTERAC'
SELECT "=================================="
SELECT "[INTERAC 87184510014 - CAD - Web] Jan 2014"
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
  FROM report_db..WebSaleTran2014Jan t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'INTERAC'
ORDER BY taxJurisdiction

-- taxCountry = 'Canada'
-- paymentType = 'Cash & Money Orders'
SELECT "==========================================="
SELECT "[Cash & Money Orders - CAD - Web] Jan 2014"
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
  FROM report_db..WebSaleTran2014Jan t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'MONEY ORDER'
ORDER BY taxJurisdiction

--"Cash & Money Orders - USD - Web"
--"Jan 2014"
SELECT "=========================================="
SELECT "[Cash & Money Orders - USD - Web] Jan 2014"
SELECT
    taxCountry  ,
    cost as cost,
    tax  as tax , 
    cost + tax as Total,
    xactionId,
    dateCreated,
    t.userId 
  FROM report_db..WebSaleTran2014Jan t
 WHERE paymentType = 'MONEY ORDER'
   AND taxCountry = 'USA'
ORDER BY taxCountry

--######################################
-- STOP HERE 
-- 
-- DETAILED REPORT
--######################################


--######################################
-- START HERE 
--######################################

-- Optimal 99944836 - CAD - Web
-- taxCountry = 'Canada'
-- cardTypeCode IN ('VI', 'MC')
SELECT "=================================="
SELECT "[Optimal 99944836 - CAD - Web] Jan 2014"

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
  FROM report_db..WebSaleCC2014JanNew t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'Canada'
--   AND c.cardTypeCode  IN ('VI', 'MC')    
--   AND c.cardTypeCode != 'AX'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

-- Optimal 99945299 - USD - Web
-- taxCountry = 'USA'
SELECT "=================================="
SELECT "[Optimal 99945299 - USD - Web] Jan 2014"
SELECT
    "USA" AS taxCountry  ,
    sum(costUSD) as Cost,
--    sum(taxUSD ) as Tax, 
    SUM(costUSD) as Total 
  FROM report_db..WebSaleCC2014JanNew t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
--   AND taxCountry = 'USA'
   AND t.merchantId = 11
--GROUP BY taxCountry
--ORDER BY taxCountry

SELECT "=================================="
SELECT "[Optimal 99943819(99944834) - AUD - Web] Jan 2014"
SELECT
    taxCountry  ,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSaleCC2014JanNew t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'Australia'
GROUP BY taxCountry
ORDER BY taxCountry

SELECT "=================================="
SELECT "[AMEX 9302369799 - CAD - Web] Jan 2014"
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
  FROM report_db..WebSaleCC2014JanNew t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'Canada'
   AND c.cardTypeCode = 'AX'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

--"AMEX - USD - Web"
--"Jan 2014"
SELECT "======================================="
SELECT "[AMEX 2070219142- USD - Web] Jan 2014"
SELECT
    taxCountry,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSaleCC2014JanNew t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'USA'
   AND c.cardTypeCode = 'AX'
GROUP BY taxCountry
ORDER BY taxCountry

-- taxCountry = 'Canada'
-- PayPal
SELECT "=================================="
SELECT "[PayPal - CAD - Web] Jan 2014"
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
  FROM report_db..WebSale2014Jan t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'PayPal'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

--"PayPal - USD - Web"
--"Jan 2014"
SELECT "=================================="
SELECT "[PayPal - USD - Web] Jan 2014"
SELECT
    taxCountry  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2014Jan t
 WHERE paymentType = 'PayPal'
   AND taxCountry = 'USA'
GROUP BY taxCountry
ORDER BY taxCountry

--"PayPal - AUD - Web"
--"Jan 2014"
SELECT "=================================="
SELECT "[PayPal - AUD - Web] Jan 2014"
SELECT
    taxCountry  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2014Jan t
 WHERE paymentType = 'PayPal'
   AND taxCountry = 'Australia'
GROUP BY taxCountry
ORDER BY taxCountry

-- taxCountry = 'Canada'
-- paymentType = 'INTERAC'
SELECT "=================================="
SELECT "[INTERAC 87184510014 - CAD - Web] Jan 2014"
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
  FROM report_db..WebSale2014Jan t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'INTERAC'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

-- taxCountry = 'Canada'
-- paymentType = 'Cash & Money Orders'
SELECT "==========================================="
SELECT "[Cash & Money Orders - CAD - Web] Jan 2014"
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
  FROM report_db..WebSale2014Jan t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'MONEY ORDER'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

--"Cash & Money Orders - USD - Web"
--"Jan 2014"
SELECT "=========================================="
SELECT "[Cash & Money Orders - USD - Web] Jan 2014"
SELECT
    taxCountry  ,
    sum(cost) as Cost,
    sum(tax ) as Tax, 
    SUM(cost + tax) as Total 
  FROM report_db..WebSale2014Jan t
 WHERE paymentType = 'MONEY ORDER'
   AND taxCountry = 'USA'
GROUP BY taxCountry
ORDER BY taxCountry

--######################################
-- STOP HERE 
--######################################

