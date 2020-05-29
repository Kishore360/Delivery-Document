select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.outages_caused_outside_application' ELSE 'SUCCESS' END as Message
from
(select change_request_key as change_request_key,
count(distinct(outages_directly_for_change_request_diff_application))+count(distinct(outages_caused_for_change_request_diff_application)) as outages_for_diff_application
from
(select chgf.application_key as change_request_application_key,chgf.change_request_key as change_request_key,
outa.application_key as outage_app,outa.change_request_key as outage_cr,
outa1.application_key as outage_cbc_app,outa1.caused_by_change_key as outage_cbc,

case when (UPPER(map.dimension_name)='CLOSED' and (outa.start_on_key>=chgf.closed_on_key) and outa.change_request_key<>0 and chgf.application_key<>outa.application_key) then outa.outage_key else null end as outages_directly_for_change_request_diff_application,

case when (UPPER(map.dimension_name)='CLOSED' and (outa.start_on_key>=chgf.closed_on_key) and outa1.caused_by_change_key<>0 and outa1.incident_key<>0 and chgf.application_key<>outa1.application_key) then outa1.outage_key else null end as outages_caused_for_change_request_diff_application

from #DWH_TABLE_SCHEMA.f_change_request chgf
left join #DWH_TABLE_SCHEMA.f_outage outa
on chgf.change_request_key=outa.change_request_key
left join (select * from #DWH_TABLE_SCHEMA.d_lov where upper(dimension_class)='STATE~CHANGE_REQUEST' and UPPER(dimension_name)='CLOSED')map
on chgf.state_src_key=map.row_key
left join #DWH_TABLE_SCHEMA.f_incident incf
on incf.caused_by_change_key=chgf.change_request_key
left join #DWH_TABLE_SCHEMA.f_outage outa1
on incf.incident_key=outa1.incident_key
and incf.caused_by_change_key=outa1.caused_by_change_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cal.row_key=chgf.closed_on_key
)cs
group by 1)SRC
left join #DWH_TABLE_SCHEMA.d_change_failure chg_failure
on chg_failure.change_request_key=SRC.change_request_key
where SRC.outages_for_same_application<>chg_failure.outages_caused_outside_application;

-- using flag from f_outage
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.outages_caused_outside_application' ELSE 'SUCCESS' END as Message
from
(select * from #DWH_TABLE_SCHEMA.d_change_request where soft_deleted_flag='N') chg_d
left join 
(select outf.application_key,outd.caused_by_change_numerify_key,outf.source_id,
case when outd.caused_by_change_flag='N' then count(outd.caused_by_change_flag) else 0 end as outages_caused_outside_application 
from #DWH_TABLE_SCHEMA.f_outage outf
left join #DWH_TABLE_SCHEMA.d_outage outd
on outf.outage_key=outd.row_key
group by 1,2,3)SRC
on chg_d.row_key=SRC.caused_by_change_numerify_key and chg_d.source_id=SRC.source_id
left join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y')TRGT
on SRC.caused_by_change_key=TRGT.change_request_key and TRGT.application_key=SRC.application_key
and SRC.source_id=TRGT.source_id
where SRC.outages_caused_outside_application<>TRGT.outages_caused_outside_application;