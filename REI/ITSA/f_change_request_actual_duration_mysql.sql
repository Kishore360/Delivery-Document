SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as cnt
from rei_mdsdb.change_request_final a


left join rei_mdwdb.f_change_request b


on a.sys_id=b.row_id and


a.sourceinstance=b.source_id


where timestampdiff(second,a.u_work_start_date,a.u_qa_deployment_date)<>b.actual_duration) z ;