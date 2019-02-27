



SELECT 
CASE WHEN CNT >0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0  THEN 'MDS to DWH data validation failed for d_change_failure_c.lead_time' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT  Count(1) as CNT 
FROM mcdonalds_mdsdb.change_request_final SRC
LEFT JOIN mcdonalds_mdwdb.d_change_failure_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance =TRGT.source_id
WHERE 
(CASE 
WHEN (SRC.work_start is null and SRC.start_date is null) or SRC.sys_created_on is null then 0                      
WHEN COALESCE(SRC.work_start,SRC.start_date)  >  SRC.sys_created_on then 
TIMESTAMPDIFF(SECOND,SRC.sys_created_on,COALESCE(SRC.work_start,SRC.start_date)) else 0 end)<>TRGT.lead_time
AND SRC.cdctype<>'D' 
) temp;




