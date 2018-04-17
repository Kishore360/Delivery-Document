 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.language_src_c_key
' ELSE 'SUCCESS' END as Message  
 FROM (select count(1) as cnt from aon_mdsdb.incident_final src 
join aon_mdwdb.d_incident d 
on src.sys_id=d.row_id and src.sourceinstance=d.source_id
join aon_mdwdb.d_lov lov
on concat('LANGUAGE_C~TASK~~~',src.u_language) = lov.row_id and src.sourceinstance=d.source_id
where lov.row_key=d.language_src_c_key)a;