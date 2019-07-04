SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary_aux_dept_loc_cc' ELSE 'SUCCESS' END as Message
from  meritsa_mdwdb.d_change_request d
JOIN meritsa_mdsdb.change_request_final f
on d.row_id =f.sys_id and d.source_id=f.sourceinstance and f.cdctype<>'D'
where  CASE WHEN (f.CLOSED_AT > f.END_DATE) THEN 'Y' ELSE 'N' END <>  d.not_on_time_flag