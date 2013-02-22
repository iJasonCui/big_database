create replication definition "Session_SessionAssociate"
with primary at LogicalSRV.Session
with all tables named "SessionAssociate"
(
	"sessionAssociateId" int,
	"randomKey" char(64),
	"webServerId" smallint,
	"enterDatetime" datetime,
	"associateId" numeric,
	"logonDatetime" datetime,
	"logoutDatetime" datetime
)
primary key ("sessionAssociateId", "randomKey")
/* No searchable columns */
replicate minimal columns
go
create replication definition "Session_SessionAssociateHist"
with primary at LogicalSRV.Session
with all tables named "SessionAssociateHistory"
(
	"enterDatetime" datetime,
	"sessionAssociateId" numeric,
	"randomKey" char(64),
	"webServerId" smallint,
	"exitDatetime" datetime,
	"associateId" smallint,
	"logonDatetime" datetime,
	"logoutDatetime" datetime
)
primary key ("enterDatetime", "sessionAssociateId", "randomKey")
/* No searchable columns */
replicate minimal columns
go
create replication definition "Session_SessionAssociateId"
with primary at LogicalSRV.Session
with all tables named "SessionAssociateId"
(
	"sessionAssociateId" int
)
primary key (sessionAssociateId)
/* No searchable columns */
replicate minimal columns
go
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
/* No searchable columns */
replicate minimal columns
go
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
/* No searchable columns */
replicate minimal columns
go
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
/* No searchable columns */
replicate minimal columns
go
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
/* No searchable columns */
replicate minimal columns
go
create replication definition "Session_session"
with primary at LogicalSRV.Session
with all tables named "session"
(
	"session_id" numeric,
	"user_id" numeric,
	"user_type" char(1),
	"capabilities" varchar(50),
	"username" char(16),
	"gender" char(1),
	"location_id" numeric,
	"birthdate" smalldatetime,
	"tid" varchar(14),
	"units" char(1),
	"logon_time" int,
	"last_logon_time" int,
	"last_activity" int,
	"say_last_activity" int,
	"logoff_time" int,
	"login_context" char(3),
	"a_romance_identity" varchar(16),
	"a_dating_identity" varchar(16),
	"a_intimate_identity" varchar(16),
	"m_romance_identity" varchar(16),
	"m_dating_identity" varchar(16),
	"m_intimate_identity" varchar(16),
	"w_romance_identity" varchar(16),
	"w_dating_identity" varchar(16),
	"w_intimate_identity" varchar(16),
	"a_dating_searchlast" numeric,
	"a_romance_searchlast" numeric,
	"a_intimate_searchlast" numeric,
	"m_dating_searchlast" numeric,
	"m_romance_searchlast" numeric,
	"m_intimate_searchlast" numeric,
	"w_dating_searchlast" numeric,
	"w_romance_searchlast" numeric,
	"w_intimate_searchlast" numeric,
	"a_say_count_dating" smallint,
	"a_say_count_romance" smallint,
	"a_say_count_intimate" smallint,
	"m_say_count_dating" smallint,
	"m_say_count_romance" smallint,
	"m_say_count_intimate" smallint,
	"w_say_count_dating" smallint,
	"w_say_count_romance" smallint,
	"w_say_count_intimate" smallint,
	"a_unreadmail_count_dating" smallint,
	"a_unreadmail_count_romance" smallint,
	"a_unreadmail_count_intimate" smallint,
	"m_unreadmail_count_dating" smallint,
	"m_unreadmail_count_romance" smallint,
	"m_unreadmail_count_intimate" smallint,
	"w_unreadmail_count_dating" smallint,
	"w_unreadmail_count_romance" smallint,
	"w_unreadmail_count_intimate" smallint,
	"nicknames" varchar(255),
	"privlistH" varchar(255),
	"privlistN" varchar(255),
	"privlistI" varchar(255),
	"privlistO" varchar(255),
	"ip_address" varchar(16),
	"lat_rad" int,
	"long_rad" int,
	"timezone" varchar(10),
	"cookie_id" numeric,
	"recvcookie_id" numeric,
	"updates" int,
	"say_timeout" int,
	"status" char(1),
	"lastbranch" varchar(255),
	"lastbranch_timestamp" int,
	"zodiac_sign" char(1),
	"lm_custom" char(1),
	"lm_browse" char(1),
	"a_newcarrots_dating" int,
	"a_newcarrots_romance" int,
	"a_newcarrots_intimate" int,
	"m_newcarrots_dating" int,
	"m_newcarrots_romance" int,
	"m_newcarrots_intimate" int,
	"w_newcarrots_dating" int,
	"w_newcarrots_romance" int,
	"w_newcarrots_intimate" int,
	"search_checkbox" char(1),
	"adcode" varchar(30),
	"a_pre_say_count_dating" smallint,
	"a_pre_say_count_romance" smallint,
	"a_pre_say_count_intimate" smallint,
	"m_pre_say_count_dating" smallint,
	"m_pre_say_count_romance" smallint,
	"m_pre_say_count_intimate" smallint,
	"w_pre_say_count_dating" smallint,
	"w_pre_say_count_romance" smallint,
	"w_pre_say_count_intimate" smallint,
	"imfs_expand" char(1),
	"display_time" int,
	"mail_dating" char(1),
	"mail_romance" char(1),
	"mail_intimate" char(1),
	"msg_dating" char(1),
	"msg_romance" char(1),
	"msg_intimate" char(1),
	"carrot" char(1),
	"guest_adcode" varchar(30),
	"pref_last_on" char(1),
	"last_logoff" int,
	"second_last_logon_time" int,
	"im_lock_timestamp" int,
	"current_partition" char(1)
)
primary key ( "session_id")
/* No searchable columns */
replicate minimal columns
go
create replication definition "Session_session_sequence"
with primary at LogicalSRV.Session
with all tables named "session_sequence"
(
	"sequence_name" varchar(24),
	"last_sequence" numeric
)
primary key (sequence_name)
/* No searchable columns */
replicate minimal columns
go
create replication definition "Session_AdaptiveLog"
with primary at LogicalSRV.Session
with all tables named "AdaptiveLog"
(
	"product" char(1),
	"community" char(1),
	"gender" char(1),
	"zip" char(6),
	"fromAge" int,
	"toAge" int,
	"distance" int,
	"counts" int,
	"history" varchar(255),
	"searchFlag" int,
	"dateCreated" datetime
)
primary key ( "zip", "fromAge", "toAge", "product", "community", "gender","searchFlag")
/* No searchable columns */
replicate minimal columns
go
create replication definition "Session_AdaptiveKnowledge"
with primary at LogicalSRV.Session
with all tables named "AdaptiveKnowledge"
(
	"product" char(1),
	"community" char(1),
	"gender" char(1),
	"zip" char(6),
	"fromAge" int,
	"toAge" int,
	"distance" int,
	"searchFlag" int,
	"dateCreated" datetime
)
primary key ( "zip", "fromAge", "toAge", "product", "community", "gender","searchFlag")
/* No searchable columns */
replicate minimal columns
go
create replication definition "Session_RepTest"
with primary at LogicalSRV.Session
with all tables named "RepTest"
(
	"repTestId" int,
	"dateTime" datetime
)
primary key (repTestId )
/* No searchable columns */
replicate minimal columns
go
