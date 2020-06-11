SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.parent_row_id' ELSE 'SUCCESS' END as Message
FROM(select TRGT.row_id, TRGT.location_key, LKP.row_key
from #MDS_TABLE_SCHEMA.hlx_ctm_people_final SRC
left join #DWH_TABLE_SCHEMA.d_internal_contact TRGT
on TRGT.row_id = CONCAT('INTERNAL_CONTACT~',SRC.person_id)
and TRGT.source_id = SRC.sourceinstance
left join #DWH_TABLE_SCHEMA.d_location LKP
on LKP.row_id = SRC.site_id
and LKP.source_id = SRC.sourceinstance
where coalesce(LKP.row_key, case when SRC.site_id is not null then -1 else 0 end) <> coalesce(TRGT.location_key, ''))sq