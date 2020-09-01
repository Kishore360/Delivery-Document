SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_application_availability_c.mean_time_to_identify_c' ELSE 'SUCCESS' END as Message 
from discover_mdsdb.problem_final src
inner join discover_mdwdb.f_problem fact
on src.sys_id=fact.row_id and src.sourceinstance=fact.source_id
inner join discover_mdwdb.f_application_availability_c tgt
on fact.problem_key=tgt.problem_key
where fact.mean_time_to_identify_c <>tgt.mean_time_to_identify_c;