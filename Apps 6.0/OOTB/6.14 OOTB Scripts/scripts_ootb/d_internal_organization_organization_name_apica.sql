SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.organization_name' ELSE 'SUCCESS' END as Message
 -- select TRGT.row_id, SRC.organization_name,TRGT.organization_name
  FROM (select distinct
  'Y' as Business_unit_flag
,check_tags.cdctype as cdctype, 
check_tags.tagvalue as organization_name
,CONCAT('BUSINESS_UNIT~',check_tags.tagvalue) as row_ID,
CASE WHEN check_tags.cdctype = 'D' THEN 'Y' ELSE 'N' END as soft_deleted_flag
,check_tags.sourceinstance as source_id
from #MDS_TABLE_SCHEMA.check_tags_final check_tags
where lower(check_tags.tagname) = 'business_unit'
 -- and check_tags.cdctype<>'D'
 ) SRC
 left join #DWH_TABLE_SCHEMA.d_internal_organization TRGT
on SRC.row_ID=TRGT.row_id
and SRC.source_id=TRGT.source_id 
 where coalesce(SRC.organization_name,'')<>coalesce(TRGT.organization_name,'') ;
 
 -- select * from #MDS_TABLE_SCHEMA.check_tags_final
 
 