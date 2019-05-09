select case when count(1)>1 then 'Not Matching' else 'Matching' end as result,
case when count(1)>1 then 'Data mismatch for d_case.ca_standards_c' else 'Matching' end as message
from  tjxco_mdsdb.sn_customerservice_case_final src
left join tjxco_mdwdb.d_lov d on concat('CA_STANDARD~CASE~',u_ca_standards)=row_id 
join tjxco_mdwdb.d_case tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where coalesce(d.row_key,case when src.u_ca_standards is null then 0 else -1 end)<>tgt.ca_standard_c_key;