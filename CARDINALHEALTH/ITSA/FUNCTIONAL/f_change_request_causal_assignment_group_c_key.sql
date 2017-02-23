 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem.opened_by_department_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
  FROM    cardinalhealth_mdsdb.change_request_final su 
 LEFT JOIN (
select a.rfc,SourceInstance,u_causal_assignment_group 
from  cardinalhealth_mdsdb.problem_final a
join (select rfc,max(sys_created_on) as sys_created_on
from cardinalhealth_mdsdb.problem_final
group by 1)temp on a.rfc = temp.rfc
and a.sys_created_on = temp.sys_created_on ) p 
ON p.rfc=su.sys_id AND p.SourceInstance=su.SourceInstance
 left join cardinalhealth_mdwdb.d_internal_organization c 
on concat('GROUP~',left(p.u_causal_assignment_group,32))=c.row_id 
 AND c.source_id =  p.sourceinstance  
 left join cardinalhealth_mdwdb.f_change_request a on a.row_id =su.sys_id 
and a.source_id =su.sourceinstance 
 where  coalesce(c.row_key,case when p.u_causal_assignment_group is null then 0 else -1  end )
<> a.causal_assignment_group_c_key)temp;
