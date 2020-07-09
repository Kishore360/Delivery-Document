select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_outage.application_archer_c_key'  ELSE 'SUCCESS'  END as Message
-- select distinct SRC.sys_id,TRGT.row_id,COALESCE(UPPER(CONCAT('APPID-',REPLACE(UPPER(SRC1.u_archer_id),'APPID-',''))),'UNSPECIFIED') erow,
-- LKP.row_id,COALESCE(LKP.row_key,CASE WHEN SRC1.u_archer_id IS NULL THEN 0 ELSE -1 END) ,TRGT.application_archer_c_key
FROM
truist_mdwdb.f_outage a
 join (select incident_key,outage_key,sum(full_outage_duration) as business_impact from
(
select b.*,
a.*,
case when TIMESTAMPDIFF(SECOND,
case when business_start_time < start_on then start_on else business_start_time end,
case when business_end_time < end_on then business_end_time else end_on end) > 0
THEN TIMESTAMPDIFF(SECOND,
case when business_start_time < start_on then start_on else business_start_time end,
case when business_end_time < end_on then business_end_time else end_on end)
ELSE 0 END
as full_outage_duration from
(select date(business_start_time) availability_date,
configuration_item_key,
application_archer_c_key appl_archer_c_key,
business_start_time,
business_end_time,
business_duration,
archer_id_c_key
from truist_mdwdb.f_application_availability_c a
where 1=1
) b
inner join
(
select CONCAT(b.application_archer_c_key,'~',d.calendar_date) as id,
b.configuration_item_key as ci_key,
b.application_archer_c_key,
d.calendar_date,
a.row_key as outage_key,
c.application_name_c,
a.short_description,
a.start_on,
a.end_on,
a.duration,
a.outage_type_src_code,
a.row_id,
timestamp(d.calendar_date) as day_start_on,
DATE_ADD(d.calendar_date, INTERVAL 86400 second) as day_end_on ,
case when date(a.start_on) = date(a.end_on) then
TIMESTAMPDIFF(SECOND,a.start_on,a.end_on)
when date(a.start_on) = date(timestamp(d.calendar_date)) then
TIMESTAMPDIFF(SECOND,a.start_on,DATE_ADD(d.calendar_date, INTERVAL 86400 second))
when date(a.end_on) = date (timestamp(d.calendar_date)) then
TIMESTAMPDIFF(SECOND,timestamp(d.calendar_date),a.end_on)else 86400
end as outage_duration,
b.archer_id_c_key as archer_id_c_key1,
b.priority_c as priority_c,
b.incident_key as incident_key
from truist_mdwdb.d_outage a ,
 truist_mdwdb.f_outage b ,
 truist_mdwdb.d_archer_application_c c,
 truist_mdwdb.d_calendar_date d
 where 1=1
and a.row_key = b.outage_key
and b.application_archer_c_key = c.row_key
and b.application_archer_c_key not in (0,-1)
and d.calendar_date between date(a.start_on) and date(a.end_on)
order by application_archer_c_key,calendar_date,start_on,end_on,outage_type_src_code,priority_c,ci_key,archer_id_c_key1
) a
on a.application_archer_c_key = b.appl_archer_c_key and a.calendar_date=b.availability_date
and case when b.configuration_item_key = a.ci_key then b.configuration_item_key else b.configuration_item_key end = case when b.configuration_item_key = a.ci_key then a.ci_key else b.configuration_item_key end
and case when b.archer_id_c_key = a.archer_id_c_key1 then b.archer_id_c_key else b.archer_id_c_key end = case when b.archer_id_c_key = a.archer_id_c_key1 then a.archer_id_c_key1 else b.archer_id_c_key end
)agg
group by incident_key,outage_key) temp
 on a.outage_key = temp.outage_key and
    a.incident_key=temp.incident_key 
 where a.business_impact_c<>temp.business_impact;