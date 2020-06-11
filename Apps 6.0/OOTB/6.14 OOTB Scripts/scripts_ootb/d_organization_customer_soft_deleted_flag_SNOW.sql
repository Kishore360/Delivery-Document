select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_organization_customer.soft_deleted_flag' ELSE 'SUCCESS' END as Message
-- select coalesce(case when SRC.cdctype='D' then 'Y' else 'N' end),coalesce(TRGT.soft_deleted_flag,'')
from(select * from #MDS_TABLE_SCHEMA.core_company_final)SRC
left join (select * from #DWH_TABLE_SCHEMA.d_organization_customer)TRGT
on SRC.sourceinstance=TRGT.source_id and coalesce(concat('ORG_CUST~',SRC.sys_id),'')=TRGT.row_id
where customer=1 and coalesce(case when SRC.cdctype='D' then 'Y' else 'N' end)<>coalesce(TRGT.soft_deleted_flag,'');