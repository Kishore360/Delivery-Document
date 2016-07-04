select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location' ELSE 'SUCCESS' END as Message
from app_test.ds_location SRC
left join <<tenant>>_mdwdb.d_geography SRC2
on(SRC2.row_id=SRC.geo_id
and SRC2.source_id=SRC.source_id)
left join <<tenant>>_mdwdb.d_location TRGT
on(SRC.row_id=TRGT.row_id
and SRC.source_id=TRGT.source_id)
where concat(coalesce(SRC.row_id,''),coalesce(SRC.source_id,''),coalesce(SRC.location_number,''),coalesce(SRC.location_type_code,''),coalesce(SRC.contact_name,''),coalesce(SRC.location_name,''),coalesce(SRC.contact_id,''),coalesce(SRC.parent_row_id,''),coalesce(SRC.st_address1,''),coalesce(SRC.st_address2,''),coalesce(SRC.st_address3,''),coalesce(SRC.st_address4,''),coalesce(SRC.city_code,''),coalesce(SRC.state_code,''),coalesce(SRC.postal_code,''),coalesce(SRC.country_code,''),coalesce(SRC.email_address,''),coalesce(SRC.mobile_number,''),coalesce(SRC.work_phone,''),coalesce(SRC.time_zone,''),coalesce(SRC.fax_phone_number,''),coalesce(SRC2.row_key,''),coalesce(SRC.created_by,''),coalesce(SRC.changed_by,''),coalesce(SRC.created_on,''),coalesce(SRC.changed_on))
<> concat(coalesce(TRGT.row_id,''),coalesce(TRGT.source_id,''),coalesce(TRGT.location_number,''),coalesce(TRGT.location_type_code,''),coalesce(TRGT.contact_name,''),coalesce(TRGT.location_name,''),coalesce(TRGT.contact_id,''),coalesce(TRGT.parent_row_id,''),coalesce(TRGT.st_address1,''),coalesce(TRGT.st_address2,''),coalesce(TRGT.st_address3,''),coalesce(TRGT.st_address4,''),coalesce(TRGT.city_code,''),coalesce(TRGT.state_code,''),coalesce(TRGT.postal_code,''),coalesce(TRGT.country_code,''),coalesce(TRGT.email_address,''),coalesce(TRGT.mobile_number,''),coalesce(TRGT.work_phone,''),coalesce(TRGT.time_zone,''),coalesce(TRGT.fax_phone_number,''),coalesce(TRGT.geo_key,''),coalesce(TRGT.created_by,''),coalesce(TRGT.changed_by,''),coalesce(TRGT.created_on,''),coalesce(TRGT.changed_on));
