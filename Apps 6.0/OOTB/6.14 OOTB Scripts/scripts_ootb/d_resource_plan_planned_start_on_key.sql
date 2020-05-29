SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_resource_plan.planned_start_on_key' ELSE 'SUCCESS' END as Message
 FROM itca_3_6_mdsdb.resource_plan_final SRC 
 LEFT JOIN itca_3_6_mdwdb.d_resource_plan TRGT 
 ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN itca_3_6_mdwdb.d_calendar_date D
 on (D.row_id  = date_format(SRC.start_date,'%Y%m%d') and D.source_id  = 0)
 WHERE COALESCE(D.row_key,case when SRC.start_date is null then '' else '' end)<> COALESCE(TRGT.planned_start_on_key ,'');