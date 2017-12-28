SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
SELECT count(1) as cnt 
FROM gilead_mdsdb.incident_final SRC 
JOIN gilead_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE SRC.u_on_hold_count <> TRGT.on_hold_count_c
)a;