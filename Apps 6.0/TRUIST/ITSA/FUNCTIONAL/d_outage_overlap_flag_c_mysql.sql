SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_outage.overlap_flag_c' ELSE 'SUCCESS' END as Message
FROM truist_mdwdb.d_outage a
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
from truist_mdwdb.outage_overlap_master_temp a left join truist_mdwdb.outage_overlap_master_temp b ON
a.application_archer_c_key = b.application_archer_c_key and a.calendar_date = b.calendar_date and b.outage_key != a.outage_key
where 1=1
order by a.calendar_date,a.modified_start_on
) x
group by outage_key_main)b
on a.row_key = b.outage_key
where a.overlap_flag_c<>b.overlap_flag_c;