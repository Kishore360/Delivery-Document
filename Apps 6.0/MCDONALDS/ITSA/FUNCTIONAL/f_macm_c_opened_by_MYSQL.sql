




SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for f_macm_c_opened_by' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC
JOIN mcdonalds_mdwdb.f_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN mcdonalds_mdwdb.d_internal_contact LKP
ON(concat('INTERNAL_CONTACT~',SRC.opened_by )= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
AND COALESCE(CONVERT_TZ (SRC.opened_at,'GMT','US/Central'), 
CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','US/Central'),'UNSPECIFIED') 
BETWEEN effective_from AND effective_to
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<>TRGT.opened_by_key
)a;
