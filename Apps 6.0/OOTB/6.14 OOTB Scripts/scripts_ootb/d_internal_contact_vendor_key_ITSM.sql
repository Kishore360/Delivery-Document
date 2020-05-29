SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.vendor_key' ELSE 'SUCCESS' END as Message
-- select TRGT.row_id is not null and coalesce(case when SRC1.company is not null and SRC2.vendor=1 then LKP.row_key 
-- when SRC1.company is not null and SRC2.vendor=0 then -1 end),coalesce(TRGT.vendor_key,'')
from (select * from #MDS_TABLE_SCHEMA.sys_user_final where cdctype<>'D') SRC1
left join (select * from #MDS_TABLE_SCHEMA.core_company_final where cdctype<>'D')SRC2
on SRC1.company=SRC2.sys_id and SRC1.sourceinstance=SRC2.sourceinstance
left join (select * from #DWH_TABLE_SCHEMA.d_internal_contact where soft_deleted_flag='N')TRGT
on concat('INTERNAL_CONTACT~',SRC1.sys_id)=TRGT.row_id and SRC2.sourceinstance=TRGT.source_id
left join (select * from #DWH_TABLE_SCHEMA.d_supplier where soft_deleted_flag='N')LKP
on SRC2.sourceinstance=LKP.source_id and concat('SUPPLIER~',SRC2.sys_id)=LKP.row_id
where TRGT.row_id is not null and coalesce(case when SRC1.company is not null and SRC2.vendor=1 then LKP.row_key 
-- when SRC1.company is null then 0
when SRC1.company is not null and SRC2.vendor=0 then -1 end)<>coalesce(TRGT.vendor_key,'');