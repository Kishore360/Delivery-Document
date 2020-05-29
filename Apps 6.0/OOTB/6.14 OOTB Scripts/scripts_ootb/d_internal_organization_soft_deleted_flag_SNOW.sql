SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_organization.soft_deleted_flag' ELSE 'SUCCESS' END as Message
from (select coalesce(CONCAT('SUBSIDIARY~',SRC.sys_id),''),coalesce(TRGT.soft_deleted_flag,'')
from (SELECT * FROM #MDS_TABLE_SCHEMA.core_company_final)SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and CONCAT('SUBSIDIARY~',SRC.sys_id)=TRGT.row_id
where (case when SRC.cdctype='D' then 'Y' else 'N' end)<>coalesce(TRGT.soft_deleted_flag,'')

union all

select coalesce(CONCAT('DEPARTMENT~',SRC.sys_id),''),coalesce(TRGT.soft_deleted_flag,'')
from (SELECT * FROM #MDS_TABLE_SCHEMA.cmn_department_final)SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and CONCAT('DEPARTMENT~',SRC.sys_id)=TRGT.row_id
where (case when SRC.cdctype='D' then 'Y' else 'N' end)<>coalesce(TRGT.soft_deleted_flag,'')

union all

select coalesce(CONCAT('GROUP~',SRC.sys_id),''),coalesce(TRGT.soft_deleted_flag,'')
from (SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_group_final)SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and CONCAT('GROUP~',SRC.sys_id)=TRGT.row_id
where (case when SRC.cdctype='D' then 'Y' else 'N' end)<>coalesce(TRGT.soft_deleted_flag,''))inter_org