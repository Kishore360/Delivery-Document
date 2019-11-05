SELECT 
CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT>0 THEN 'MDS to DWH data Validation failed for d_problem_taks_over_due_flag' ELSE 'SUCCESS' END AS MESSAGE
FROM ( select count(1) cnt  from  whirlpool_mdsdb.sys_user_final
left join whirlpool_mdwdb.d_internal_contact on concat('INTERNAL_CONTACT~',sys_id)=row_id and sourceinstance=source_id
where coalesce(convert_tz(u_employee_termination_date,'GMT','America/New_York'),'-99')<>coalesce(emp_termination_date_c,'-99')
and sys_user_final.cdctype<>'D')a;


