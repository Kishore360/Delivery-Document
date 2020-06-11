SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_iteration.row_count' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src from (select 
CASE WHEN LENGTH(iteration.path) - LENGTH(REPLACE(iteration.path, char(92), ''))=2 
THEN CONCAT(iteration.id+1,'~',proj.organizationKey) 
ELSE   CONCAT(iteration.id,'~',proj.organizationKey) 
END AS sys_id,
iteration.sourceinstance as sourceinstance,
iteration.name as Iname,
iteration.startDate as startdate,
iteration.finishDate as finishdate,
iteration.structureType as timeFrame,
iteration.path as path,
iteration.cdctype as cdctype
from #MDS_TABLE_SCHEMA.azure_iteration_final iteration 
left join #MDS_TABLE_SCHEMA.azure_project_final proj 
on iteration.projectKey = proj.__numerify__primary_key and iteration.sourceinstance = proj.sourceinstance
where iteration.cdctype<>'D') SRC) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.d_iteration TRGT 
 join (select * from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Azure_Tenant' and soft_deleted_flag <> 'Y') ODF on ODF.source_id = TRGT.source_id
 where TRGT.row_key not in (0, -1) and TRGT.soft_deleted_flag <> 'Y') count_trgt
 
 where count_src.count_src <> count_trgt.count_trgt
 )SQ;
