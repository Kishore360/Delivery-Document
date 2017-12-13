SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM  (select count(1) as cnt from
asu_mdsdb.sc_item_option_final b 


inner join asu_mdsdb.sc_item_option_mtom_final d

on d.sc_item_option=b.sys_id

join asu_mdsdb.question_final q
on b.item_option_new=q.sys_id and b.sourceinstance=q.sourceinstance

join asu_mdwdb.lsm_ls_variable_list lvl
on q.sys_id=lvl.row_id and  q.sourceinstance=lvl.source_id and lvl.variable_type='Reference' AND q.reference='sys_user' 

inner join asu_mdwdb.d_request_item c

on d.request_item=c.row_id and c.source_id=d.sourceinstance

inner join asu_mdwdb.d_internal_contact f on COALESCE(CONCAT('INTERNAL_CONTACT','~',b.value),'UNSPECIFIED')=f.row_id and b.sourceinstance=f.source_id
inner 
join asu_mdwdb.f_request_item_variable_c a 
on SUBSTRING(a.row_id,1,32)= b.sys_id
 AND SUBSTRING(a.row_id,34,32)=  d.request_item
AND a.source_id=b.sourceinstance

WHERE f.row_key <>a.requested_for_c_key)a



