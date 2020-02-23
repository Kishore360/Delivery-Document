SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.lead_time' ELSE 'SUCCESS' END as Message
from (SELECT sys_id,sourceinstance,sys_created_on,work_start,start_date FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT row_id,source_id,lead_time FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
where case when COALESCE(SRC.work_start,SRC.start_date)>SRC.sys_created_on and COALESCE(SRC.work_start,SRC.start_date) is not null THEN
TIMESTAMPDIFF(SECOND,SRC.sys_created_on,COALESCE(SRC.work_start,SRC.start_date)) ELSE -1 end <> coalesce(TRGT.lead_time,0) 

