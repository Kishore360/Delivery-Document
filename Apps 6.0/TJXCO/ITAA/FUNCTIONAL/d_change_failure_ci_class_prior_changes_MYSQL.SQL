-- If change_start_on>closed_on ,then the ci_prior_changes value will be -1. ITSM-3636
-- coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -1   ITSM-3632

-- used ci_class_key instead of ci_class from source as it is null in change_request_final.

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure_ci__class_prior_changes' ELSE 'SUCCESS' END as Message
from
(
SELECT OUTR.sys_id, OUTR.ci_class_key, OUTR.sourceinstance, OUTR.dimension_wh_code, coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) as work_start,
case when coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -1 
when OUTR.work_start>coalesce(OUTR.closed_at,'9999-01-01') then -1 else
( 
select count(*)
from
(
SELECT s1.*, LKP.dimension_wh_code, tgt_for_key.ci_class_key FROM (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D' 
and coalesce(work_start,start_date,opened_at)<coalesce(closed_at,'9999-01-01')) s1
LEFT JOIN tjxco_mdwdb.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
AND s1.sourceinstance = LKP.source_id ) 
left outer join 
(select * from tjxco_mdwdb.d_change_failure where current_flag='Y') tgt_for_key
on s1.sys_id = tgt_for_key.row_id
and s1.sourceinstance = tgt_for_key.source_id
where LKP.dimension_wh_code='CLOSED'
) INN
where coalesce(INN.ci_class_key,1)=coalesce(OUTR.ci_class_key,1) 
AND COALESCE(INN.closed_at,INN.sys_updated_on)<coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at)   -- work_start is actual_start_date
AND INN.sys_id<>OUTR.sys_id
) end AS ci_class_prior 
from
(
select SRC.sys_id, SRC.closed_at, tgt_for_key1.ci_class_key, SRC.work_start, SRC.start_date, SRC.opened_at, SRC.sourceinstance, LKP.dimension_wh_code
from (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D' and 
coalesce(work_start,start_date,opened_at)<coalesce(closed_at,'9999-01-01')) SRC
LEFT JOIN tjxco_mdwdb.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
left outer join (select * from tjxco_mdwdb.d_change_failure where current_flag='Y') tgt_for_key1
on SRC.sys_id = tgt_for_key1.row_id
and SRC.sourceinstance = tgt_for_key1.source_id
-- where LKP.dimension_wh_code='CLOSED'
) OUTR

) SRC

left outer join 
(select * from tjxco_mdwdb.d_change_failure where current_flag='Y') TGT
on SRC.sys_id = TGT.row_id
and SRC.sourceinstance = TGT.source_id

where SRC.ci_class_prior<>TGT.ci_class_prior_changes -- and work_start is not null 
