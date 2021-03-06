SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM 
bhn_mdsdb.incident_final SRC 
JOIN bhn_mdwdb.d_incident TRGT 
ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id )
WHERE length(SRC.description)<=255 and COALESCE( SRC.description,'')<> COALESCE(TRGT.description ,'')

