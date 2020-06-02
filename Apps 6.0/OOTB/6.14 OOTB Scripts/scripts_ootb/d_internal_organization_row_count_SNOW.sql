SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_organization.row_count' ELSE 'SUCCESS' END as Message
from (select sourceinstance,count(*) as src_count from (
(SELECT sourceinstance FROM #MDS_TABLE_SCHEMA.core_company_final where cdctype<>'D')
union all
(SELECT sourceinstance FROM #MDS_TABLE_SCHEMA.cmn_department_final where cdctype<>'D')
union all
(SELECT sourceinstance FROM #MDS_TABLE_SCHEMA.sys_user_group_final where cdctype<>'D'))asd
group by sourceinstance)SRC,
(select source_id,count(*) as trgt_count from #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N' group by 1)TRGT
where SRC.sourceinstance=TRGT.source_id and SRC.src_count<>TRGT.trgt_count