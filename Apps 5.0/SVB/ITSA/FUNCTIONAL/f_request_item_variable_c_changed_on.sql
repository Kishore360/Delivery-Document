 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from (select qa.sys_id as sys_id_1 , qa.sourceinstance as sourceinstance_1,qa.sys_updated_on,
b.sys_id as sys_id_2,b.sourceinstance as sourceinstance_2, concat(qa.sys_id,'~',b.request_item) as jn1
from svb_mdsdb.sc_item_option_final qa  
inner join  svb_mdsdb.sc_item_option_mtom_final b 
on qa.sys_id=b.sc_item_option and qa.sourceinstance = b.sourceinstance  ) SRC
 left  JOIN  svb_mdwdb.f_request_item_variable_c c
on  c.ROW_ID = SRC.jn1 and SRC.sourceinstance_1=c.source_id
where  SRC.sys_updated_on<>c.changed_on
 )c
