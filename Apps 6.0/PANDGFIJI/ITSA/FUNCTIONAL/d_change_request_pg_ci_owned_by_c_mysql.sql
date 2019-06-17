SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.pg_ci_owned_by_c' ELSE 'SUCCESS' END as Message 
FROM 
(SELECT Count(1) as CNT 
from png_mdsdb.change_request_final  a 
LEFT JOIN png_mdwdb.d_internal_contact b on coalesce(CONCAT('INTERNAL_CONTACT~',a.u_pg_ci_owned_by),'UNSPECIFIED') =b.row_id
JOIN png_mdwdb.d_change_request c ON a.sys_id=c.row_id AND a.sourceinstance=c.source_id
WHERE COALESCE(b.row_id,CASE WHEN a.u_pg_ci_owned_by IS NULL THEN 'UNSPECIIFED' ELSE 'UNKNOWN' END)<>c.pg_ci_owned_by_c
AND a.CDCTYPE<>'D'
) temp;