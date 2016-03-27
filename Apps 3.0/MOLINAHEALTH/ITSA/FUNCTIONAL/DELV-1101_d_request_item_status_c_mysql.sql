SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select a.status_c src , CASE WHEN c.label = 'Active' OR c.label ='Pending-Info' OR c.label ='Pending-Date' OR c.label ='Pending-Change' then 'Fullfilment in Progress'
                     WHEN  c.label is not null and b.assigned_to is null then 'Pending Assignment'
                     WHEN c.label='Pending-Approval' then 'Pending Approval' end trgt
					  
from molinahealth_mdsdb.sc_req_item_final b
left join molinahealth_mdsdb.sys_choice_final c
on b.state=c.value and b.sourceinstance=c.sourceinstance 
left join molinahealth_mdwdb.d_request_item a on  
a.row_id=b.sys_id and a.source_id=b.sourceinstance
where c.name='sc_req_item' and c.element='state'
)
where src<>trgt