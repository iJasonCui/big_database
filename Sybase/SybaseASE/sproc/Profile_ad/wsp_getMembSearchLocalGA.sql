IF OBJECT_ID('dbo.wsp_getMembSearchLocalGA') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.wsp_getMembSearchLocalGA
    IF OBJECT_ID('dbo.wsp_getMembSearchLocalGA') IS NOT NULL
        PRINT '<<< FAILED DROPPING PROCEDURE dbo.wsp_getMembSearchLocalGA >>>'
    ELSE
        PRINT '<<< DROPPED PROCEDURE dbo.wsp_getMembSearchLocalGA >>>'
END
go
/******************************************************************************
**
** CREATION:
**   Author:  Mike Stairs
**   Date:  Sept 20 2002
**   Description:  retrieves list of new members/pics/gallerys since
**   cutoff
**
**
** REVISION(S):
**   Author: Anna Deigin and Mike Stairs
**   Date: December 2003
**   Description: added VP type and revised B type to do union with ProfileMedia table
**
** REVISION(S):
**   Author: Travis McCauley
**   Date:  June 7, 2004
**   Description: Added city db fields for use when no lat long is available
**
** REVISION(S):
**   Author: Mike Stairs
**   Date: Feb 2005
**   Description: added languageMask, made more efficient removing extra blocklist check
**
****************************************************************************/
CREATE PROCEDURE  wsp_getMembSearchLocalGA
 @productCode CHAR(1)
,@communityCode CHAR(1)
,@userId NUMERIC(12,0)
,@rowcount INT
,@gender CHAR(1)
,@lastonCutoff INT
,@startingCutoff INT
,@languageMask int
,@type CHAR(2)
,@fromLat int
,@fromLong int
,@toLat int
,@toLong int
,@countryId smallint
,@stateId smallint
,@countyId smallint
,@cityId  int
,@matchLanguage bit
AS
BEGIN
  SET ROWCOUNT @rowcount

  IF ( @toLat <> 0 )
   BEGIN
    SELECT
      user_id,
      laston
    FROM a_profile_dating (index ndx_search_latlong)
    WHERE
         (gallery = 'Y' OR user_id in (select userId from ProfileMedia where galleryFlag = 'Y') )
         AND show='Y' AND (show_prefs='Y' OR (show_prefs='O' and on_line='Y'))
         AND NOT EXISTS
         (
              SELECT
                   targetUserId
              FROM Blocklist
              WHERE
                 userId=@userId
                 AND targetUserId=a_profile_dating.user_id
         )
         AND laston > @startingCutoff
         AND laston < @lastonCutoff
         AND gender = @gender
         AND dbo.sp__languageMatched(profileLanguageMask, @languageMask, @matchLanguage) = 1
         AND lat_rad >= @fromLat 
         AND lat_rad <= @toLat
         AND long_rad >= @fromLong
         AND long_rad <= @toLong
    ORDER BY laston desc, user_id
    AT ISOLATION READ UNCOMMITTED
  END
  
  --use cityId
  ELSE  IF (@cityId > 0 )
   BEGIN
    SELECT
      user_id,
      laston
    FROM a_profile_dating
    WHERE
         (gallery = 'Y' OR user_id in (select userId from ProfileMedia where galleryFlag = 'Y') )    
         AND show='Y' AND (show_prefs='Y' OR (show_prefs='O' and on_line='Y'))
         AND NOT EXISTS
         (
              SELECT
                   targetUserId
              FROM Blocklist
              WHERE
                 userId=@userId
                 AND targetUserId=a_profile_dating.user_id
         )
         AND laston > @startingCutoff
         AND laston < @lastonCutoff
         AND gender = @gender
         AND dbo.sp__languageMatched(profileLanguageMask, @languageMask, @matchLanguage) = 1
         AND cityId = @cityId
    ORDER BY laston desc, user_id
    AT ISOLATION READ UNCOMMITTED
    
    RETURN @@error
  END 

  --use countyId
  ELSE  IF (@countyId > 0 )
   BEGIN
    SELECT
      user_id,
      laston
    FROM a_profile_dating
    WHERE
         (gallery = 'Y' OR user_id in (select userId from ProfileMedia where galleryFlag = 'Y') )    
         AND show='Y' AND (show_prefs='Y' OR (show_prefs='O' and on_line='Y'))
         AND NOT EXISTS
         (
              SELECT
                   targetUserId
              FROM Blocklist
              WHERE
                 userId=@userId
                 AND targetUserId=a_profile_dating.user_id
         )
         AND laston > @startingCutoff
         AND laston < @lastonCutoff
         AND gender = @gender
         AND dbo.sp__languageMatched(profileLanguageMask, @languageMask, @matchLanguage) = 1
         AND secondJurisdictionId = @countyId
    ORDER BY laston desc, user_id
    AT ISOLATION READ UNCOMMITTED
    RETURN @@error
  END 

  --use stateId
  ELSE  IF (@stateId > 0 )
   BEGIN
    SELECT
      user_id,
      laston
    FROM a_profile_dating
    WHERE
         (gallery = 'Y' OR user_id in (select userId from ProfileMedia where galleryFlag = 'Y') )    
         AND show='Y' AND (show_prefs='Y' OR (show_prefs='O' and on_line='Y'))
         AND NOT EXISTS
         (
              SELECT
                   targetUserId
              FROM Blocklist
              WHERE
                 userId=@userId
                 AND targetUserId=a_profile_dating.user_id
         )
         AND laston > @startingCutoff
         AND laston < @lastonCutoff
         AND gender = @gender
         AND dbo.sp__languageMatched(profileLanguageMask, @languageMask, @matchLanguage) = 1
         AND jurisdictionId = @stateId
    ORDER BY laston desc, user_id
    AT ISOLATION READ UNCOMMITTED
    RETURN @@error
  END 

  --use countryId
  ELSE  IF (@countryId > 0 )
   BEGIN
    SELECT
      user_id,
      laston
    FROM a_profile_dating
    WHERE
         (gallery = 'Y' OR user_id in (select userId from ProfileMedia where galleryFlag = 'Y') )    
         AND show='Y' AND (show_prefs='Y' OR (show_prefs='O' and on_line='Y'))
         AND NOT EXISTS
         (
              SELECT
                   targetUserId
              FROM Blocklist
              WHERE
                 userId=@userId
                 AND targetUserId=a_profile_dating.user_id
         )
         AND laston > @startingCutoff
         AND laston < @lastonCutoff
         AND gender = @gender
         AND dbo.sp__languageMatched(profileLanguageMask, @languageMask, @matchLanguage) = 1
         AND countryId = @countryId
    ORDER BY laston desc, user_id
    AT ISOLATION READ UNCOMMITTED
    RETURN @@error
  END 

END 
 
go
GRANT EXECUTE ON dbo.wsp_getMembSearchLocalGA TO web
go
IF OBJECT_ID('dbo.wsp_getMembSearchLocalGA') IS NOT NULL
   PRINT '<<< CREATED PROCEDURE dbo.wsp_getMembSearchLocalGA >>>'
ELSE
   PRINT '<<< FAILED CREATING PROCEDURE dbo.wsp_getMembSearchLocalGA >>>'
go
EXEC sp_procxmode 'dbo.wsp_getMembSearchLocalGA','unchained'
go
