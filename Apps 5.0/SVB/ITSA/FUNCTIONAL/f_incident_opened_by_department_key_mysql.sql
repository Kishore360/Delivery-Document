SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM svb_mdwdb.f_incident f
left join svb_mdwdb.d_internal_contact d on f.opened_by_key = d.row_key
left join svb_mdwdb.d_internal_organization d2 on d2.row_id = COALESCE(concat('DEPARTMENT~',d.department_code),'UNSPECIFIED') and  f.opened_by_department_key != COALESCE(d2.row_key,-1)
and d.source_id=d2.source_id
 WHERE if (COALESCE (d.department_code, 'UNSPECIFIED') = ('UNSPECIFIED'),0, d2.row_key)<> f.opened_by_department_key  )a