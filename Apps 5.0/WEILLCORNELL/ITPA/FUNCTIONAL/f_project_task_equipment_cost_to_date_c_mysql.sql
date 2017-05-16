SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.target_go_live_date_c' ELSE 'SUCCESS' END as Message
 FROM weillcornell_mdsdb.pm_project_final SRC
 LEFT JOIN weillcornell_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE SRC.u_one_time_equipment_costs_to_date  <> TRGT.equipment_cost_to_date_c;
