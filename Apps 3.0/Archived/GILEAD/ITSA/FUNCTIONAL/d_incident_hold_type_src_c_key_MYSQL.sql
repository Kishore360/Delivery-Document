SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
SELECT count(1) as cnt 
FROM gilead_mdsdb.incident_final SRC
JOIN gilead_mdwdb.d_incident TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN gilead_mdwdb.d_lov LOV ON 
COALESCE(CONCAT('U_HOLD_TYPE_C','~','TASK','~~~',UPPER(SRC.u_hold_type)),'UNSPECIFIED')=LOV.row_id
WHERE LOV.row_key<>TRGT.hold_type_src_c_key
)temp;