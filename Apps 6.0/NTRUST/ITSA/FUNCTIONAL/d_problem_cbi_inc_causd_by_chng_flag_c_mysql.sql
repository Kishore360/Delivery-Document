


SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.problem_final SRC
LEFT JOIN ntrust_mdwdb.d_problem TRGT2 ON (SRC.number=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
left join ntrust_mdwdb.d_incident inc on TRGT2.row_id=inc.problem_id
where case when inc.caused_by_change_flag='Y' then 'Y' else 'N' end <> TRGT2.inc_causd_by_chng_flag_c and SRC.cdctype='X') temp;
