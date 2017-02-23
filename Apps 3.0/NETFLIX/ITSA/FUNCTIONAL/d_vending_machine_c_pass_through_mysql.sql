 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request.short_description' ELSE 'SUCCESS' END as Message
 FROM (
 select count(1)as cnt from netflix_mdsdb.u_vending_machine_final p
 join netflix_mdwdb.d_vending_machine_c f on sys_id=f.row_id and sourceinstance=f.source_id
where 
	u_site<>site_c or
u_account<>account_c or
u_machine<>machine_c
	)b
	
	


	
	