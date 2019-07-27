SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.rescheduled_flag' ELSE 'SUCCESS' END as Message
from (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM tjxco_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT join tjxco_mdwdb.f_change_request F
 on F.row_id = TRGT.row_id and 
   F.source_id=TRGT.source_id
WHERE (CASE WHEN F.reschedule_count>0 THEN 'Y' ELSE 'N' END) <> TRGT.rescheduled_flag;