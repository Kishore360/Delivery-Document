SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
watson_mdwdb.d_segment_c a 
JOIN watson_mdsdb.u_segment_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
LEFT join watson_mdwdb.d_internal_contact d
on d.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',b.u_general_manager),'UNSPECIFIED')

where
a.general_manager_c_key <> COALESCE(d.row_key,CASE WHEN b.u_general_manager IS NULL THEN 0 else -1 end);