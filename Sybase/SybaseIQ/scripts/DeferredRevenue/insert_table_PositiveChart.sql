DECLARE @RepDate  datetime
SELECT  @RepDate = convert(datetime, convert(varchar(10), 20050701))

DELETE FROM DeferredRev.PositiveChartJul2005
go

INSERT DeferredRev.PositiveChartJul2005
(
  userId              
, dateLastPurchased   
, initialBalance      
, creditLastPurchased 
, creditConsumedD1  
, creditConsumedD2  
, creditConsumedD3  
, creditConsumedD4  
, creditConsumedD5  
, creditConsumedD6  
, creditConsumedD7  
, creditConsumedD8  
, creditConsumedD9  
, creditConsumedD10  
, creditConsumedD11  
, creditConsumedD12  
, creditConsumedD13  
, creditConsumedD14  
, creditConsumedD15  
, creditConsumedD16  
, creditConsumedD17  
, creditConsumedD18  
, creditConsumedD19  
, creditConsumedD20  
, creditConsumedD21  
, creditConsumedD22  
, creditConsumedD23  
, creditConsumedD24  
, creditConsumedD25  
, creditConsumedD26  
, creditConsumedD27  
, creditConsumedD28  
, creditConsumedD29  
, creditConsumedD30  
, creditConsumedD31  
, creditConsumedD32  
, creditConsumedD33  
, creditConsumedD34  
, creditConsumedD35  
, creditConsumedD36  
, creditConsumedD37  
, creditConsumedD38  
, creditConsumedD39  
, creditConsumedD40  
, creditConsumedD41  
, creditConsumedD42  
, creditConsumedD43  
, creditConsumedD44  
, creditConsumedD45  
, creditConsumedD46  
, creditConsumedD47  
, creditConsumedD48  
, creditConsumedD49  
, creditConsumedD50  
, creditConsumedD51  
, creditConsumedD52  
, creditConsumedD53  
, creditConsumedD54  
, creditConsumedD55  
, creditConsumedD56  
, creditConsumedD57  
, creditConsumedD58  
, creditConsumedD59  
, creditConsumedD60  
, creditConsumedD61  
, creditConsumedD62  
, creditConsumedD63  
, creditConsumedD64  
, creditConsumedD65  
, creditConsumedD66  
, creditConsumedD67  
, creditConsumedD68  
, creditConsumedD69  
, creditConsumedD70  
, creditConsumedD71  
, creditConsumedD72  
, creditConsumedD73  
, creditConsumedD74  
, creditConsumedD75  
, creditConsumedD76  
, creditConsumedD77  
, creditConsumedD78  
, creditConsumedD79  
, creditConsumedD80  
, creditConsumedD81  
, creditConsumedD82  
, creditConsumedD83  
, creditConsumedD84  
, creditConsumedD85  
, creditConsumedD86  
, creditConsumedD87  
, creditConsumedD88  
, creditConsumedD89  
, creditConsumedD90  
, creditConsumedD91  
, creditConsumedD92  
, creditConsumedD93  
, creditConsumedD94  
, creditConsumedD95  
, creditConsumedD96  
, creditConsumedD97  
, creditConsumedD98  
, creditConsumedD99  
, creditConsumedD100  
, creditConsumedD101  
, creditConsumedD102  
, creditConsumedD103  
, creditConsumedD104  
, creditConsumedD105  
, creditConsumedD106  
, creditConsumedD107  
, creditConsumedD108  
, creditConsumedD109  
, creditConsumedD110  
, creditConsumedD111  
, creditConsumedD112  
, creditConsumedD113  
, creditConsumedD114  
, creditConsumedD115  
, creditConsumedD116  
, creditConsumedD117  
, creditConsumedD118  
, creditConsumedD119  
, creditConsumedD120  
, creditConsumedD121  
, creditConsumedD122  
, creditConsumedD123  
, creditConsumedD124  
, creditConsumedD125  
, creditConsumedD126  
, creditConsumedD127  
, creditConsumedD128  
, creditConsumedD129  
, creditConsumedD130  
, creditConsumedD131  
, creditConsumedD132  
, creditConsumedD133  
, creditConsumedD134  
, creditConsumedD135  
, creditConsumedD136  
, creditConsumedD137  
, creditConsumedD138  
, creditConsumedD139  
, creditConsumedD140  
, creditConsumedD141  
, creditConsumedD142  
, creditConsumedD143  
, creditConsumedD144  
, creditConsumedD145  
, creditConsumedD146  
, creditConsumedD147  
, creditConsumedD148  
, creditConsumedD149  
, creditConsumedD150  
, creditConsumedD151  
, creditConsumedD152  
, creditConsumedD153  
, creditConsumedD154  
, creditConsumedD155  
, creditConsumedD156  
, creditConsumedD157  
, creditConsumedD158  
, creditConsumedD159  
, creditConsumedD160  
, creditConsumedD161  
, creditConsumedD162  
, creditConsumedD163  
, creditConsumedD164  
, creditConsumedD165  
, creditConsumedD166  
, creditConsumedD167  
, creditConsumedD168  
, creditConsumedD169  
, creditConsumedD170  
, creditConsumedD171  
, creditConsumedD172  
, creditConsumedD173  
, creditConsumedD174  
, creditConsumedD175  
, creditConsumedD176  
, creditConsumedD177  
, creditConsumedD178  
, creditConsumedD179  
, creditConsumedD180  
)
SELECT
  a.userId              
, a.dateLastPurchased   
, a.initialBalance      
, a.creditLastPurchased 
, b.creditConsumedD1  
, b.creditConsumedD2  
, b.creditConsumedD3  
, b.creditConsumedD4  
, b.creditConsumedD5  
, b.creditConsumedD6  
, b.creditConsumedD7  
, b.creditConsumedD8  
, b.creditConsumedD9  
, b.creditConsumedD10  
, b.creditConsumedD11  
, b.creditConsumedD12  
, b.creditConsumedD13  
, b.creditConsumedD14  
, b.creditConsumedD15  
, b.creditConsumedD16  
, b.creditConsumedD17  
, b.creditConsumedD18  
, b.creditConsumedD19  
, b.creditConsumedD20  
, b.creditConsumedD21  
, b.creditConsumedD22  
, b.creditConsumedD23  
, b.creditConsumedD24  
, b.creditConsumedD25  
, b.creditConsumedD26  
, b.creditConsumedD27  
, b.creditConsumedD28  
, b.creditConsumedD29  
, b.creditConsumedD30  
, b.creditConsumedD31  
, b.creditConsumedD32  
, b.creditConsumedD33  
, b.creditConsumedD34  
, b.creditConsumedD35  
, b.creditConsumedD36  
, b.creditConsumedD37  
, b.creditConsumedD38  
, b.creditConsumedD39  
, b.creditConsumedD40  
, b.creditConsumedD41  
, b.creditConsumedD42  
, b.creditConsumedD43  
, b.creditConsumedD44  
, b.creditConsumedD45  
, b.creditConsumedD46  
, b.creditConsumedD47  
, b.creditConsumedD48  
, b.creditConsumedD49  
, b.creditConsumedD50  
, b.creditConsumedD51  
, b.creditConsumedD52  
, b.creditConsumedD53  
, b.creditConsumedD54  
, b.creditConsumedD55  
, b.creditConsumedD56  
, b.creditConsumedD57  
, b.creditConsumedD58  
, b.creditConsumedD59  
, b.creditConsumedD60  
, b.creditConsumedD61  
, b.creditConsumedD62  
, b.creditConsumedD63  
, b.creditConsumedD64  
, b.creditConsumedD65  
, b.creditConsumedD66  
, b.creditConsumedD67  
, b.creditConsumedD68  
, b.creditConsumedD69  
, b.creditConsumedD70  
, b.creditConsumedD71  
, b.creditConsumedD72  
, b.creditConsumedD73  
, b.creditConsumedD74  
, b.creditConsumedD75  
, b.creditConsumedD76  
, b.creditConsumedD77  
, b.creditConsumedD78  
, b.creditConsumedD79  
, b.creditConsumedD80  
, b.creditConsumedD81  
, b.creditConsumedD82  
, b.creditConsumedD83  
, b.creditConsumedD84  
, b.creditConsumedD85  
, b.creditConsumedD86  
, b.creditConsumedD87  
, b.creditConsumedD88  
, b.creditConsumedD89  
, b.creditConsumedD90  
, b.creditConsumedD91  
, b.creditConsumedD92  
, b.creditConsumedD93  
, b.creditConsumedD94  
, b.creditConsumedD95  
, b.creditConsumedD96  
, b.creditConsumedD97  
, b.creditConsumedD98  
, b.creditConsumedD99  
, b.creditConsumedD100  
, b.creditConsumedD101  
, b.creditConsumedD102  
, b.creditConsumedD103  
, b.creditConsumedD104  
, b.creditConsumedD105  
, b.creditConsumedD106  
, b.creditConsumedD107  
, b.creditConsumedD108  
, b.creditConsumedD109  
, b.creditConsumedD110  
, b.creditConsumedD111  
, b.creditConsumedD112  
, b.creditConsumedD113  
, b.creditConsumedD114  
, b.creditConsumedD115  
, b.creditConsumedD116  
, b.creditConsumedD117  
, b.creditConsumedD118  
, b.creditConsumedD119  
, b.creditConsumedD120  
, b.creditConsumedD121  
, b.creditConsumedD122  
, b.creditConsumedD123  
, b.creditConsumedD124  
, b.creditConsumedD125  
, b.creditConsumedD126  
, b.creditConsumedD127  
, b.creditConsumedD128  
, b.creditConsumedD129  
, b.creditConsumedD130  
, b.creditConsumedD131  
, b.creditConsumedD132  
, b.creditConsumedD133  
, b.creditConsumedD134  
, b.creditConsumedD135  
, b.creditConsumedD136  
, b.creditConsumedD137  
, b.creditConsumedD138  
, b.creditConsumedD139  
, b.creditConsumedD140  
, b.creditConsumedD141  
, b.creditConsumedD142  
, b.creditConsumedD143  
, b.creditConsumedD144  
, b.creditConsumedD145  
, b.creditConsumedD146  
, b.creditConsumedD147  
, b.creditConsumedD148  
, b.creditConsumedD149  
, b.creditConsumedD150  
, b.creditConsumedD151  
, b.creditConsumedD152  
, b.creditConsumedD153  
, b.creditConsumedD154  
, b.creditConsumedD155  
, b.creditConsumedD156  
, b.creditConsumedD157  
, b.creditConsumedD158  
, b.creditConsumedD159  
, b.creditConsumedD160  
, b.creditConsumedD161  
, b.creditConsumedD162  
, b.creditConsumedD163  
, b.creditConsumedD164  
, b.creditConsumedD165  
, b.creditConsumedD166  
, b.creditConsumedD167  
, b.creditConsumedD168  
, b.creditConsumedD169  
, b.creditConsumedD170  
, b.creditConsumedD171  
, b.creditConsumedD172  
, b.creditConsumedD173  
, b.creditConsumedD174  
, b.creditConsumedD175  
, b.creditConsumedD176  
, b.creditConsumedD177  
, b.creditConsumedD178  
, b.creditConsumedD179  
, b.creditConsumedD180  
FROM DeferredRev.PositiveChartLastBuyCreditJul2005 a, 
     DeferredRev.PositiveChartCreditUsedJul2005 b 
WHERE  a.userId  = b.userId and a.initialBalance > 0 and a.initialBalance <= 500
go
select count(*) from DeferredRev.PositiveChartJul2005
go
