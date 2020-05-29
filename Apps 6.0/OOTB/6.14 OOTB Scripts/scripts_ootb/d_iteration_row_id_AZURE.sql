SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_iteration.row_id' ELSE 'SUCCESS' END as Message
/*select COALESCE(SRC.sys_id ,'') , COALESCE(TRGT.row_id,'') */
FROM (select 
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
where iteration.cdctype<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_iteration TRGT
ON SRC.sys_id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
where COALESCE(SRC.sys_id ,'') <> COALESCE(TRGT.row_id,'')


