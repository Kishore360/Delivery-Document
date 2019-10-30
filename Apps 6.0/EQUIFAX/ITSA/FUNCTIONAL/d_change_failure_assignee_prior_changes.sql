-- If change_start_on>closed_on ,then the assignee_prior_changes value will be -1. ITSM-3636
-- Actual start date = work_start, planned_start_date - start_date, opened - opened_at
-- coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -1   ITSM-3632



-- Validation Query
-- select assigned_to, coalesce(work_start,start_date,opened_at) as open_date, closed_at
-- from extract_merge_c_mdsdb.change_request_final 
-- where sys_id= 'b8da8fe9db37b30090abd855ca96198c';
-- SELECT closed_at, LKP.dimension_wh_code FROM 
-- (SELECT * FROM extract_merge_c_mdsdb.change_request_final WHERE 
-- assigned_to= '95306cf7dbe41f402e63e5b74b9619b5' and CDCTYPE<>'D') s1
-- LEFT JOIN equifax_mdwdb.d_lov_map LKP 
--  ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
-- AND s1.sourceinstance = LKP.source_id ) 
-- where LKP.dimension_wh_code='CLOSED';

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure_assignee_prior_changes' ELSE 'SUCCESS' END as Message
from
(
SELECT OUTR.sys_id, OUTR.assigned_to, OUTR.sourceinstance, OUTR.dimension_wh_code, OUTR.work_start,
case when coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at) is NULL then -1  
when (OUTR.dimension_wh_code='CLOSED' AND OUTR.work_start>coalesce(OUTR.closed_at,OUTR.sys_updated_on,'9999-01-01')) then -1 else
( 
select count(*)
from
(
SELECT s1.*, LKP.dimension_wh_code FROM (SELECT * FROM equifax_mdsdb.change_request_final WHERE CDCTYPE<>'D' 
and coalesce(work_start,start_date,opened_at)<=coalesce(closed_at,sys_udpated_on,'9999-01-01')) s1
LEFT JOIN equifax_mdwdb.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
AND s1.sourceinstance = LKP.source_id ) 
where LKP.dimension_wh_code='CLOSED'
) INN
where coalesce(INN.assigned_to,1)=coalesce(OUTR.assigned_to,1) 
AND COALESCE(INN.closed_at,INN.sys_updated_on)<coalesce(OUTR.work_start,OUTR.start_date,OUTR.opened_at)   -- work_start is actual_start_date
AND INN.sys_id<>OUTR.sys_id
) end AS assigned_to_prior 
from
(
select SRC.sys_id, SRC.closed_at, SRC.assigned_to, SRC.sys_updated_on, SRC.work_start, SRC.start_date, SRC.opened_at, SRC.sourceinstance, LKP.dimension_wh_code
from (SELECT * FROM equifax_mdsdb.change_request_final WHERE CDCTYPE<>'D' and 
coalesce(work_start,start_date,opened_at)<coalesce(closed_at,'9999-01-01')) SRC
LEFT JOIN equifax_mdwdb.d_lov_map LKP 
 ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
-- where LKP.dimension_wh_code='CLOSED'
) OUTR

) SRC

left outer join 
(select * from equifax_mdwdb.d_change_failure where current_flag='Y') TGT
on SRC.sys_id = TGT.row_id
and SRC.sourceinstance = TGT.source_id

where coalesce(SRC.assigned_to_prior,0)<>coalesce(TGT.assignee_prior_changes,'')


