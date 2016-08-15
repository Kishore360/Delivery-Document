SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nypres_mdsdb.problem_final a
join nypres_mdwdb.f_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where u_number_of_incidents <>number_of_incidents

