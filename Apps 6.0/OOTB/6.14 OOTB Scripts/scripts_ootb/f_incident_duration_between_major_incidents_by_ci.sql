SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.duration_between_major_incidents_by_ci' ELSE 'SUCCESS' END as Message
-- select SRC.configuration_item_key,SRC.duration, round(TRGT.duration_between_major_incidents_by_ci), SRC.opened_on, SRC.major_incident_flag,SRC.row_id
from
(select SRC.configuration_item_key, SRC.row_id,SRC.major_incident_flag,SRC.opened_on	, SRC.seq_id,
case when SRC_PRV.opened_on is not null then timestampdiff(SECOND, SRC_PRV.opened_on,SRC.opened_on) else 0 end duration
from
(
select main.configuration_item_key,main.opened_on,main.row_id,main.major_incident_flag,
(
select count(base.row_id)+1
from
(
select f.configuration_item_key,f.row_id,d.opened_on,d.major_incident_flag,f.row_key
from #DWH_TABLE_SCHEMA.f_incident f
left join #DWH_TABLE_SCHEMA.d_incident d
on d.row_key = f.incident_key
left join #DWH_TABLE_SCHEMA.d_configuration_item ci
on ci.row_key = f.configuration_item_key
where d.major_incident_flag = 'Y'
) base
where base.configuration_item_key = main.configuration_item_key and
(base.opened_on < main.opened_on or (base.opened_on = main.opened_on AND base.row_key < main.row_key))
) as seq_id
from 
(
select f.configuration_item_key,f.row_id,d.opened_on,d.major_incident_flag,f.row_key
from #DWH_TABLE_SCHEMA.f_incident f
left join #DWH_TABLE_SCHEMA.d_incident d
on d.row_key = f.incident_key
left join #DWH_TABLE_SCHEMA.d_configuration_item ci
on ci.row_key = f.configuration_item_key
where d.major_incident_flag = 'Y'
) main
order by main.configuration_item_key,main.opened_on) SRC
left join 
(select main.configuration_item_key,main.opened_on,
(
select count(base.row_id)+1
from
(
select f.configuration_item_key,f.row_id,d.opened_on,d.major_incident_flag, f.row_key
from #DWH_TABLE_SCHEMA.f_incident f
left join #DWH_TABLE_SCHEMA.d_incident d
on d.row_key = f.incident_key
left join #DWH_TABLE_SCHEMA.d_configuration_item ci
on ci.row_key = f.configuration_item_key
where d.major_incident_flag = 'Y'
) base
where base.configuration_item_key = main.configuration_item_key and 
(base.opened_on < main.opened_on or (base.opened_on = main.opened_on AND base.row_key < main.row_key))
) as seq_id
from 
(
select f.configuration_item_key,f.row_id,d.opened_on,f.row_key
from #DWH_TABLE_SCHEMA.f_incident f
left join #DWH_TABLE_SCHEMA.d_incident d
on d.row_key = f.incident_key
left join #DWH_TABLE_SCHEMA.d_configuration_item ci
on ci.row_key = f.configuration_item_key
where d.major_incident_flag = 'Y'
) main
order by main.configuration_item_key,main.opened_on) SRC_PRV
on SRC.configuration_item_key = SRC_PRV.configuration_item_key 
and SRC.seq_id = SRC_PRV.seq_id + 1 )SRC
left join 
#DWH_TABLE_SCHEMA.f_incident TRGT
on TRGT.configuration_item_key = SRC.configuration_item_key
and TRGT.row_id = SRC.row_id
where TRGT.configuration_item_key <> 0 
and coalesce(SRC.duration,0) <> round(coalesce(TRGT.duration_between_major_incidents_by_ci,''))
order by SRC.configuration_item_key,SRC.opened_on,SRC.seq_id;




