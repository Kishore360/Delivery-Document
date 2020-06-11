SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure_assignee_prior_failure_rate' ELSE 'SUCCESS' END as Message
from
(
select infrastructure_change_id,  numerify_change_failure_flag, assignee_prior_changes, aslogid, assignee_prior_Y,
case when assignee_prior_changes=0 then -1 when assignee_prior_changes=-1 then -2 
else round((assignee_prior_Y/assignee_prior_changes),6) end as prior_failure_rate_qa
from
(
SELECT OUTR.infrastructure_change_id, numerify_change_failure_flag, assignee_prior_changes, OUTR.aslogid, 
-- case when coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -1
-- when OUTR.work_start<=coalesce(OUTR.closed_at,'9999-01-01') then -1 else
( 
select count(*)
from
(
SELECT s1.*, chg.numerify_change_failure_flag, LKP.dimension_wh_code FROM 
(SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D' and 
scheduled_start_date<closed_date) s1
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') chg ON chg.row_id=s1.infrastructure_change_id 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(change_request_status)) = LKP.src_rowid 
AND s1.sourceinstance = LKP.source_id ) 
where LKP.dimension_wh_code='CLOSED' and chg.numerify_change_failure_flag='Y'
) INN
where coalesce(INN.aslogid,1)=coalesce(OUTR.aslogid,1) 
AND INN.closed_date<OUTR.scheduled_start_date   -- work_start is actual_start_date
AND INN.infrastructure_change_id<>OUTR.infrastructure_change_id
) AS assignee_prior_Y 
from
(
select SRC.infrastructure_change_id, SRC.closed_date, SRC.aslogid, SRC.scheduled_start_date, SRC.sourceinstance, LKP.dimension_wh_code, 
chg.numerify_change_failure_flag, chg.assignee_prior_changes
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D' and 
scheduled_start_date<coalesce(closed_date,'9999-01-01'))  SRC
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') chg ON chg.row_id=SRC.infrastructure_change_id 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(change_request_status)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
-- where LKP.dimension_wh_code='CLOSED'
) OUTR
) SRC1
) SRC

left outer join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') tgt
ON tgt.row_id=SRC.infrastructure_change_id 

where coalesce(SRC.prior_failure_rate_qa,0)<>coalesce(tgt.assignee_prior_failure_rate,0)

