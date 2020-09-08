	




SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.incident_final SRC
LEFT JOIN ntrust_mdwdb.d_incident TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
where 
case when incident_final.u_emea=TRUE Then 'Y' when SRC.u_emea=FALSE Then 'N' else 'X' end <> TRGT2.u_emea_c and SRC.cdctype='X') temp;



