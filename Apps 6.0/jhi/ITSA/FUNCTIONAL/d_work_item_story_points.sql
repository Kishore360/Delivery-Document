SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_item.story_points' ELSE 'SUCCESS' END as Message 
FROM jhi_mdsdb.issue_ext_final SRC    
JOIN jhi_mdwdb.d_work_item TRGT ON (SRC.record_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE  CASE WHEN  ASCII(SRC.customfield_10200)>=48 
AND ASCII(SRC.customfield_10200)<=57 THEN CAST(SRC.customfield_10200 AS DECIMAL(28,10))  
ELSE NULL END <> (TRGT.story_points) 
and SRC.cdctype='X'
