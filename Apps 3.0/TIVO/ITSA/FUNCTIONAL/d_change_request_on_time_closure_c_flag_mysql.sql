 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message

 FROM tivo_mdsdb.change_request_final SRC
  JOIN tivo_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id )
  JOIN tivo_mdsdb.sys_choice_final stat
on stat.value=SRC.state and stat.name='change_request' and stat.element='state'
and stat.inactive='0'
where case when 
SRC.WORK_END>end_date and stat.label in ('Closed','Completed','Closed Incomplete') then 'N'  
when SRC.WORK_END<=end_date  and stat.label in ('Closed','Completed','Closed Incomplete')THEN 'Y'
else 'N/A'end 
<>on_time_closure_c_flag
and TRGT.soft_deleted_flag='N';
#and  stat.name='change_request' and stat.element='state'
