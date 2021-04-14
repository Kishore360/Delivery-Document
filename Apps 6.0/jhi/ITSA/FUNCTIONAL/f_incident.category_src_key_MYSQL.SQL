SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.category_src_key' ELSE 'SUCCESS' END as Message 
FROM  
(
select count(1) as cnt   
FROM jhi_mdsdb.incident_final SRC 
LEFT JOIN jhi_mdwdb.f_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN jhi_mdwdb.d_lov LKP ON concat('CATEGORY~INCIDENT~',upper(SRC.category ))=LKP.src_rowid AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.category IS NULL THEN 0 ELSE -1 END)<>TRGT.category_src_key
) temp;


