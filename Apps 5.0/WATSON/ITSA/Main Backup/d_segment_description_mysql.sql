SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
watson_mdwdb.d_segment_c a 
JOIN watson_mdsdb.u_segment_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 


where
a.description <> b.u_description;