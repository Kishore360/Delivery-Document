
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_failure.count_of_affected_ci_classes' ELSE 'SUCCESS' END as Message
from (SELECT sys_id,sourceinstance FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D'
  and coalesce(work_start,start_date,closed_at)>'2019-01-01'
                and u_environment='Production' ) SRC
left join (SELECT row_id,source_id,count_of_affected_ci_classes FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
 LEFT JOIN 
(select src1.task, src1.sourceinstance, count(distinct ci.class) as no_of_task_ci_classes
 from (select sys_id,sourceinstance FROM fidelity_mdsdb.task_ci_final where task is not null) src1
 left outer join fidelity_mdwdb.d_configuration_item ci
on  ci.row_id = src1.ci_item and 
ci.source_id = src1.sourceinstance 
group by src1.task, src1.sourceinstance
) task_ci 
 ON (task_ci.task = SRC.sys_id
 AND SRC.sourceinstance = task_ci.sourceinstance )
 WHERE COALESCE(task_ci.no_of_task_ci_classes,0)<> COALESCE(TRGT.count_of_affected_ci_classes,'')
