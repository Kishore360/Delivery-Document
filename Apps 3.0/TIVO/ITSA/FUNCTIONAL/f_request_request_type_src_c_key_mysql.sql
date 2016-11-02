
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
 tivo_mdsdb.sc_request_final
join tivo_mdwdb.d_request on CONCAT('REQUEST_TYPE_C~REQUEST~~~',UPPER(b.reqeust_type))=row_id and sourceinstance=source_id
join tivo_mdwdb.f_request f on sys_id=row_id and sourceinstance=source_id
where 
a.request_type_src_c_key<>COALESCE(d.row_key,case when reqeust_type is null then 0 else -1 end)

