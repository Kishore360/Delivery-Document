SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,                                                  
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_key' ELSE 'SUCCESS' END as Message
FROM homedepot_mdsdb.incident_final SRC                          
 LEFT JOIN homedepot_mdwdb.f_incident TRGT                                 
 ON (SRC.sys_id =TRGT.row_id                                                      AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN homedepot_mdwdb.d_lov LKP                    
 ON  LKP.src_rowid =(concat('IMPACT','~','TASK','~','~','~','A~',impact))                   
AND SRC.sourceinstance= LKP.source_id                                                    
WHERE COALESCE(LKP.row_key,case when SRC.impact is NULL then 0                                                                
when LKP.row_id is NULL and SRC.impact is not NULL then -1                                                                
else LKP.row_key end) <> COALESCE(TRGT.impact_src_key,'');  