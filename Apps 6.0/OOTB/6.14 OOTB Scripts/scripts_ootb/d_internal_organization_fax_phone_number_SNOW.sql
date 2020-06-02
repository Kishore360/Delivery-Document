SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_organization.fax_phone_number' ELSE 'SUCCESS' END as Message
from (select coalesce(SRC.fax_phone,''),coalesce(TRGT.fax_phone_number,'')
from (SELECT * FROM #MDS_TABLE_SCHEMA.core_company_final where cdctype<>'D')SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and CONCAT('SUBSIDIARY~',SRC.sys_id)=TRGT.row_id
where coalesce(SRC.fax_phone,'')<>coalesce(TRGT.fax_phone_number,'')

union all

select coalesce(TRGT.fax_phone_number,''),null
from (SELECT * FROM #MDS_TABLE_SCHEMA.cmn_department_final where cdctype<>'D')SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and CONCAT('DEPARTMENT~',SRC.sys_id)=TRGT.row_id
where (TRGT.fax_phone_number)is not null

union all

select coalesce(TRGT.fax_phone_number),null
from (SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_group_final where cdctype<>'D')SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_organization WHERE row_key NOT IN (0,-1) and soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and CONCAT('GROUP~',SRC.sys_id)=TRGT.row_id
where (TRGT.fax_phone_number)is not null)inter_org