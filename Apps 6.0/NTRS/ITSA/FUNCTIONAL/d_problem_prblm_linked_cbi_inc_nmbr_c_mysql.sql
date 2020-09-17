

SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.prblm_linked_cbi_inc_nmbr_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.problem_final SRC
JOIN ntrust_mdwdb.d_problem TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
LEFT JOIN 
(select group_concat(distinct b11.incident_number) as prb,TRGT2.row_key,TRGT2.problem_number
from ntrust_mdsdb.problem_final SRC
JOIN ntrust_mdwdb.d_problem TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
left join ntrust_mdsdb.incident_final inc on SRC.sys_id=inc.problem_id
left join ntrust_mdwdb.d_incident b11 on b11.row_id=inc.sys_id and inc.sourceinstance=b11.source_id
where incident_cbi_c_key>0 and caused_by_change_flag='Y' group by TRGT2.row_key,TRGT2.problem_number) LKP
ON TRGT2.row_key=LKP.row_key
where coalesce(LKP.prb,'UNSPECIFIED') <> TRGT2.prblm_linked_cbi_inc_nmbr_c and SRC.cdctype='X') temp;