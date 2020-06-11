SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.location_number' ELSE 'SUCCESS' END as Message
 -- select TRGT.row_id, SRC.source_id,TRGT.source_id
  FROM (select distinct
checks.cdctype  as cdctype, 
checks.location as location_name
,checks.location as row_ID,
CASE WHEN checks.cdctype = 'D' THEN 'Y' ELSE 'N' END as soft_deleted_flag
, checks.sourceinstance as source_id
,NULL as city_code
,NULL as contact_id
,NULL as contact_name
,NULL as country_code
,NULL as current_flag
,NULL as email_address
,NULL as fax_phone_number
,'0' as geo_key
,NULL as latitude
,NULL as location_number
,NULL as location_type_code
,NULL as longitude
,NULL as mobile_number
,NULL as pivot_date
,NULL as postal_code
,NULL as st_address1
,NULL as st_address2
,NULL as st_address3
,NULL as st_address4
,NULL as state_code
,NULL as time_zone
,NULL as work_phone
from #MDS_TABLE_SCHEMA.checks_final checks
 ) SRC
 left join #DWH_TABLE_SCHEMA.d_location TRGT
on SRC.row_ID=TRGT.row_id  collate utf8_unicode_ci
and SRC.source_id=TRGT.source_id -- collate utf8_unicode_ci
 where coalesce(SRC.location_number,'')<>coalesce(TRGT.location_number,'')  -- collate utf8_unicode_ci;
 
 -- select * from #DWH_TABLE_SCHEMA.d_location