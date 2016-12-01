 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request.short_description' ELSE 'SUCCESS' END as Message
 FROM (
 select count(1)as cnt from netflix_mdsdb.u_vending_machine_final p
 join netflix_mdwdb.d_calendar_date d on COALESCE(DATE_FORMAT(CONVERT_TZ(p.u_transaction_date,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')=d.row_id
 join netflix_mdwdb.f_vending_machine_c f on sys_id=f.row_id and sourceinstance=f.source_id
where 
coalesce(d.row_key,case when u_transaction_date is null then 0 else -1 end )<>f.transaction_date_c_key)b

