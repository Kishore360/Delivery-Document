
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM truist_mdsdb.incident_final SRC -- 46303
left join truist_mdsdb.sys_user_group_final lkp 
on SRC.assignment_group = lkp.sys_id 
and SRC.sourceinstance = lkp.sourceinstance
 LEFT JOIN truist_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN truist_mdwdb.d_calendar_date LKP1 
on (LKP1.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/New_York"),'%Y%m%d')  and LKP1.source_id=0
)
WHERE COALESCE(LKP1.row_key,-99) <> COALESCE(TRGT.opened_on_key,-99) 
 and ((lkp.name not like 'ITSM-LOB-Branchinfo%' and name not like 'ITSM-LOB-HumanSystems%' and name not like 'ITSM-LOB-CPS%'
and name not like 'ITSM-LOB-LoanServices%' and name not like 'ITSM-LOB-Wealth%') or lkp.name is null);