
SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.dv_company_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
From ntt_om_mdsdb.change_request_final a 
LEFT JOIN ntt_om_mdwdb.d_change_request b ON a.sys_id=b.row_id AND a.sourceinstance=b.source_id
WHERE COALESCE(a.dv_company,'UNSPECIFIED')<>b.dv_company_c
AND a.cdctype='X'
) temp;


