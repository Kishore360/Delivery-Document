SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.target_go_live_date_c' ELSE 'SUCCESS' END as Message
 FROM weillcornell_mdsdb.pm_project_final SRC
 JOIN weillcornell_mdsdb.u_reporting_groups_final SRC1
 on SRC.sourceinstance=SRC1.sourceinstance 
 and SRC.u_reporting_groups=SRC1.sys_id
 LEFT JOIN weillcornell_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE (CASE WHEN SRC1.u_name='PMO Managed' then 'Y' else 'N' END ) <> TRGT.is_managed_by_pmo_c