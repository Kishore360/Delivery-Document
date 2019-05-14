SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.department_code' ELSE 'SUCCESS' END as Message 
-- select SRC.resourceid,sourceinstance,department0,SRC.resourceid,TRGT.row_id,COALESCE(SRC.department0,'UNSPECIFIED'),TRGT.department_code 
FROM schneider_mdsdb.v_r_user_final SRC 
JOIN schneider_mdwdb.d_internal_contact TRGT 
ON coalesce(concat('INTERNAL_CONTACT~',SRC.resourceid),'UNSPECIFIED')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.department0,'UNSPECIFIED') <> (TRGT.department_code) ;