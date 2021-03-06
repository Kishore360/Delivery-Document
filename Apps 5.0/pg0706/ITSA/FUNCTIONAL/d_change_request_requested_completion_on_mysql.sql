SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.requested_completion_on' ELSE 'SUCCESS' END as Message
FROM 
(SELECT Count(1) as CNT 
FROM png_mdsdb.change_request_final a
JOIN png_mdwdb.d_change_request b on a.sys_id=b.row_id and a.sourceinstance=b.source_id
WHERE convert_tz(a.requested_by_date,'GMT','America/New_York')<> b.requested_completion_on
AND a.cdctype<>'D'
) temp;



