SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as CNT
from   (select * from <<tenant>>_mdsdb.task_sla_final where cdctype<>'D')tsd
join <<tenant>>_mdwdb.f_task_sla a on a.row_id=tsd.sys_id and a.source_id=tsd.sourceinstance
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)	
where (tsd.cdctime<=f1.lastupdated) and 
	  tsd.Percentage <> PERCENTAGE_TAKEN)temp;
	  
	  
	  