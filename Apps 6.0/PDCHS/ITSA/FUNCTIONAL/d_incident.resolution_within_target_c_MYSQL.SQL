select  CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.resolution_within_target_c' ELSE 'SUCCESS' END as Message
from
(select count(1) as cnt from pdchs_mdwdb.f_incident f_incident
join pdchs_mdwdb.d_lov d_lov
on f_incident.priority_src_key=d_lov.row_key
join pdchs_mdwdb.d_incident d_incident
on d_incident.row_key=f_incident.incident_key
join pdchs_mdwdb.d_lov d_lov1
on f_incident.state_src_key=d_lov1.row_key
join pdchs_mdwdb.d_lov_map d_lov_map
on d_lov_map.src_key=d_lov1.row_key
where case when d_lov.dimension_code='1'and f_incident.open_to_resolve_duration <= 3600 then 'Y'
when d_lov.dimension_code='2'and f_incident.open_to_resolve_duration <=10800 then 'Y'
when d_lov.dimension_code='3' and
TIMESTAMPDIFF(SECOND,d_incident.opened_on,d_incident.last_resolved_on) - (FLOOR(DATEDIFF(DATE(d_incident.last_resolved_on ), DATE(d_incident.opened_on))/7) * (86400*2))
-  (case when dayname(opened_on)='saturday' and (dayname(last_resolved_on)<>'saturday' or dayname(last_resolved_on) <> 'sunday')  then 3600*24*2
when dayname(opened_on)='sunday' and (dayname(last_resolved_on)<>'saturday' or dayname(last_resolved_on)<>'sunday') then 3600*24
when dayname(opened_on)='sunday' and dayname(last_resolved_on)='sunday' then 3600*24*3
when dayname(opened_on)='saturday' and dayname(last_resolved_on)='saturday' then 3600*24*3
when dayname(opened_on)='sunday' and dayname(last_resolved_on)='saturday' then 3600*24*2
when dayname(opened_on)='saturday' and dayname(last_resolved_on)='Sunday' then 3600*24*3
else 0
end)
<= 86400  Then 'Y'
when d_lov.dimension_code='3' and DAYNAME(d_incident.opened_on)='FRIDAY' and DAYNAME(d_incident.last_resolved_on)='SATURDAY' and (f_incident.open_to_resolve_duration-86400)<=86400 then 'Y'
when d_lov.dimension_code='3' and DAYNAME(d_incident.opened_on)='FRIDAY' and DAYNAME(d_incident.last_resolved_on)='SUNDAY' and (f_incident.open_to_resolve_duration-172800)<=86400 then 'Y'
when d_lov.dimension_code='3' and  DAYNAME(d_incident.opened_on)='FRIDAY' and week(d_incident.last_resolved_on)-week(d_incident.opened_on)=1 and (f_incident.open_to_resolve_duration-172800)<=86400 then 'Y'

when d_lov.dimension_code='4'and TIMESTAMPDIFF(SECOND,d_incident.opened_on,d_incident.last_resolved_on) - (FLOOR(DATEDIFF(DATE(d_incident.last_resolved_on ), DATE(d_incident.opened_on))/7) * (86400*2))
- (case when dayname(opened_on)='saturday' and (dayname(last_resolved_on)<>'saturday' or dayname(last_resolved_on) <> 'sunday')  then 3600*24*2
when dayname(opened_on)='sunday' and (dayname(last_resolved_on)<>'saturday' or dayname(last_resolved_on)<>'sunday') then 3600*24
when dayname(opened_on)='sunday' and dayname(last_resolved_on)='sunday' then 3600*24*3
when dayname(opened_on)='saturday' and dayname(last_resolved_on)='saturday' then 3600*24*3
when dayname(opened_on)='sunday' and dayname(last_resolved_on)='saturday' then 3600*24*2
when dayname(opened_on)='saturday' and dayname(last_resolved_on)='Sunday' then 3600*24*4
else 0
end)
<= 259200  Then 'Y'
when d_lov.dimension_code='4' and DAYNAME(d_incident.opened_on)='FRIDAY' and DAYNAME(d_incident.last_resolved_on)='SATURDAY' and (f_incident.open_to_resolve_duration-86400)<=259200 then 'Y'
when d_lov.dimension_code='4' and DAYNAME(d_incident.opened_on)='FRIDAY' and DAYNAME(d_incident.last_resolved_on)='SUNDAY' and (f_incident.open_to_resolve_duration-172800)<=259200 then 'Y'
when d_lov.dimension_code='4' and  DAYNAME(d_incident.opened_on)='FRIDAY' and week(d_incident.last_resolved_on)-week(d_incident.opened_on)=1 and (f_incident.open_to_resolve_duration-172800)<=259200 then 'Y'
else 'N' end and 
d_incident.etl_run_number = 1
and d_lov_map.dimension_wh_code in ('RESOLVED','CLOSED')<>d_incident.resolution_within_target_c
)temp;

