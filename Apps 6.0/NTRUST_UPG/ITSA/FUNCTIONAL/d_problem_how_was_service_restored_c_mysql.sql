

SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.problem_final SRC
LEFT JOIN ntrust_mdwdb.d_problem TRGT2 ON (SRC.number=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
left join ntrust_mdwdb.d_incident inc on TRGT2.row_id=inc.u_cbi_incident
where case when inc.u_cbi_incident is not null then inc.number else 'UNSPCIFIED' end <> TRGT2.how_was_service_restored_c and SRC.cdctype='X') temp;


