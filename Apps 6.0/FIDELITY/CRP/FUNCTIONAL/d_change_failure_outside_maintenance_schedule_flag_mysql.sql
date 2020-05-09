SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.outside_maintenance_schedule_flag' ELSE 'SUCCESS' END as Message
from (SELECT sys_id,sourceinstance,outside_maintenance_schedule FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D'
  and coalesce(work_start,start_date,closed_at)>'2019-01-01'
                and u_environment='Production' ) SRC
left join (SELECT row_id,source_id,outside_maintenance_schedule_flag FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CASE WHEN  SRC.outside_maintenance_schedule= 1 THEN 'Y' ELSE 'N' END ,'')<> COALESCE(TRGT.outside_maintenance_schedule_flag ,'')
