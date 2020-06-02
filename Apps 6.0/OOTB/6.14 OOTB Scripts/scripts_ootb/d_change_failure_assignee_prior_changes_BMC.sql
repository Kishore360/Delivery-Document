SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure_assignee_prior_changes' ELSE 'SUCCESS' END as Message
from
(
SELECT OUTR.infrastructure_change_id, OUTR.aslogid, OUTR.sourceinstance, OUTR.dimension_wh_code, OUTR.scheduled_start_date,
case when OUTR.scheduled_start_date is NULL then -1  
when (OUTR.dimension_wh_code='CLOSED' AND OUTR.scheduled_start_date>coalesce(OUTR.closed_date,'9999-01-01')) then -1 else
( 
select count(*)
from
(
SELECT s1.*, LKP.dimension_wh_code FROM (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D' 
and scheduled_start_date<=coalesce(closed_date,'9999-01-01')) s1
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(change_request_status)) = LKP.src_rowid 
AND s1.sourceinstance = LKP.source_id ) 
where LKP.dimension_wh_code='CLOSED'
) INN
where coalesce(INN.aslogid,1)=coalesce(OUTR.aslogid,1) 
AND INN.closed_date<OUTR.scheduled_start_date   -- work_start is actual_start_date
AND INN.infrastructure_change_id<>OUTR.infrastructure_change_id
) end AS assigned_to_prior 
from
(
select SRC.infrastructure_change_id, SRC.closed_date, SRC.aslogid, SRC.scheduled_start_date,  SRC.sourceinstance, LKP.dimension_wh_code
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D' and 
scheduled_start_date<coalesce(closed_date,'9999-01-01')) SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(change_request_status)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
-- where LKP.dimension_wh_code='CLOSED'
) OUTR

) SRC

left outer join 
(select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') TGT
on SRC.infrastructure_change_id = TGT.row_id
and SRC.sourceinstance = TGT.source_id

where coalesce(SRC.assigned_to_prior,0)<>coalesce(TGT.assignee_prior_changes,'')