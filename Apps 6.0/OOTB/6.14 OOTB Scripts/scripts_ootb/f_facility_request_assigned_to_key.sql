select CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'assigned_to_key validation failed between facilities_request_final and d_facilty_request' ELSE 'SUCCESS' END AS Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.f_facility_request WHERE CDCTYPE<>'D') DWH
where assigned_to_key not in
(
select coalesce(case when SRC.assigned_to is null then '0' else ASSIG.row_key end, '-1') final
from ( SELECT * FROM #MDS_TABLE_SCHEMA.facilities_request_final WHERE CDCTYPE<>'D') SRC
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.d_internal_contact WHERE CDCTYPE<>'D') ASSIG
on concat('INTERNAL_CONTACT~',SRC.assigned_to)=ASSIG.row_id)