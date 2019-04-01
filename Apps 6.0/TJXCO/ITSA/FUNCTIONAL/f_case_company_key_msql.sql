select case when cnt then 'Not Matching' else 'Matching' end as result,
case when cnt then 'Data mismatch for f_case.company_key' else 'Matching' end as message from (select count(1) cnt 
from  tjxco_mdsdb.sn_customerservice_case_final src
join tjxco_mdwdb.f_case tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where (case when src.company is null then 'UNSPECIFIED' else concat('SUBSIDIARY~',src.company) end)<>tgt.company_key)a;
