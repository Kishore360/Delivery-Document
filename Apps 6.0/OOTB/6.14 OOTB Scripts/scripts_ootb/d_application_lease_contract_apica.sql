SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.lease_contract' ELSE 'SUCCESS' END as Message
 -- select TRGT.row_id, SRC.source_id,TRGT.source_id
  FROM (select distinct
check_tags.cdctype as cdctype, 
check_tags.tagvalue as name
,CONCAT('APPLICATION~',check_tags.tagvalue) as row_ID,
CASE WHEN check_tags.cdctype = 'D' THEN 'Y' ELSE 'N' END as soft_deleted_flag
,check_tags.sourceinstance as source_id
,NUll as asset_tag
,NUll as assigned_to
,NUll as category
,NUll as class
,NUll as company
,NUll as delivered_on
,NUll as department
,NUll as description
,NUll as install_on
,NUll as install_status
,NUll as install_type
,NUll as lease_contract
,NUll as location
,NUll as managed_by
,NUll as manufacturer
,'0' as mdm_key
,NUll as model_number
,NUll as operational_status
,NUll as order_on
,NUll as owned_by
,NUll as subcategory
,NUll as support_group
,NUll as supported_by
,NUll as tier_src_code
,'0' as tier_src_key
,NUll as type
,NUll as used_for_src_code
,'0' as used_for_src_key
,NUll as vendor
,NUll as version
,NUll as warranty_expiry_on
	

from #MDS_TABLE_SCHEMA.check_tags_final check_tags
where lower(check_tags.tagname) = 'application'
  ) SRC
 left join #DWH_TABLE_SCHEMA.d_application TRGT
on SRC.row_ID=TRGT.row_id
and SRC.source_id=TRGT.source_id 
 where coalesce(SRC.lease_contract,'')<>coalesce(TRGT.lease_contract,'') ;
 
 -- select * from #MDS_TABLE_SCHEMA.check_tags_final