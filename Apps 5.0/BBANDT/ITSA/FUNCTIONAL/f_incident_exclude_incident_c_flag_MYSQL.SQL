SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM
(
select count(1) as cnt from
 bbandt_mdsdb.incident_final src 
join bbandt_mdwdb.f_incident trgt on src.sys_id =trgt.row_id  and src.sourceinstance=trgt.source_id 
left join bbandt_mdsdb.sys_user_group_final lkp on  src.assignment_group = lkp.sys_id and src.sourceinstance = lkp.sourceinstance
where (case when ((lkp.name not like 'ITSM-LOB-Branchinfo%' and lkp.name not like 'ITSM-LOB-HumanSystems%' and
 lkp.name not like 'ITSM-LOB-CPS%' and lkp.name not like 'ITSM-LOB-LoanServices%' and lkp.name not like 'ITSM-LOB-Wealth%') or lkp.name is  null) then 'N' else 'Y' end <>trgt.exclude_incident_c_flag
 and src.CDCTYPE<>'D' and trgt.soft_deleted_flag='N')
)b ;



