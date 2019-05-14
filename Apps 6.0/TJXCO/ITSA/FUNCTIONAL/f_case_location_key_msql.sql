select case when cnt then 'Not Matching' else 'Matching' end as result,
case when cnt then 'Data mismatch for f_case.location_key' else 'Matching' end as message from (select count(1) cnt 
from tjxco_mdsdb.sn_customerservice_case_final src
join tjxco_mdwdb.f_case tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join tjxco_mdwdb.d_location lkp
on src.location=lkp.row_id and src.sourceinstance=lkp.source_id
where Coalesce(lkp.row_key,CASE WHEN src.u_store IS NULL THEN 0 ELSE -1 END)<>tgt.location_key)a;