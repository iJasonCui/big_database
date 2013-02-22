/* SessionGuest */
create replication definition "Session_SessionGuest"
with primary at LogicalSRV.Session
with all tables named "SessionGuest"
(
	"sessionGuest" char(64),
	"webServer" varchar(12),
	"gender" char(1),
	"context" char(3),
	"cookieId" numeric,
	"adCode" varchar(30),
	"dateCreated" datetime,
	"dateModified" datetime,
	"localePref" tinyint,
	"entranceLocale" tinyint,
	"ipAddress" numeric
)
primary key ( "sessionGuest")
replicate minimal columns
/* No searchable columns */
go
/* SessionGuestHistory */
create replication definition "Session_SessionGuestHistory"
with primary at LogicalSRV.Session
with all tables named "SessionGuestHistory"
(
	"sessionGuest" char(64),
	"gender" char(1),
	"context" char(3),
	"cookieId" numeric,
	"adCode" varchar(30),
	"dateCreated" datetime,
	"dateLastActivity" datetime,
	"pageHitCount" int,
	"localePref" tinyint,
	"entranceLocale" tinyint,
	"ipAddress" numeric
)
primary key ( "dateCreated", "sessionGuest")
replicate minimal columns
/* No searchable columns */
go
/* SessionMember */
create replication definition "Session_SessionMember"
with primary at LogicalSRV.Session
with all tables named "SessionMember"
(
	"sessionMember" char(64),
	"webServer" varchar(12),
	"gender" char(1),
	"context" char(3),
	"cookieId" numeric,
	"adCode" varchar(30),
	"userId" numeric,
	"userType" char(1),
	"IMLock" int,
	"latitude" int,
	"longitude" int,
	"maskProfile" int,
	"maskPicture" int,
	"dateIMPaidExpires" datetime,
	"dateCreated" datetime,
	"dateModified" datetime,
	"dateLastActivity" datetime,
	"video" char(1),
	"localePref" tinyint,
	"ipAddress" numeric,
	"maskFrenchProfile" int
)
primary key ( "sessionMember")
replicate minimal columns
/* No searchable columns */
go
/* SessionMemberHistory */
create replication definition "Session_SessionMemberHistory"
with primary at LogicalSRV.Session
with all tables named "SessionMemberHistory"
(
	"sessionMember" char(64),
	"gender" char(1),
	"context" char(3),
	"cookieId" numeric,
	"adCode" varchar(30),
	"userId" numeric,
	"userType" char(1),
	"dateCreated" datetime,
	"dateModified" datetime,
	"dateLastActivity" datetime,
	"pageHitCount" int,
	"video" char(1),
	"localePref" tinyint,
	"ipAddress" numeric
)
primary key ( "dateCreated", "sessionMember")
replicate minimal columns
/* No searchable columns */
go
