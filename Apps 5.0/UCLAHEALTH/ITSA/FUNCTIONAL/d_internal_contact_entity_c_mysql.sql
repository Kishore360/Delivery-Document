SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdwdb.d_internal_contact dfi
join uclahealth_mdsdb.sys_user_final incf
on dfi.row_id = CONCAT('INTERNAL_CONTACT~',incf.sys_id) and dfi.source_id= incf.sourceinstance
where  dfi.entity_c <> incf.u_entity)a


