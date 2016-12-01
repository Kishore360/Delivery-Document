 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request.short_description' ELSE 'SUCCESS' END as Message
 FROM (
 select count(1)as cnt from netflix_mdsdb.u_vending_machine_final p
 join netflix_mdwdb.f_vending_machine_c f on sys_id=f.row_id and sourceinstance=f.source_id
where 

    ROUND(p.u_cost, 4) <> cost_c or 
	p.u_number <>  number_c or
	p.u_type <> type_c or
	p.u_slot <> slot_c or
	CONVERT_TZ(p.u_transaction_date,'GMT','America/Los_Angeles') <> transaction_date_c
	)b
	
	
	