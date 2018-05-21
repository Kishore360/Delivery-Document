SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as 
Message  
FROM (SELECT count(1) as CNT FROM 
from (select * from <<tenant>>_mdsdb.task_sla_final where cdctype<>'D') tsd 
join <<tenant>>_mdwdb.f_task_sla a on a.row_id=tsd.sys_id and a.source_id=tsd.sourceinstance
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (task_sla.cdctime<=f1.lastupdated) and actual_duration<>
	CASE WHEN tsd.duration is null  THEN NULL
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',tsd.duration) < 0 THEN NULL
	  WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',tsd.duration) > 214748364 THEN NULL 
	  ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',tsd.duration) end)temp;
	  
	  
