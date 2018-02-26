SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT > 0 THEN 'MDS to DW Data Validation Failed for Change_request_final.Requested_by' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM nbcu_mdsdb.change_request_final a
JOIN nbcu_mdwdb.f_change_request b ON a.sys_id=b.row_id AND a.sourceinstance=b.source_id
JOIN nbcu_mdwdb.d_internal_contact LKP ON (coalesce(concat('INTERNAL_CONTACT','~',a.requested_by),'UNSPECIFIED')=LKP.row_id AND a.sourceinstance=LKP.source_id)
WHERE coalesce(LKP.row_key,CASE WHEN a.requested_by IS NULl THEN 0 ELSE -1 END)<>b.requested_by_key
) temp; 



