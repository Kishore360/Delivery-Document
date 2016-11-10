SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 

(select b.u_req_type as reqeust_type,b.sys_id,sourceinstance from tivo_mdsdb.u_tech_ops_request_final b where sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union
select u_request_type as reqeust_type ,b.sys_id,sourceinstance from tivo_mdsdb.sc_req_item_final b) a 

join tivo_mdwdb.f_request f on a.sys_id=f.row_id and a.sourceinstance=f.source_id
join tivo_mdwdb.d_lov d on CONCAT('REQUEST_CLASS_C~REQUEST~~~',UPPER(a.reqeust_type))=src_rowid 
and sourceinstance=f.source_id

where 
f.request_type_src_c_key<>COALESCE(d.row_key,case when a.reqeust_type is null then 0 else -1 end)
