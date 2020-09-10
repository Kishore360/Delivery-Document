SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.cbi_inc_causd_by_chng_flag_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.problem_final SRC
JOIN ntrust_mdwdb.d_problem TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
LEFT JOIN 
(select case when (b11.incident_cbi_c_key>0 and b11.caused_by_change_flag='Y') then 'Y' else 'N' end  as chg,TRGT2.row_key,TRGT2.problem_number
from ntrust_mdsdb.problem_final SRC
JOIN ntrust_mdwdb.d_problem TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
left join ntrust_mdsdb.incident_final inc on SRC.sys_id=inc.problem_id
left join ntrust_mdwdb.d_incident b11 on b11.row_id=inc.sys_id and inc.sourceinstance=b11.source_id
where incident_cbi_c_key>0 and caused_by_change_flag='Y' ) LKP
ON TRGT2.row_key=LKP.row_key
where LKP.chg <> TRGT2.cbi_inc_causd_by_chng_flag_c and SRC.cdctype='X') temp;