
SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for f_macm_c_deploy_approver_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC
JOIN mcdonalds_mdwdb.f_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
LEFT JOIN mcdonalds_mdwdb.d_internal_contact LKP
ON(concat('INTERNAL_CONTACT~',SRC.u_deploy_approver)= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_deploy_approver IS NULL THEN 0 else -1 end)<>TRGT.deploy_approver_key
)a;
