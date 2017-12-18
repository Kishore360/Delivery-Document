SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_pulse_c.impact' ELSE 'SUCCESS' END as Message  
FROM 
(
select count(1) as cnt 
from aon_mdsdb.u_aon_pulse_final SRC
LEFT JOIN aon_mdwdb.d_pulse_c TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
WHERE CHAR_LENGTH(SRC.u_impact)<=4000 and SRC.u_impact <> TRGT.impact
)b;


