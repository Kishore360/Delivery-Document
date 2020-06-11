SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_organization.source_id' ELSE 'SUCCESS' END as Message
from (select coalesce(SRC.sourceinstance,''),coalesce(TRGT.source_id,'')
from (SELECT * FROM #MDS_TABLE_SCHEMA.core_company_final where cdctype<>'D')SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and CONCAT('SUBSIDIARY~',SRC.sys_id)=TRGT.row_id
where coalesce(SRC.sourceinstance,'')<>coalesce(TRGT.source_id,'')

union all

select coalesce(SRC.sourceinstance,''),coalesce(TRGT.source_id,'')
from (SELECT * FROM #MDS_TABLE_SCHEMA.cmn_department_final where cdctype<>'D')SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and CONCAT('DEPARTMENT~',SRC.sys_id)=TRGT.row_id
where coalesce(SRC.sourceinstance,'')<>coalesce(TRGT.source_id,'')

union all

select coalesce(SRC.sourceinstance,''),coalesce(TRGT.source_id,'')
from (SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_group_final where cdctype<>'D')SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and CONCAT('GROUP~',SRC.sys_id)=TRGT.row_id
where coalesce(SRC.sourceinstance,'')<>coalesce(TRGT.source_id,''))inter_org