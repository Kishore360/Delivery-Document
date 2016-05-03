 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.request_item_key aa,c.row_key bb
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdsdb.sc_item_option_mtom_final d
on d.sc_item_option=b.sys_id
inner join intuit_mdwdb.d_request_item c
on d.request_item=c.row_id and c.source_id=d.sourceinstance
)asd
where aa<>bb )TEMP