SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.class_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM keybank_mdsdb.change_request_final SRC 
left join keybank_mdsdb.cmdb_ci_final cmdb_ci on cmdb_ci.sys_id=SRC.cmdb_ci
LEFT JOIN keybankcrp_mdwdb.d_change_failure TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE coalesce(cmdb_ci.sys_class_name,'UNSPECIFIED')<>TRGT.class_c
AND SRC.cdctype='X' ) temp;