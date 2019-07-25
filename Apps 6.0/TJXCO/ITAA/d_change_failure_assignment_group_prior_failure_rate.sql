																																																																																																																																																																																																																																																																																																																																																																																																																																																																								-- If change_start_on>closed_on ,then the assignment_group_prior_changes value will be -2. ITSM-3636
-- coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -2   ITSM-3632

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure_assignment_group_prior_failure_rate' ELSE 'SUCCESS' END as Message
from
(
select sys_id,  numerify_change_failure_flag, assignment_group_prior_changes, assignment_group, assignment_group_prior_Y,
case when assignment_group_prior_changes=0 then -1 when assignment_group_prior_changes=-1 then -2 
else round((assignment_group_prior_Y/assignment_group_prior_changes),10) end as prior_failure_rate_qa
from
(
SELECT OUTR.sys_id, numerify_change_failure_flag, assignment_group_prior_changes, OUTR.assignment_group, 
-- case when coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -1
-- when OUTR.work_start<=coalesce(OUTR.closed_at,'9999-01-01') then -1 else
( 
select count(*)
from
(
SELECT s1.*, chg.numerify_change_failure_flag, LKP.dimension_wh_code FROM 
(SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D' and 
coalesce(work_start,start_date,opened_at)<coalesce(closed_at,'9999-01-01')) s1
LEFT JOIN (select * from tjxco_mdwdb.d_change_failure where current_flag='Y') chg ON chg.row_id=s1.sys_id 
LEFT JOIN tjxco_mdwdb.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
AND s1.sourceinstance = LKP.source_id ) 
where LKP.dimension_wh_code='CLOSED' and chg.numerify_change_failure_flag='Y'
) INN
where coalesce(INN.assignment_group,1)=coalesce(OUTR.assignment_group,1) 
AND COALESCE(INN.closed_at,INN.sys_updated_on)<coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at)   -- work_start is actual_start_date
AND INN.sys_id<>OUTR.sys_id
) AS assignment_group_prior_Y 
from
(
select SRC.sys_id, SRC.closed_at, SRC.assignment_group, SRC.work_start, SRC.start_date, SRC.opened_at, SRC.sourceinstance, LKP.dimension_wh_code, 
chg.numerify_change_failure_flag, chg.assignment_group_prior_changes
from (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D' and 
coalesce(work_start,start_date,opened_at)<coalesce(closed_at,'9999-01-01')) SRC
LEFT JOIN (select * from tjxco_mdwdb.d_change_failure where current_flag='Y') chg ON chg.row_id=SRC.sys_id 
LEFT JOIN tjxco_mdwdb.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
-- where LKP.dimension_wh_code='CLOSED'
) OUTR
) SRC1
) SRC

left outer join (select * from tjxco_mdwdb.d_change_failure where current_flag='Y') tgt
ON tgt.row_id=SRC.sys_id 

where coalesce(SRC.prior_failure_rate_qa,0)<>coalesce(tgt.assignment_group_prior_failure_rate,0)

