

SELECT 
CASE WHEN CNT >0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0  THEN 'MDS to DWH data validation failed for d_change_failure_c.reschedule_count' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT 
FROM mcdonalds_mdsdb.change_request_final SRC
LEFT JOIN 
(
SELECT sys_audit.sys_id AS row_id,sys_audit.sourceinstance AS sourceinstance,
sys_audit.documentkey AS documentkey ,
COUNT(sys_audit.sys_id) AS cnt  
FROM mcdonalds_mdsdb.sys_audit_final sys_audit
WHERE (sys_audit.fieldname='end_date' and sys_audit.tablename='change_request' and sys_audit.oldvalue is not null and cdctype<>'D')
group by 1,2,3) SRC1 ON SRC.sys_id=SRC1.documentkey AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN mcdonalds_mdwdb.f_change_request_failure_adv_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.cnt,' ')<>TRGT.reschedule_count
AND SRC.CDCTYPE<>'D'

) temp;




