select case when count(1)>1 then 'Not Matching' else 'Matching' end as result,
case when count(1)>1 then 'Data mismatch for d_case.ca_standards_c' else 'Matching' end as message
from  tjxco_mdsdb.sn_customerservice_case_final src
join tjxco_mdwdb.d_case tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.u_ca_standards<>tgt.ca_standards_c;