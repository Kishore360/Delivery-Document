select 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.hr_case_c_key' ELSE 'SUCCESS' END as Message
from 
(select 
src.sys_id,trgt.row_id, src.parent,hr_case_c_key,lkp.row_key,lkp_src.number,
coalesce(lkp.row_key,case when src.parent is null or lkp_src.sys_id is null then 0 else -1 end) as src_hr_case_key,
trgt.hr_case_c_key as trgt_hr_case_key
from molinahealth_mdsdb.sc_req_item_final src
left join molinahealth_workdb.f_request_item trgt on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
left join molinahealth_mdsdb.u_hr_case_final lkp_src on src.parent = lkp_src.sys_id and src.sourceinstance = lkp_src.sourceinstance
left join molinahealth_mdwdb.d_hr_case_c lkp on src.parent = lkp.row_id and src.sourceinstance = lkp.source_id)tmp
where trgt_hr_case_key <> src_hr_case_key;