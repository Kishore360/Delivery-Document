
select (case when count(1)=0 then 'SUCCESS' else 'FAILURE' end) dataValidation from (
select (case when 
d.major_problem_on_c_key= CASE WHEN fs.u_major_problem_date is null THEN 0 ELSE coalesce(c.row_key ,-1)END
then 'SUCCESS' else 'FAILURE' end) result from 
rambus_mdwdb.f_problem d
 INNER JOIN rambus_mdsdb.problem_final fs 
ON d.row_id=fs.sys_id
 AND d.source_id=fs.sourceinstance
 LEFT OUTER JOIN rambus_mdwdb.d_calendar_date c 
ON c.row_id=DATE_FORMAT(CONVERT_TZ(fs.u_major_problem_date,'GMT','America/Los_Angeles'),'%Y%m%d')
  ) res where res.result = 'FAILURE';
 