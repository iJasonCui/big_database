--select "alter database replication definition " +  dbname + " with primary at LogicalSRV." + dbname + "  not replicate ddl"
--from rs_repdbs

--alter database replication definition ContentMonitor with primary at LogicalSRV.ContentMonitor  not replicate ddl
alter database replication definition IVRMobile with primary at LogicalSRV.IVRMobile  replicate ddl
alter database replication definition IVRPictures with primary at LogicalSRV.IVRPictures  replicate ddl
alter database replication definition TrialDb with primary at LogicalSRV.TrialDb  replicate ddl
alter database replication definition audit with primary at LogicalSRV.audit  replicate ddl
go

