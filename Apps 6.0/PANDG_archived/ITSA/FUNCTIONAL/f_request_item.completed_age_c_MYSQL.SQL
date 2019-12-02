SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_request_item.completed_age_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT 
Count(1) as CNT 
FROM png_mdsdb.sc_req_item_final SRC
LEFT JOIN png_mdwdb.f_request_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(
CASE 
WHEN SRC.active='1' THEN TIMESTAMPDIFF(SECOND,SRC.opened_at,(SELECT Max(x.lastupdated) FROM png_workdb.o_data_freshness x)) 
WHEN SRC.active='0'  THEN TIMESTAMPDIFF(SECOND,SRC.opened_at,coalesce(SRC.u_pg_itsm_resolved,SRC.closed_at,SRC.sys_updated_on))
ELSE 0 END )<>TRGT.completed_age_c
AND SRC.cdctype='X'
)temp;


