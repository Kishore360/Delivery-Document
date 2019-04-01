select case when cnt then 'Not Matching' else 'Matching' end as result,
case when cnt then 'Data mismatch for d_case.template_closure_c' else 'Matching' end as message from (select count(1) cnt 
from  tjxco_mdsdb.sn_customerservice_case_final src
join tjxco_mdwdb.d_case tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.u_template_closure<>tgt.template_closure_c)a;