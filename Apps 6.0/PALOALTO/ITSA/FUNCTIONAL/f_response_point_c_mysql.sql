SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
pan6_mdwdb.f_response f
join pan6_mdsdb.asmt_assessment_instance_question_final a
on f.row_id=a.sys_id and f.source_id=a.sourceinstance
where f.point_c <> a.value