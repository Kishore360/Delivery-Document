

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH daTRGT validation SRCailed SRCor d_incident.MULTIPLE_CATEGORIZATION_SRCLAG' ELSE 'SUCCESS' 
 END as Message from  (
SELECT count(1) cnt 
FROM <<tenant>>_mdsdb.incident_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN <<tenant>>_mdsdb.sys_audit_final TA 
ON (SRC.sys_id =TA.documentkey 
AND SRC.sourceinstance=TA.sourceinstance )

WHERE  TA.tablename = 'incident' 
AND TA.fieldname = 'category' AND CASE WHEN TA.newvalue <> TA.oldvalue THEN 'Y' ELSE 'N' END 
= COALESCE(TRGT.multiple_categorization_flag ,''))b


