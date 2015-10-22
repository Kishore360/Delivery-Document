 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.sys_user_key,b.value,c.name,c.reference,d.row_key
from intuit_mdwdb.f_request_item_variable_c a
inner join intuit_mdsdb.sc_item_option_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.item_option_new=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_internal_contact d
on concat('INTERNAL_CONTACT~',b.value)=d.row_id
and b.sourceinstance=d.source_id
where c.reference='sys_user' AND a.sys_user_key<>d.row_key)A)TEMP