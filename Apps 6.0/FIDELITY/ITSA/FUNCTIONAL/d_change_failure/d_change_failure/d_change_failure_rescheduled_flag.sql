SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.rescheduled_flag' ELSE 'SUCCESS' END as Message
from (SELECT * FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT join fidelity_mdwdb.f_change_request F
 on F.change_request_key = TRGT.row_key
WHERE (CASE WHEN F.reschedule_count>0 THEN 'Y' ELSE 'N' END) <> TRGT.rescheduled_flag;