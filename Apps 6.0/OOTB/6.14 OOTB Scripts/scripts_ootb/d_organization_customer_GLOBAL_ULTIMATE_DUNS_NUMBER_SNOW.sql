select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_organization_customer.GLOBAL_ULTIMATE_DUNS_NUMBER' ELSE 'SUCCESS' END as Message
-- select TRGT.GLOBAL_ULTIMATE_DUNS_NUMBER
from(select * from #MDS_TABLE_SCHEMA.core_company_final where cdctype<>'D')SRC
left join (select * from #DWH_TABLE_SCHEMA.d_organization_customer where soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and coalesce(concat('ORG_CUST~',SRC.sys_id),'')=TRGT.row_id
where customer=1 and TRGT.GLOBAL_ULTIMATE_DUNS_NUMBER is not null;