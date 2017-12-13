
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
from
pan_mdwdb.d_internal_contact di
left join (select min(start_date_c) start_date_c,requested_for_key from 
pan_mdwdb.d_request_item d 
join pan_mdwdb.f_request_item f 
on d.row_key=f.request_item_key and d.source_id=f.source_id
where d.start_date_c is not null 
group by 2) B
on di.row_key=B.requested_for_key
where di.employee_start_date_c <> B.start_date_c;
