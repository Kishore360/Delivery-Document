


SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between MDS_EMPLOYEE_TERMINATION and f_employee_termination ' ELSE 'SUCCESS' END AS Message 
FROM  <<tenant>>_mdsdb.MDS_EMPLOYEE_TERMINATION met 
LEFT JOIN app_test.lsm_ls_source_timezone tz 
ON (tz.sourceid  = met.source_id  
AND met.source_id IN (0) )
left outer join <<tenant>>_mdwdb.d_calendar_date  last_working_day 
on last_working_day.row_id= DATE_FORMAT(met.last_working_day,'%Y%m%d')
and last_working_day.source_id=0
left outer join <<tenant>>_mdwdb.d_calendar_date  termination_date 
on termination_date.row_id=DATE_FORMAT(met.termination_date,'%Y%m%d') 
and termination_date.source_id=0
left outer join <<tenant>>_mdwdb.d_calendar_date  notice_date
on notice_date.row_id=DATE_FORMAT(met.notice_date,'%Y%m%d') 
and notice_date.source_id=0 
left outer join <<tenant>>_mdwdb.d_calendar_date  transaction_date 
on transaction_date.row_id=DATE_FORMAT(met.transaction_date,'%Y%m%d')
and transaction_date.source_id=0  
LEFT OUTER JOIN <<tenant>>_mdwdb.d_hr_employee employee 
ON employee.identification_number=met.employee_id 
AND employee.source_id=met.source_id  
and met.last_working_day between employee.effective_from  and employee.effective_to
WHERE met.source_id  in (0)
AND CRC32(CONCAT(
COALESCE(UPPER(CONCAT(COALESCE(met.report_work_week,''),'~',met.employee_id)),'UNSPECIFIED') 
,met.source_id,
COALESCE((CASE WHEN met.employee_id is null THEN 0 ELSE employee.row_key END  ),-1) ,  
 met.report_work_week,  met.transaction_id ,  
coalesce((case when met.last_working_day  is null then 0 else last_working_day.row_key end  ),-1)   ,  
coalesce((case when met.termination_date is null then 0 else termination_date.row_key end  ),-1)  ,  
coalesce((case when met.notice_date is null then 0 else notice_date.row_key end  ),-1)  ,
coalesce((case when met.transaction_date is null then 0 else transaction_date.row_key end  ),-1) ,
met.termination_reason,  'N' ,  met.soft_deleted_flag,  met.created_by,  
coalesce( met.created_by, NULL) ,  met.created_on ,  
coalesce( met.created_on, NULL))
)
NOT IN (
SELECT CRC32(CONCAT(row_id,source_id, employee_key,report_work_week, transaction_id, 
last_working_day_key,termination_date_key,notice_date_key,transaction_date_key,
termination_reason,  compliance_flag, soft_deleted_flag, created_by, changed_by, created_on , changed_on )
)
FROM <<tenant>>_mdwdb.f_employee_termination)

