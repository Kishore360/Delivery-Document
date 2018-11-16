SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.lead_time' ELSE 'SUCCESS' END as Message
from (SELECT * FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
where case when COALESCE(SRC.work_start,SRC.start_date)>SRC.sys_created_on and COALESCE(SRC.work_start,SRC.start_date) is not null THEN
TIMESTAMPDIFF(SECOND,SRC.sys_created_on,COALESCE(SRC.work_start,SRC.start_date)) ELSE 0 end <> TRGT.lead_time 

