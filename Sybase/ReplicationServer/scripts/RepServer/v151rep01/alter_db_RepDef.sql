--select "alter database replication definition " +  dbname + " with primary at LogicalSRV." + dbname + "  not replicate ddl"
--from rs_repdbs

alter database replication definition ContentMonitor with primary at LogicalSRV.ContentMonitor  not replicate ddl
alter database replication definition IVRMobile with primary at LogicalSRV.IVRMobile  not replicate ddl
alter database replication definition LPortal with primary at LogicalSRV.LPortal  not replicate ddl
alter database replication definition crm with primary at LogicalSRV.crm  not replicate ddl
go

