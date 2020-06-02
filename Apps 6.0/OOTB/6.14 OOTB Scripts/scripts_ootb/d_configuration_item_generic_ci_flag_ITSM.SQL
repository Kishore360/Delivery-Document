SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_a_change_request_smpo_dppc.generic_ci_flag' ELSE 'SUCCESS' END as Message
-- select coalesce(case when SRC.sys_id is not null then 'Y' else 'N' end),coalesce(TRGT.generic_ci_flag,'') 
from (select * from #MDS_TABLE_SCHEMA.us_generic_ci_smpo_final where cdctype<>'D') SRC
left join (select * from #DWH_TABLE_SCHEMA.d_configuration_item where soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and SRC.sys_id=TRGT.row_id
where coalesce(case when SRC.sys_id is not null then 'Y' else 'N' end)<> coalesce(TRGT.generic_ci_flag,'');