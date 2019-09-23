SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select count(1) cnt FROM
                mcdonalds_mdsdb.sys_attachment_final sys 
				join mcdonalds_mdwdb.d_sys_attachment_c d on sys.sys_id=d.row_id
join mcdonalds_mdwdb.f_sys_attachment_c f on f.sys_attachment_c_key=d.row_key
WHERE  sys.table_name <> 'sys_email' and  coalesce(d.row_key,case when sys.sys_id is null then 0 else -1 end)<>sys_attachment_c_key
                   )a
				   
				   
				