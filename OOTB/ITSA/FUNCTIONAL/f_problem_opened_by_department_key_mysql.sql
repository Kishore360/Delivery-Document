 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.problem_final p 
 LEFT JOIN <<tenant>>_mdsdb.sys_user_final su 
ON p.opened_by=su.sys_id AND p.SourceInstance=su.SourceInstance
 left join <<tenant>>_mdwdb.d_internal_organization c 
on concat('DEPARTMENT~',su.DEPARTMENT)=c.row_id 
 AND c.source_id =  p.sourceinstance  
 left join <<tenant>>_mdwdb.f_problem a on a.row_id =p.sys_id 
and a.source_id =p.sourceinstance 
 where  coalesce(c.row_key,case when su.DEPARTMENT is null then 0 else -1  end )
<> a.opened_by_department_key AND DATE_FORMAT(a.pivot_date, '%Y-%m-%d %H:%i:%s') 
 BETWEEN effective_from AND effective_to