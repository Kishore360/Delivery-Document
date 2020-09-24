SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.prb_rfc_chng_num_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.change_request_final SRC
LEFT JOIN ntrust_mdwdb.d_change_request TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
INNER JOIN
        ntrust_mdwdb.f_change_request f_change_request 
            ON TRGT2.row_key=f_change_request.change_request_key  
    LEFT OUTER JOIN
        ntrust_mdwdb.f_incident f_incident 
            ON f_change_request.change_request_key=f_incident.caused_by_change_key  
    LEFT OUTER JOIN
        ntrust_mdwdb.d_incident d_incident 
            ON f_incident.incident_key=d_incident.row_key  
    LEFT OUTER JOIN
        ntrust_mdwdb.f_problem f_problem 
            ON f_incident.problem_key=f_problem.problem_key  
    LEFT OUTER JOIN
        ntrust_mdwdb.d_change_request Chng 
            ON f_problem.change_request_key=Chng.row_key  
where coalesce(Chng.change_request_number,'UNSPECIFIED') <> TRGT2.prb_rfc_chng_num_c and SRC.cdctype='X') temp;
