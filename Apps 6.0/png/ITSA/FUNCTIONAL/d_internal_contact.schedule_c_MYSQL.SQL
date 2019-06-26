

SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.schedule_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.sys_user_final a 
LEFT JOIN png_mdsdb.cmn_schedule_final b ON a.schedule=b.sys_id AND a.sourceinstance=b.sourceinstance
LEFT JOIN png_mdwdb.d_internal_contact c ON (CONCAT('INTERNAL_CONTACT~',a.sys_id)=c.row_id AND a.sourceinstance=c.source_id)
WHERE coalesce(b.name,'UNSPECIFIED')<>c.schedule_c
) temp;



