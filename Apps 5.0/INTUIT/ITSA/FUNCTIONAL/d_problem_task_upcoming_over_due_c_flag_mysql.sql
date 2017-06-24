SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdwdb.d_problem_task a 
 inner join intuit_mdwdb.f_problem_task b on a.row_id=b.row_id and a.source_id=b.source_id 
where b.soft_deleted_flag='N' and a.upcoming_over_due_c_flag <>
case when a.due_on between (SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%') 
and date_add((SELECT MAX(lastupdated) AS lastupdated
FROM intuit_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),INTERVAL 7 DAY)  
and  b.state_src_code not in(3,4,7) then 'Y' else  'N' end
  )temp