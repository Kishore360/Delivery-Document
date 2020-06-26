SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
watson_mdwdb.d_segment_c a 
JOIN watson_mdsdb.u_segment_final b
left join watson_mdwdb.d_lov d on u_type=d.row_id and dimension_class ='TYPE~SEGMENT'
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 


where
a.segment_type_c_key <> coalesce(d.row_key,case when b.u_type is null then 0 else -1 end);


