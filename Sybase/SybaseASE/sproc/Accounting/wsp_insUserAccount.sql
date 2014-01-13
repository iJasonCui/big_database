IF OBJECT_ID('dbo.wsp_insUserAccount') IS NOT NULL
BEGIN
   DROP PROCEDURE dbo.wsp_insUserAccount
   IF OBJECT_ID('dbo.wsp_insUserAccount') IS NOT NULL
      PRINT '<<< FAILED DROPPING PROCEDURE dbo.wsp_insUserAccount >>>'
   ELSE
      PRINT '<<< DROPPED PROCEDURE dbo.wsp_insUserAccount >>>'
END
go
/******************************************************************************
**
** CREATION:
**   Author:  Mike Stairs
**   Date:  May 21, 2003
**   Description:  creates new user account info
**
**
** REVISION(S):
**   Author: Yan L
**   Date:  Oct 2 2008
**   Description: add subscriptionOfferId 
**
******************************************************************************/
CREATE PROCEDURE dbo.wsp_insUserAccount
   @userId              NUMERIC(12,0),
   @billingLocationId   SMALLINT,
   @accountType         CHAR(1),
   @purchaseOfferId     SMALLINT,
   @usageCellId         SMALLINT,
   @subscriptionOfferId SMALLINT
AS
DECLARE @dateCreated DATETIME,
        @return INT  
        
EXEC @return = dbo.wsp_GetDateGMT @dateCreated OUTPUT
     
IF (@return != 0)
   BEGIN
      RETURN @return
   END

IF NOT EXISTS (SELECT 1 FROM UserAccount WHERE userId = @userId)
   BEGIN
      BEGIN TRAN TRAN_insUserAccount
         INSERT INTO UserAccount(userId, 
                                 billingLocationId, 
                                 purchaseOfferId,
                                 usageCellId,
                                 accountType, 
                                 subscriptionOfferId,
                                 dateCreated,
                                 dateModified)
         VALUES(@userId,
                @billingLocationId,
                @purchaseOfferId,
                @usageCellId,
                @accountType,
                @subscriptionOfferId,
                @dateCreated,
                @dateCreated)

        IF (@@error != 0)
           BEGIN
              ROLLBACK TRAN TRAN_insUserAccount
              RETURN 98
           END

        INSERT INTO UserAccountHistory(userId, 
                                       billingLocationId, 
                                       purchaseOfferId,
                                       usageCellId,
                                       accountType, 
                                       subscriptionOfferId,
                                       dateCreated,
                                       dateModified)
        VALUES(@userId,
               @billingLocationId,
               @purchaseOfferId,
               @usageCellId,
               @accountType,
               @subscriptionOfferId,
               @dateCreated,
               @dateCreated)

        IF (@@error = 0)
           BEGIN
              COMMIT TRAN TRAN_insUserAccount
              RETURN 0
           END
        ELSE
           BEGIN
              ROLLBACK TRAN TRAN_insUserAccount
              RETURN 99
           END
   END
go

IF OBJECT_ID('dbo.wsp_insUserAccount') IS NOT NULL
   PRINT '<<< CREATED PROCEDURE dbo.wsp_insUserAccount >>>'
ELSE
   PRINT '<<< FAILED CREATING PROCEDURE dbo.wsp_insUserAccount >>>'
go

GRANT EXECUTE ON dbo.wsp_insUserAccount TO web
go
