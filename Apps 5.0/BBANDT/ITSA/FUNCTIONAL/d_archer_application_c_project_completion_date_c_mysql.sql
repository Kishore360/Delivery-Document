select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_archer_application_c.project_completion_date_c'  ELSE 'SUCCESS'  END as Message
from bbandt_mdwdb.d_archer_application_ext_c a
join bbandt_mdwdb.d_archer_application_c b
on a.row_id=b.row_id 
where a.project_completion_date_c<>b.project_completion_date_c;