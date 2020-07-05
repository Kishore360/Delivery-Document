SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
(select count(1) cnt from 
-- select a.row_id , b.sys_id, u_type,d.row_id,coalesce(a.segment_type_c_key,0) , coalesce(d.row_key,case when b.u_type is null then 0 else -1 end)  from 
ibmwatson_mdwdb.d_segment_c a 
JOIN ibmwatson_mdsdb.u_segment_final b on  a.row_id = b.sys_id and a.source_id = b.sourceinstance
left join ibmwatson_mdwdb.d_lov d on concat('TYPE~SEGMENT~',u_type)=d.row_id and dimension_class ='TYPE~SEGMENT'
 where
coalesce(a.segment_type_c_key,0) <> coalesce(d.row_key,case when b.u_type is null then 0 else -1 end))a;


