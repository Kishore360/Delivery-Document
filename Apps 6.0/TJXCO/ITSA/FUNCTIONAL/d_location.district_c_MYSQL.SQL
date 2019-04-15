select case when cnt then 'Not Matching' else 'Matching' end as result,
case when cnt then 'Data mismatch for d_location.district_c' else 'Matching' end as message 
from (select count(1) cnt 
from  tjxco_mdsdb.cmn_location_final src
join tjxco_mdwdb.d_location tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where src.u_district<>tgt.district_c and tgt.soft_deleted_flag='N')a;