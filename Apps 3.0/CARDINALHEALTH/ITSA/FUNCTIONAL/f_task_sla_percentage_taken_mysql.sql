

	  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_sla.percentage_taken' ELSE 'SUCCESS' END as Message from 
cardinalhealth_mdsdb.task_sla_final tsd 
join cardinalhealth_mdwdb.f_task_sla a on a.row_id=tsd.sys_id and a.source_id=tsd.sourceinstance
where 
	CASE 	
							WHEN tsd.percentage < -99999999.99 THEN -99999999.99 
							WHEN tsd.percentage > 99999999.99 THEN 99999999.99 
						ELSE percentage_taken 
						END <> coalesce(a.percentage_taken,0)
						
						