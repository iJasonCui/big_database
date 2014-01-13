IF OBJECT_ID('dbo.wsp_newBlocklist') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.wsp_newBlocklist
    IF OBJECT_ID('dbo.wsp_newBlocklist') IS NOT NULL
        PRINT '<<< FAILED DROPPING PROCEDURE dbo.wsp_newBlocklist >>>'
    ELSE
        PRINT '<<< DROPPED PROCEDURE dbo.wsp_newBlocklist >>>'
END
go
 /***********************************************************************
**
** CREATION:
**   Author:       Jack Veiga
**   Date:         October 24 2002
**   Description:  Inserts row into Blocklist
**
** REVISION(S):
**   Author:       Andy Tran
**   Date:         March 2008
**   Description:  Delete ViewedMe list as well
**
**   Author:
**   Date:
**   Description:
**
*************************************************************************/

CREATE PROCEDURE wsp_newBlocklist
 @productCode CHAR(1)
,@communityCode CHAR(1)
,@userId NUMERIC(12,0)
,@targetUserId NUMERIC(12,0)

AS

DECLARE @return INT
,@dateCreated DATETIME
,@error INT

SELECT @error = 0

EXEC @return = wsp_GetDateGMT @dateCreated OUTPUT
IF @return != 0
        BEGIN
                RETURN @return
        END

BEGIN TRAN TRAN_newBlocklist

    INSERT INTO Blocklist 
    (userId
    ,targetUserId
    ,initiator
    ,dateCreated
    ) VALUES
    (@userId
    ,@targetUserId
    ,'Y'
    ,@dateCreated
    )

    IF @@error = 0
        BEGIN
            INSERT INTO Blocklist 
            (userId 
            ,targetUserId
            ,initiator
            ,dateCreated
            ) VALUES
            (@targetUserId
            ,@userId
            ,'N'
            ,@dateCreated
            )

            IF @@error = 0
                BEGIN
                    DELETE Hotlist
                    WHERE userId = @userId
                    AND targetUserId = @targetUserId

                    SELECT @error = @error + @@error

                    DELETE Hotlist
                    WHERE userId = @targetUserId
                    AND targetUserId = @userId

                    SELECT @error = @error + @@error

                    IF @error = 0
                        BEGIN
                            DELETE Pass
                            WHERE userId = @userId
                            AND targetUserId = @targetUserId

                            SELECT @error = @error + @@error

                            DELETE Pass
                            WHERE userId = @targetUserId
                            AND targetUserId = @userId

                            SELECT @error = @error + @@error

                            IF @error = 0
                                BEGIN
                                    DELETE Smile
                                    WHERE userId = @userId
                                    AND targetUserId = @targetUserId

                                    SELECT @error = @error + @@error

                                    DELETE Smile
                                    WHERE userId = @targetUserId
                                    AND targetUserId = @userId

                                    SELECT @error = @error + @@error

                                    IF @error = 0
                                        BEGIN
                                            DELETE ViewedMe
                                            WHERE userId = @userId
                                            AND targetUserId = @targetUserId

                                            SELECT @error = @error + @@error

                                            DELETE ViewedMe
                                            WHERE userId = @targetUserId
                                            AND targetUserId = @userId

                                            SELECT @error = @error + @@error

                                            IF @error = 0
                                                BEGIN
                                                    COMMIT TRAN TRAN_newBlocklist
                                                    RETURN 0
                                                END
                                            ELSE
                                                BEGIN
                                                    ROLLBACK TRAN TRAN_newBlocklist
                                                    RETURN 99
                                                END
                                        END
                                    ELSE
                                        BEGIN
                                            ROLLBACK TRAN TRAN_newBlocklist
                                            RETURN 99
                                        END
                                END
                            ELSE
                                BEGIN
                                    ROLLBACK TRAN TRAN_newBlocklist
                                    RETURN 99
                                END
                        END
                    ELSE
                        BEGIN
                            ROLLBACK TRAN TRAN_newBlocklist
                            RETURN 99
                        END 
                END
            ELSE
                BEGIN
                    ROLLBACK TRAN TRAN_newBlocklist
                    RETURN 99
                END
        END
    ELSE
        BEGIN
            ROLLBACK TRAN TRAN_newBlocklist
            RETURN 99
        END
 
go
GRANT EXECUTE ON dbo.wsp_newBlocklist TO web
go
IF OBJECT_ID('dbo.wsp_newBlocklist') IS NOT NULL
   PRINT '<<< CREATED PROCEDURE dbo.wsp_newBlocklist >>>'
ELSE
   PRINT '<<< FAILED CREATING PROCEDURE dbo.wsp_newBlocklist >>>'
go
EXEC sp_procxmode 'dbo.wsp_newBlocklist','unchained'
go
