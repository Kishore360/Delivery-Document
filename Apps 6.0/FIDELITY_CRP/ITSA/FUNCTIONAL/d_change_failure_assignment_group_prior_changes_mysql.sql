-- If change_start_on>closed_on ,then the assignment_group_prior_changes value will be -1. ITSM-3636
-- coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -1   ITSM-3632

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure_assignment_group_prior_changes' ELSE 'SUCCESS' END as Message
from
(
SELECT OUTR.sys_id, OUTR.assignment_group, OUTR.sourceinstance, OUTR.dimension_wh_code, OUTR.work_start,
case when coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -1 
when (OUTR.dimension_wh_code='CLOSED' AND OUTR.work_start>coalesce(OUTR.closed_at,OUTR.sys_updated_on,'9999-01-01')) then -1 else
( 
select count(*)
from
(
SELECT s1.*, LKP.dimension_wh_code FROM (SELECT * FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D' 
and coalesce(work_start,start_date,opened_at)<=coalesce(closed_at,sys_updated_on,'9999-01-01')) s1
LEFT JOIN fidelity_mdwdb.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
AND s1.sourceinstance = LKP.source_id ) 
where LKP.dimension_wh_code='CLOSED'
) INN
where coalesce(INN.assignment_group,1)=coalesce(OUTR.assignment_group,1) 
AND COALESCE(INN.closed_at,INN.sys_updated_on)<coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at)   -- work_start is actual_start_date
AND INN.sys_id<>OUTR.sys_id
) end AS assignment_group_prior 
from
(
select SRC.sys_id, SRC.closed_at, SRC.sys_updated_on, SRC.assignment_group, SRC.work_start, SRC.start_date, SRC.opened_at, SRC.sourceinstance, LKP.dimension_wh_code
from (SELECT * FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D' and 
coalesce(work_start,start_date,opened_at)<coalesce(closed_at,'9999-01-01')) SRC
LEFT JOIN fidelity_mdwdb.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
-- where LKP.dimension_wh_code='CLOSED'
) OUTR

) SRC

left outer join 
(select * from fidelity_mdwdb.d_change_failure where current_flag='Y') TGT
on SRC.sys_id = TGT.row_id
and SRC.sourceinstance = TGT.source_id

where coalesce(SRC.assignment_group_prior,0)<>coalesce(TGT.assignment_group_prior_changes,'')
