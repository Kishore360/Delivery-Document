SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure_ci_class_prior_changes' ELSE 'SUCCESS' END as Message
from
(
SELECT OUTR.infrastructure_change_id, OUTR.ci_class_key, OUTR.sourceinstance, OUTR.dimension_wh_code, OUTR.scheduled_start_date,
OUTR.closed_date,case when OUTR.scheduled_start_date is NULL then 0
when OUTR.scheduled_start_date>OUTR.closed_date then -1
when OUTR.scheduled_start_date>coalesce(OUTR.closed_date,'9999-01-01') then -1 else
( 
select count(*)
from
(
SELECT s1.*, LKP.dimension_wh_code, tgt_for_key.ci_class_key FROM (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D' 
and scheduled_start_date<closed_date) s1
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(change_request_status)) = LKP.src_rowid 
AND s1.sourceinstance = LKP.source_id ) 
left outer join 
(select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') tgt_for_key
on s1.infrastructure_change_id = tgt_for_key.row_id
and s1.sourceinstance = tgt_for_key.source_id
where LKP.dimension_wh_code='CLOSED'
) INN
where coalesce(INN.ci_class_key,1)=coalesce(OUTR.ci_class_key,1) 
AND INN.closed_date< OUTR.scheduled_start_date  
AND INN.infrastructure_change_id<>OUTR.infrastructure_change_id
) end AS ci_class_prior 
from
(
select SRC.infrastructure_change_id, SRC.closed_date, tgt_for_key1.ci_class_key, SRC.scheduled_start_date, SRC.sourceinstance, LKP.dimension_wh_code
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
left outer join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') tgt_for_key1
on SRC.infrastructure_change_id = tgt_for_key1.row_id
and SRC.sourceinstance = tgt_for_key1.source_id
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

where SRC.ci_class_prior<>TGT.ci_class_prior_changes -- and work_start is not null 
