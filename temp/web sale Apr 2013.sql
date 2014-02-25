select datepart(month, p.dateCreated) as Month, p.xactionTypeId, p.billingLocationId, sum(p.costUSD) as TotalCostUSD, count(*)
from Accounting..Purchase p
where p.dateCreated >= 'Jan 1 2013'
  and p.dateCreated < 'Apr 1 2013'
  and p.xactionTypeId in (6, 31, 32)
group by datepart(month, p.dateCreated) , p.xactionTypeId, p.billingLocationId   
order by datepart(month, p.dateCreated) , p.xactionTypeId, p.billingLocationId   