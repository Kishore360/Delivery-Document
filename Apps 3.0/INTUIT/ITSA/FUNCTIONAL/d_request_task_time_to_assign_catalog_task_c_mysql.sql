 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from intuit_mdwdb.d_request_task a
LEFT JOIN intuit_mdsdb.sys_audit_final b ON a.row_id = b.documentkey
	AND b.tablename='sc_task'
	AND b.fieldname='assgined_to'
	AND b.oldvalue IS NULL
where  a.time_to_assign_catalog_task_c<> COALESCE(CONVERT_TZ(b.sys_created_on,'GMT' ,'America/Los_Angeles'),a.created_on))b;