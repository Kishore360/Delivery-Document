SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.inci_to_prob_closed_duration_c' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.problem_final SRC1
 left join (select problem_id,sourceinstance,min(opened_at) as opened_on
from bbandt_mdsdb.incident_final group by 1,2) SRC2
 on (SRC1.sys_id=SRC2.problem_id and SRC1.sourceinstance = SRC2.sourceinstance)
 LEFT JOIN bbandt_mdwdb.f_problem TRGT 
 ON (SRC1.sys_id =TRGT.row_id  
 AND SRC1.sourceinstance= TRGT.source_id)
WHERE  (case when SRC2.opened_on is null or SRC1.closed_at is null then 0 when timestampdiff(second,SRC2.opened_on,SRC1.closed_at) < 0 then 0 else timestampdiff(second,SRC2.opened_on,SRC1.closed_at) end )<>  (TRGT.inci_to_prob_closed_duration_c) 