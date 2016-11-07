SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
 FROM
rei_mdsdb.pm_project_final a


left join rei_mdwdb.d_calendar_date b


on b.row_id=date_format(convert_tz(a.start_date,'GMT','America/Los_Angeles'),'%Y%m%d')


left join rei_mdwdb.f_project_c c


on a.sys_id=c.row_id


where b.row_key<>c.project_planned_start_date_c_key
;