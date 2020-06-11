SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_a_change_request_smpo_dppc.vendor_flag' ELSE 'SUCCESS' END as Message
-- select coalesce(case when SRC.vendor=1 then 'Y' else 'N' end),coalesce(TRGT.vendor_flag,'') 
from (select * from #MDS_TABLE_SCHEMA.core_company_final where cdctype<>'D' and vendor=1) SRC
left join (select * from #DWH_TABLE_SCHEMA.d_supplier where soft_deleted_flag='N')TRGT
on SRC.sourceinstance=TRGT.source_id and concat('SUPPLIER~',SRC.sys_id)=TRGT.row_id
where coalesce(case when SRC.vendor=1 then 'Y' else 'N' end)<> coalesce(TRGT.vendor_flag,'');