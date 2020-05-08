 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from

(select a.number as CHG_number,numerify_change_failure_flag trgt_Failure_flag, coalesce(a.close_code,'UNSP'),
coalesce(u_reason_for_unsuccessful,'UNSP'),coalesce(close_notes,'UNSP'), coalesce(a.u_service_type,'UNSP'),
a.state,coalesce(sys_choice.label,'UNSP'),change_caused_incident_c_flag ,
Case when 
(change_caused_incident_c_flag='Y'
or (
coalesce(a.close_code,'UNSP') in ('Unsuccessful')
and 
( chg_compliance_auto_close_c_flag ='N'
  )))
 
and 
(coalesce(sys_choice.label,'UNSP')  in ('Implement', 'Review', 'Closed') and 
 coalesce(a.close_code,'UNSP') not in ('Rejected','Withdrawn / Cancelled') and 
 coalesce(a.u_service_type,'UNSP')  not in ('Non-Production', 'Notification Only')) then 'Y' 

 when (coalesce(sys_choice.label,'UNSP') not in ('Implement', 'Review', 'Closed') or 
 coalesce(a.close_code,'UNSP') in ('Rejected','Withdrawn / Cancelled') or 
 coalesce(a.u_service_type,'UNSP') in ('Non-Production', 'Notification Only'))
  or 
 (
 ( chg_compliance_auto_close_c_flag ='Y' )
 and
 (change_caused_incident_c_flag='N')
  
 ) then 'X' 
 
 else 'N' end as Failure_flag

  from   png_mdsdb.change_request_final a 
 left join png_mdsdb.sys_choice_final sys_choice
  on  a.state=sys_choice.value and sys_choice.name='change_request' and sys_choice.element='state' and sys_choice.language='en' 
  and  a.cdctype<>'D'
 join  png_mdwdb.d_change_failure d on a.sys_id=d.row_id and d.source_id=2 and sys_choice.label <> 'Canceled' and current_flag='Y'
 -- where -- a.number='CHG0047271'
 )a
where trgt_Failure_flag<>Failure_flag)a