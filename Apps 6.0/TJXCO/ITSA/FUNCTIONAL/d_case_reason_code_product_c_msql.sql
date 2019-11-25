select case when count(1)>1 then 'Not Matching' else 'Matching' end as result,
case when count(1)>1 then 'Data mismatch for d_case.reason_code_product_c' else 'Matching' end as message
from  tjxco_mdsdb.sn_customerservice_case_final src
join tjxco_mdwdb.d_case tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where coalesce(src.u_reason_code_product,'UNSPECIFIED')<>tgt.reason_code_product_c;