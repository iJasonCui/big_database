IF OBJECT_ID('dbo.wsp_fixUserAccount_OfferId70') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.wsp_fixUserAccount_OfferId70
    IF OBJECT_ID('dbo.wsp_fixUserAccount_OfferId70') IS NOT NULL
        PRINT '<<< FAILED DROPPING PROCEDURE dbo.wsp_fixUserAccount_OfferId70 >>>'
    ELSE
        PRINT '<<< DROPPED PROCEDURE dbo.wsp_fixUserAccount_OfferId70 >>>'
END
go
CREATE PROCEDURE dbo.wsp_fixUserAccount_OfferId70
AS
BEGIN

DECLARE @userId              numeric(12,0)
DECLARE @errorReturn         int
DECLARE @rowCountEffected    int
DECLARE @msgReturn           varchar(255)
DECLARE @dateModified        DATETIME

SELECT @rowCountEffected = 0

EXEC wsp_GetDateGMT @dateModified OUTPUT

SELECT userId 
INTO #fixUserAccount_OfferId70
FROM UserAccount 
WHERE purchaseOfferId = 70

DECLARE CUR_fixUserAccount_OfferId70 CURSOR FOR
SELECT userId
FROM   #fixUserAccount_OfferId70
FOR READ ONLY

OPEN CUR_fixUserAccount_OfferId70
FETCH CUR_fixUserAccount_OfferId70 INTO @userId

WHILE @@sqlstatus != 2
BEGIN
    IF @@sqlstatus = 1
    BEGIN
       CLOSE CUR_fixUserAccount_OfferId70
       DEALLOCATE CURSOR CUR_fixUserAccount_OfferId70
       SELECT @msgReturn = 'error: there is something wrong with CUR_fixUserAccount_OfferId70'
       PRINT @msgReturn
       RETURN 99
    END
    ELSE BEGIN
       BEGIN TRAN TRAN_fixUserAccount_OfferId70
       
       UPDATE UserAccount
       SET   purchaseOfferId = 1, dateModified = @dateModified
       WHERE userId = @userId
       
       IF @@error = 0
       BEGIN
         
          INSERT UserAccountHistory (userId, billingLocationId, purchaseOfferId, usageCellId, accountType, dateCreated, dateModified, dateExpiry)
          SELECT userId, billingLocationId, purchaseOfferId, usageCellId, accountType, dateCreated, dateModified, dateExpiry
          FROM UserAccount WHERE userId = @userId	    
           
          IF @@error = 0 
          BEGIN
             COMMIT TRAN TRAN_fixUserAccount_OfferId70
             SELECT @rowCountEffected = @rowCountEffected + 1
          END
          ELSE BEGIN
             SELECT @msgReturn = 'Error: INSERT UserAccountHistory WHERE userId = ' + convert(varchar(20),@userId)
             PRINT @msgReturn          
             ROLLBACK TRAN TRAN_fixUserAccount_OfferId70
          END 
          
       END
       ELSE BEGIN
          SELECT @msgReturn = 'Error: UPDATE UserAccount SET purchaseOfferId = 1 WHERE userId = ' + convert(varchar(20),@userId)
          PRINT @msgReturn          
          ROLLBACK TRAN TRAN_fixUserAccount_OfferId70
       END          
    END

    FETCH CUR_fixUserAccount_OfferId70 INTO @userId

END

CLOSE CUR_fixUserAccount_OfferId70
DEALLOCATE CURSOR CUR_fixUserAccount_OfferId70
SELECT @msgReturn = 'WELL DONE with CUR_fixUserAccount_OfferId70'
PRINT @msgReturn
SELECT @msgReturn = CONVERT(VARCHAR(20),@rowCountEffected) + ' HAS BEEN EFFECTED'
PRINT @msgReturn
        
END
go

IF OBJECT_ID('dbo.wsp_fixUserAccount_OfferId70') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE dbo.wsp_fixUserAccount_OfferId70 >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE dbo.wsp_fixUserAccount_OfferId70 >>>'
go

EXEC sp_procxmode 'dbo.wsp_fixUserAccount_OfferId70','unchained'
go
