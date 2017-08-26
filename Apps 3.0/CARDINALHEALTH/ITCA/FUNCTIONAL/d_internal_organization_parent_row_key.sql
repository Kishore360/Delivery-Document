
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.parent_row_key' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.us_d_department_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_internal_organization TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN cardinalhealth_mdwdb. LKP 
	ON ( CONCAT('DEPARTMENT~',PARENT_ROW_ID) = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.parent_row_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.parent_row_key ,'')
