SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_outage.overlap_flag_c' ELSE 'SUCCESS' END as Message
FROM bbandt_mdwdb.d_outage a
join(
select outage_key_main as outage_key,max(flg) as overlap_flag_c
from (select a.application_archer_c_key,a.outage_key as outage_key_main,a.calendar_date,a.modified_start_on,a.modified_end_on,b.outage_key,b.modified_start_on as modified_start_on_1,
b.modified_end_on as modified_end_on_1,
case when b.outage_key is null then 'N'
when ((a.modified_start_on between b.modified_start_on and b.modified_end_on) AND (a.modified_end_on between b.modified_start_on and b.modified_end_on)) then 'Y'
when ((a.modified_start_on < b.modified_start_on) and (a.modified_end_on > b.modified_end_on)) then 'Y'
when a.modified_start_on < b.modified_end_on AND a.modified_start_on >= b.modified_start_on then 'Y'
when a.modified_end_on > b.modified_start_on AND a.modified_end_on <= b.modified_end_on then 'Y'
else 'N' end as flg
from (select a.application_archer_c_key,a.calendar_date,a.outage_key,a.start_on as actual_start_on,a.end_on as actual_end_on,a.outage_duration,
a.day_start_on,a.day_end_on,
case when date(start_on) = date(calendar_date) then a.start_on else a.day_start_on end as modified_start_on,
case when date(end_on) = date(calendar_date) then a.end_on else a.day_end_on end as modified_end_on
from
(
select CONCAT(b.application_archer_c_key,'~',d.calendar_date) as id,
b.configuration_item_key as ci_key,
b.application_archer_c_key,
d.calendar_date,
a.row_key as outage_key,
c.application_name_c,
a.short_description,
a.start_on ,
a.end_on ,
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
from bbandt_mdwdb.d_outage a ,
 bbandt_mdwdb.f_outage b ,
 bbandt_mdwdb.d_archer_application_c c,
 bbandt_mdwdb.d_calendar_date d
 where 1=1
and a.row_key = b.outage_key
and b.application_archer_c_key = c.row_key
and d.calendar_date between date(a.start_on) and date(a.end_on)
order by application_archer_c_key,calendar_date,start_on,end_on,outage_type_src_code,priority_c,ci_key,archer_id_c_key1
) a) a left join (select a.application_archer_c_key,a.calendar_date,a.outage_key,a.start_on as actual_start_on,a.end_on as actual_end_on,a.outage_duration,
a.day_start_on,a.day_end_on,
case when date(start_on) = date(calendar_date) then a.start_on else a.day_start_on end as modified_start_on,
case when date(end_on) = date(calendar_date) then a.end_on else a.day_end_on end as modified_end_on
from
(
select CONCAT(b.application_archer_c_key,'~',d.calendar_date) as id,
b.configuration_item_key as ci_key,
b.application_archer_c_key,
d.calendar_date,
a.row_key as outage_key,
c.application_name_c,
a.short_description,
a.start_on ,
a.end_on ,
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
from bbandt_mdwdb.d_outage a ,
 bbandt_mdwdb.f_outage b ,
 bbandt_mdwdb.d_archer_application_c c,
 bbandt_mdwdb.d_calendar_date d
 where 1=1
and a.row_key = b.outage_key
and b.application_archer_c_key = c.row_key
and d.calendar_date between date(a.start_on) and date(a.end_on)
order by application_archer_c_key,calendar_date,start_on,end_on,outage_type_src_code,priority_c,ci_key,archer_id_c_key1
) a) b ON
a.application_archer_c_key = b.application_archer_c_key and a.calendar_date = b.calendar_date and b.outage_key != a.outage_key
where 1=1
order by a.calendar_date,a.modified_start_on
) x
group by outage_key_main)b
on a.row_key = b.outage_key
where a.overlap_flag_c<>b.overlap_flag_c;