 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from svb_mdsdb.sc_item_option_final qa  
inner join  svb_mdsdb.sc_item_option_mtom_final b 
on qa.sys_id=b.sc_item_option and qa.sourceinstance = b.sourceinstance 
 left  JOIN  svb_mdwdb.f_request_item_variable_c c
on  c.ROW_ID = concat(qa.sys_id,'~',b.request_item) and qa.sourceinstance=c.source_id
where  qa.sys_created_on<>c.pivot_date
 )c
