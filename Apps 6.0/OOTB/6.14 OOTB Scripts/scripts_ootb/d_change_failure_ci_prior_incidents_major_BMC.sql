SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_failure.ci_prior_incidents' ELSE 'SUCCESS' END as Message
 from 
(
select  SRC1.infrastructure_change_id, SRC1.sourceinstance, LKP.dimension_wh_code,
SRC1.actual_start_date, SRC1.scheduled_start_date, SRC1.submit_date,
sum(case when LKP.dimension_wh_code in ('OPEN','CLOSED') and (inc.opened_on is null or  coalesce(SRC1.actual_start_date,SRC1.scheduled_start_date,SRC1.submit_date) is null) then 0
when LKP.dimension_wh_code in ('OPEN','CLOSED') AND  
	(convert_tz(df.lastupdated, 'America/Los_Angeles', 'GMT')<date_add( coalesce(SRC1.actual_start_date,SRC1.scheduled_start_date,SRC1.submit_date),interval -7 day)) then 0
when LKP.dimension_wh_code in ('OPEN','CLOSED') AND  ((inc.opened_on<= coalesce(SRC1.actual_start_date,SRC1.scheduled_start_date,SRC1.submit_date))
and inc.opened_on>=date_add( coalesce(SRC1.actual_start_date,SRC1.scheduled_start_date,SRC1.submit_date),interval -90 day)) and inc.major_incident_flag='Y'then 1 else 0 END) AS inc_count_major
from
(select * from #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final)SRC1
left join  
(SELECT * FROM #DWH_TABLE_SCHEMA.f_change_request where cdctype<>'D') SRC
on SRC1.infrastructure_change_id=SRC.row_id
left join #DWH_TABLE_SCHEMA.d_lov_map LKP 
on  SRC.state_src_key=LKP.row_key  
and LKP.dimension_class = 'STATE~CHANGE_REQUEST'
and LKP.source_id = SRC.source_id
 LEFT JOIN 
 (select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id 
 ) df 
 ON SRC.source_id = df.source_id
left join #DWH_TABLE_SCHEMA.f_incident inc1
on coalesce(SRC.configuration_item_key,1)=coalesce(inc1.configuration_item_key,1)
left join #DWH_TABLE_SCHEMA.d_incident inc
on inc.row_id=inc1.row_id
group by SRC1.infrastructure_change_id, SRC1.sourceinstance
) SRC

left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.infrastructure_change_id =TRGT.row_id 
AND SRC.sourceinstance =TRGT.source_id )

WHERE (case when coalesce(SRC.actual_start_date,SRC.scheduled_start_date,SRC.submit_date) is null then -1
when SRC.dimension_wh_code='CANCELED' then 0 else COALESCE(SRC.inc_count_major,0) end) <> COALESCE(TRGT.ci_prior_incidents_major,'')