SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select count(1) cnt FROM
                mcdonalds_mdsdb.sys_attachment_final sys 
				join mcdonalds_mdwdb.d_macm_c d on  sys.table_sys_id=d.row_id and sys.sourceinstance=d.source_id
join mcdonalds_mdwdb.f_sys_attachment_c f on f.row_id=sys.sys_id and sys.sourceinstance=f.source_id
WHERE sys.table_name = 'x_scafe_mcdcr_chan_mcdcr_change_request' and sys.table_name <> 'sys_email' and  
coalesce(d.row_key,case when sys.sys_id is null then 0 else -1 end)<>macm_c_key

                   )a
				   
				   