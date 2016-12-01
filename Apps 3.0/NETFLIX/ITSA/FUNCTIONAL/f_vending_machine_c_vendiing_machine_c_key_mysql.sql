 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request.short_description' ELSE 'SUCCESS' END as Message
 FROM (
 select count(1)as cnt from netflix_mdsdb.u_vending_machine_final p
 join netflix_mdwdb.d_vending_machine_c d on COALESCE(p.u_machine,'UNSPECIFIED')=d.row_id
 join netflix_mdwdb.f_vending_machine_c f on sys_id=f.row_id and sourceinstance=f.source_id
where 
coalesce(d.row_key,case when u_machine is null then 0 else -1 end )<>f.vendiing_machine_c_key)b

