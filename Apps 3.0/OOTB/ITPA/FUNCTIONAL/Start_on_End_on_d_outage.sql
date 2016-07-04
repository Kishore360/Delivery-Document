select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'START_ON, END_ON validation failed for d_outage' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.d_outage TGT
left join <<tenant>>_mdsdb.cmdb_ci_outage_final SRC
on TGT.row_id = SRC.sys_id
JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance   = L.sourceid )
where TGT.START_ON<>convert_tz(SRC.BEGIN,source_time_zone,target_time_zone)
and TGT.END_ON<>convert_tz(SRC.END,source_time_zone,target_time_zone); 
