select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
/* SELECT distinct trgt.row_id, X.vendor_end_of_support_date_c,X.lastupdated,vendor_duration,
case when vendor_duration is null then 'White'
when vendor_duration<0 then 'Red'
when vendor_duration >= 0 and vendor_duration <=18 then 'Orange'
when vendor_duration >= 18 and vendor_duration <=36 then 'Yellow'
ELSE 'Green' END exp,trgt.application_eos_state*/
from bbandt_mdwdb.d_archer_application_c trgt 
JOIN(select 
ROUND(TIMESTAMPDIFF(SECOND,lastupdated,vendor_end_of_support_date_c)/86400, 5)as vendor_duration,
lastupdated,vendor_end_of_support_date_c,
row_id, a.source_id
from bbandt_mdwdb.d_archer_application_c a
join 
(select  max(CONVERT_TZ (lastupdated,'America/New_York','GMT')) as lastupdated, source_id from bbandt_mdwdb.d_o_data_freshness
group by source_id) b
on a.source_id=b.source_id
)X
on X.row_id=trgt.row_id and X.source_id=trgt.source_id
where case when vendor_duration is null then 'White'
when vendor_duration<0 then 'Red'
when vendor_duration >= 0 and vendor_duration <540 then 'Orange'
when vendor_duration >= 540 and vendor_duration <1080 then 'Yellow'
ELSE 'Green' END<>trgt.application_eos_state
and trgt.soft_deleted_flag='N';