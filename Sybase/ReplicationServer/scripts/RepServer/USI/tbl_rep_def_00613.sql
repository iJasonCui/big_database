create replication definition "USI_CRMMailRcptId"
with primary at LogicalSRV.USI
with all tables named "CRMMailRcptId"
(
        "CRMMailRcptId" numeric
)
primary key ( "CRMMailRcptId")
/* No searchable columns */
replicate minimal columns
go

create replication definition "USI_CRMMailRecipientSource"
with primary at LogicalSRV.USI
with all tables named "CRMMailRecipientSource"
(
	"CRMMailRcptId" numeric,
	"CRMMailSourceId" int,
	"dateOptIn" datetime,
	"dateOptOut" datetime
)
primary key ( "CRMMailSourceId", "CRMMailRcptId")
/* No searchable columns */
replicate minimal columns
go
create replication definition "USI_CRMMailRecepientGuest"
with primary at LogicalSRV.USI
with all tables named "CRMMailRecepientGuest"
(
	"CRMMailRcptId" numeric,
	"gender" char(1),
	"emailAddress" varchar(80),
	"guestName" varchar(40),
	"DOB" datetime,
	"localPref" tinyint,
	"cityId" int,
	"jurisdictionId" smallint,
	"secondJurisdictionId" smallint,
	"countryId" smallint
)
primary key ( "CRMMailRcptId")
/* No searchable columns */
replicate minimal columns
go
create replication definition "USI_CRMMailRecepient"
with primary at LogicalSRV.USI
with all tables named "CRMMailRecepient"
(
	"CRMMailRcptId" numeric,
	"userId" numeric,
	"dateCreated" datetime
)
primary key ( "CRMMailRcptId")
/* No searchable columns */
replicate minimal columns
go
create replication definition "USI_CRMUserPreference"
with primary at LogicalSRV.USI
with all tables named "CRMUserPreference"
(
	"CRMMailRcptId" numeric,
	"commPrefGroupId" int,
	"commPrefValue" int,
	"dateCreated" datetime,
	"dateModified" datetime
)
primary key ( "CRMMailRcptId", "commPrefGroupId")
/* No searchable columns */
replicate minimal columns
go
