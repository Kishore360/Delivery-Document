SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.cpu_core_count_c' ELSE 'SUCCESS' END as Message 
FROM truist_mdwdb.d_configuration_item trgt
JOIN truist_mdsdb.cmdb_ci_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
join
truist_mdwdb.d_location lkp
on  coalesce(src.location,'UNSPECIFIED') = lkp.row_id and src.sourceinstance = lkp.source_id
WHERE trgt.soft_deleted_flag='N' 
and  coalesce(lkp.row_key,case when src.location is null then 0 else -1 end ) <>trgt.location_key  