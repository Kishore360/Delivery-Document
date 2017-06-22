SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt 
from gilead_mdwdb.d_request_item trgt
join 
(select d.sys_id,d.sourceinstance,b.question_text,b.name,a.value from
 gilead_mdsdb.sc_item_option_final a join
		gilead_mdsdb.item_option_new_final b on b.sys_id = a.item_option_new join
	gilead_mdsdb.sc_item_option_mtom_final c on c.sc_item_option = a.sys_id join
		gilead_mdsdb.sc_req_item_final d on c.request_item = d.sys_id
 where b.sys_id='800b04240f9e42007f9722d8b1050e78' ) src
on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance
where variable_short_description_c <> src.value) c;
