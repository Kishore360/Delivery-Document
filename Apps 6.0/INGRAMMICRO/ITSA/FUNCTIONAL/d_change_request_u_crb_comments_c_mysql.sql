SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.u_crb_comments_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.u_change_request_v2_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE case when SRC.u_crb_comments='' then 'UNSPECIFIED' ELSE COALESCE(SRC.u_crb_comments,'UNSPECIFIED') END<>TRGT.u_crb_comments_c
AND SRC.cdctype='X' ) temp; 