SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
SELECT count(1) as cnt 
FROM gilead_mdsdb.incident_final SRC 
JOIN gilead_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CONVERT_TZ(SRC.u_on_hold_until,'GMT','America/New_York') <> TRGT.on_hold_until_c
)a;


