

SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.problem_final SRC
LEFT JOIN ntrust_mdwdb.d_problem TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
left join ntrust_mdsdb.incident_final inc on SRC.sys_id=inc.problem_id
left join ntrust_mdwdb.d_incident b11 on b11.row_id=inc.sys_id and inc.sourceinstance=b11.source_id

where case when incident_cbi_c_key>0 then coalesce(inc.number,'UNSPECIFIED') else 'UNSPECIFIED' end <> TRGT2.prblm_linked_cbi_inc_nmbr_c and SRC.cdctype='X') temp;

