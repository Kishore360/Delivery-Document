select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.application_key' ELSE 'SUCCESS' END as Message
from (select * from #DWH_TABLE_SCHEMA.f_change_request where soft_deleted_flag='N') chg_f
left join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y' and soft_deleted_flag='N')chg_fai
on chg_f.change_request_key=chg_fai.change_request_key
where chg_f.application_key<>chg_fai.application_key;