select CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'assigned_to_key validation failed between facilities_request_final and d_facilty_request' ELSE 'SUCCESS' END AS Message
from <<tenant>>_mdwdb.f_facility_request DWH
where assigned_to_key not in
(
select coalesce(case when SRC.assigned_to is null then '0' else ASSIG.row_key end, '-1') final
from <<tenant>>_mdsdb.facilities_request_final SRC
left join <<tenant>>_mdwdb.d_internal_contact ASSIG
on concat('INTERNAL_CONTACT~',SRC.assigned_to)=ASSIG.row_id)
