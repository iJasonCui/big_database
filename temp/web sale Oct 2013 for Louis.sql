drop table report_db..WebSale2013Oct

--summary

select sum(p.cost) as 'cost', sum(p.tax) as 'tax', sum(p.costUSD) as 'costUSD', sum(p.taxUSD) as 'taxUSD',
       pt.purchaseTypeId, pt.description as 'paymentType', ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId
into report_db..WebSale2013Oct
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
group by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId
order by ct.countryName, jt.jurisdictionName, pt.purchaseTypeId, pt.description, cc.cardTypeId

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
SELECT "[Optimal - CAD - Web] Oct 2013"
SELECT
    taxJurisdiction  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'Canada'
--   AND c.cardTypeCode  IN ('VI', 'MC')    
--   AND c.cardTypeCode != 'AX'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

-- Optimal 99945299 - USD - Web
-- taxCountry = 'USA'
-- cardTypeCode != 'AX'
SELECT "=================================="
SELECT "[Optimal - USD - Web] Oct 2013"
SELECT
    taxCountry  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'USA'
   AND c.cardTypeCode != 'AX'
GROUP BY taxCountry
ORDER BY taxCountry

SELECT "=================================="
SELECT "[Optimal - AUD - Web] Oct 2013"
SELECT
    taxCountry  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'Australia'
--   AND c.cardTypeCode != 'AX'
GROUP BY taxCountry
ORDER BY taxCountry

SELECT "=================================="
SELECT "[AMEX - CAD - Web] Oct 2013"
SELECT
    taxJurisdiction  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'Canada'
   AND c.cardTypeCode = 'AX'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

--"AMEX - USD - Web"
--"Oct 2013"
SELECT "=================================="
SELECT "[AMEX - USD - Web] Oct 2013"
SELECT
    taxCountry  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t, Accounting..CardType c 
 WHERE t.cardTypeId = c.cardTypeId
   AND taxCountry = 'USA'
   AND c.cardTypeCode = 'AX'
GROUP BY taxCountry
ORDER BY taxCountry

-- taxCountry = 'Canada'
-- PayPal
SELECT "=================================="
SELECT "[PayPal - CAD - Web] Oct 2013"
SELECT
    taxJurisdiction  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'PayPal'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

--"PayPal - USD - Web"
--"Oct 2013"
SELECT "=================================="
SELECT "[PayPal - USD - Web] Oct 2013"
SELECT
    taxCountry  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t
 WHERE paymentType = 'PayPal'
   AND taxCountry = 'USA'
GROUP BY taxCountry
ORDER BY taxCountry

--"PayPal - AUD - Web"
--"Oct 2013"
SELECT "=================================="
SELECT "[PayPal - AUD - Web] Oct 2013"
SELECT
    taxCountry  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t
 WHERE paymentType = 'PayPal'
   AND taxCountry = 'Australia'
GROUP BY taxCountry
ORDER BY taxCountry

-- taxCountry = 'Canada'
-- paymentType = 'INTERAC'
SELECT "=================================="
SELECT "[INTERAC - CAD - Web] Oct 2013"
SELECT
    taxJurisdiction  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'INTERAC'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

-- taxCountry = 'Canada'
-- paymentType = 'Cash & Money Orders'
SELECT "==========================================="
SELECT "[Cash & Money Orders - CAD - Web] Oct 2013"
SELECT
    taxJurisdiction  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t
 WHERE taxCountry = 'Canada'
   AND paymentType = 'MONEY ORDER'
GROUP BY taxJurisdiction
ORDER BY taxJurisdiction

--"Cash & Money Orders - USD - Web"
--"Oct 2013"
SELECT "=========================================="
SELECT "[Cash & Money Orders - USD - Web] Oct 2013"
SELECT
    taxCountry  ,
    sum(cost) as cost,
    sum(tax ) as tax 
  FROM report_db..WebSale2013Oct t
 WHERE paymentType = 'MONEY ORDER'
   AND taxCountry = 'USA'
GROUP BY taxCountry
ORDER BY taxCountry

--######################################
-- STOP HERE 
--######################################


--detailed transaction
--drop table report_db..WebSaleTran2013Oct
select p.xactionId, p.cost as 'cost', p.tax as 'tax', p.costUSD as 'costUSD', p.taxUSD as 'taxUSD', p.dateCreated,
       pt.description as 'paymentType', p.billingLocationId, 
       ct.countryName as 'taxCountry', jt.jurisdictionName as 'taxJurisdiction', cc.cardTypeId, cc.partialCardNum
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

select * from  report_db..WebSaleTran2013Oct 
where  billingLocationId = 1 and dateCreated >= 'oct 31 2013'
t.taxCountry = ,

select t.billingLocationId, t.taxCountryId, t.dateCreated, t.cost
--from  report_db..WebSaleTran2013Oct t
from Accounting..Purchase t
where t.xactionId in ( select xactionId from report_db..oct ) 

--and t.dateCreated < 'oct 1 2013'

select sum(t.cost)
--from  report_db..WebSaleTran2013Oct t
from Accounting..Purchase t
where t.xactionId in ( select xactionId from report_db..oct )   --9583.80
and t.dateCreated < 'oct 1 2013'  -- 1868.65

select convert(char(11),dateCreated), sum(t.cost)
--from  report_db..WebSaleTran2013Oct t
from Accounting..Purchase t
where t.xactionId in ( select xactionId from report_db..oct )   --9583.80
group by convert(char(11),dateCreated)
order by convert(char(11),dateCreated)

--Oct  1 2013	1917.36
--Oct  2 2013	2000.29
--Oct  3 2013	1588.53
--Oct  4 2013	931.59
--Oct  5 2013	1277.38

select convert(char(11),dateCreated), sum(t.cost)
from  report_db..WebSaleTran2013Oct t
where t.xactionId in ( select xactionId from report_db..oct )   --9583.80
group by convert(char(11),dateCreated)
order by convert(char(11),dateCreated)
--Oct  1 2013	1917.36
--Oct  2 2013	2000.29
--Oct  3 2013	1588.53
--Oct  4 2013	931.59
--Oct  5 2013	1277.38
select a.xactionId, b.xactionId	as id_b
from     
(select t.* 
from  report_db..WebSaleTran2013Oct t, Accounting..CardType c 
where t.billingLocationId = 1 
   AND t.cardTypeId = c.cardTypeId
   AND taxCountry = 'Canada'
   AND c.cardTypeCode != 'AX'
and t.dateCreated >= 'oct 1 2013' and t.dateCreated < 'oct 2 2013') as a, 
(select t.billingLocationId, t.taxCountryId, t.dateCreated, t.xactionId, t.cost
--from  report_db..WebSaleTran2013Oct t
from Accounting..Purchase t
where t.xactionId in ( select xactionId from report_db..oct ) 
and t.dateCreated >= 'oct 1 2013' and t.dateCreated < 'oct 2 2013') as b
where b.xactionId *= a.xactionId

select * from   Accounting..Purchase where xactionId in (
123580730,
123581071,
123581090)

select * from Accounting..CreditCard c where c.creditCardId in (
2794086,
2846847,
2782697)

select *
from Accounting..Purchase t
where t.dateCreated >= 'oct 1 2013' and t.dateCreated < 'oct 2 2013'


select * from  report_db..WebSaleTran2013Oct t
CREATE TABLE dbo.oct
(
    xactionId int NOT NULL
)

