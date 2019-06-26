



SELECT 
CASE WHEN CNT >0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0  THEN 'MDS to DWH data validation failed for d_change_failure_c.require_downtime' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT  Count(1) as CNT 
FROM mcdonalds_mdsdb.change_request_final SRC
LEFT JOIN mcdonalds_mdwdb.d_change_failure_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance =TRGT.source_id
WHERE (CASE 
WHEN SRC.u_downtime_required = 'y'
OR SRC.u_downtime_required = 'Y'
OR SRC.u_downtime_required = 'Yes'
OR SRC.u_downtime_required = 'YES'
OR SRC.u_downtime_required = '1' THEN 'Y'
WHEN SRC.u_downtime_required = 'n'
OR SRC.u_downtime_required = 'N'
OR SRC.u_downtime_required = 'No'
OR SRC.u_downtime_required = 'NO'
OR SRC.u_downtime_required = '0'
OR SRC.u_downtime_required IS NULL THEN 'N' ELSE 'N' END)<>TRGT.require_downtime
AND SRC.cdctype<>'D' AND TRGT.soft_deleted_flag<>'Y'
) temp;






