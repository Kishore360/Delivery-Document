

-- -- Actual start date = work_start, planned_start_date - start_date, opened - opened_at, planned_end_date-end_date, end_date-closed_at

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_failure.ci_prior_incidents_major' ELSE 'SUCCESS' END as Message
from 

(
select  SRC1.sys_id, SRC1.sourceinstance, LKP.dimension_wh_code,
-- SRC1.cmdb_ci, LKP.dimension_wh_code, inc.opened_at inc_open,
SRC1.work_start, SRC1.start_date , df.lastupdated, SRC1.SRC1.opened_at,
sum(case -- when LKP.dimension_wh_code in ('CLOSED') AND (inc.opened_at is null or SRC1.work_start is null) then 0
-- when LKP.dimension_wh_code in ('CLOSED') AND  (inc.opened_at<=SRC1.work_start and inc.opened_at>=date_add(SRC1.work_start,interval -90 day)) 
--       and incf.major_incident_flag='Y' then 1
when LKP.dimension_wh_code in ('OPEN','CLOSED') and (inc.opened_at is null or  coalesce(SRC1.work_start,SRC1.start_date,SRC1.opened_at) is null) then 0
when LKP.dimension_wh_code in ('OPEN','CLOSED') AND  
	(convert_tz(df.lastupdated, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')<date_add(coalesce(SRC1.work_start,SRC1.start_date,SRC1.opened_at),interval -90 day)) then 0
when LKP.dimension_wh_code in ('OPEN','CLOSED') AND  (inc.opened_at<= coalesce(SRC1.work_start,SRC1.start_date,SRC1.opened_at) and 
inc.opened_at>=date_add( coalesce(SRC1.work_start,SRC1.start_date,SRC1.opened_at),interval -90 day)) and incf.major_incident_flag='Y' then 1
else 0	
END) AS inc_count_major
from
(SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC1
left join #DWH_TABLE_SCHEMA.d_lov_map LKP 
on  SRC1.state=LKP.dimension_code  
and LKP.dimension_class = 'STATE~CHANGE_REQUEST'
and LKP.source_id = SRC1.sourceinstance
 LEFT JOIN 
 (select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
 group by source_id 
 ) df 
 ON SRC1.sourceinstance = df.source_id
left join #MDS_TABLE_SCHEMA.incident_final inc
on coalesce(SRC1.cmdb_ci,1)=coalesce(inc.cmdb_ci,1) and SRC1.sourceinstance=inc.sourceinstance
left join #DWH_TABLE_SCHEMA.d_incident incf
on incf.row_id=inc.sys_id and incf.source_id=inc.sourceinstance
group by SRC1.sys_id, SRC1.sourceinstance
) SRC

left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.sys_id =TRGT.row_id 
AND SRC.sourceinstance =TRGT.source_id )

WHERE (case when coalesce(SRC.work_start,SRC.start_date,SRC.opened_at) is null then -1
when SRC.dimension_wh_code='CANCELED' then 0 else COALESCE(SRC.inc_count_major,0) end) <> COALESCE(TRGT.ci_prior_incidents_major,'')