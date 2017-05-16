SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_program_c.planned_end_on' ELSE 'SUCCESS' END as Message
 FROM weillcornell_mdsdb.u_project_group_owners_final SRC
 LEFT JOIN weillcornell_mdwdb.d_accountable_division_c TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( convert_tz(SRC.sys_created_on,'GMT','America/New_York'),'%Y%m%d')  <> TRGT.created_on;
