SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.priority_de_escalated_flag' ELSE 'SUCCESS' END as Message
  FROM ( SELECT Submit_Date, Entry_Id, incident_number, sourceinstance,
  case when priority = 'Critical' then 0 
	when priority = 'High' then 1
    when priority = 'Medium' then 2
    when priority = 'Low' then 3 end as res2
  FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 
 Left JOIN 
  (select Audit_Date, Original_Request_ID,
  replace((substr(substr(Log, INSTR(Log, 'Priority:'), 30),INSTR(substr(Log, INSTR(Log, 'Priority:'), 30), '(' ),2)),'(','') as res1
      from #MDS_TABLE_SCHEMA.hlx_hpd_audit_log_final where Log like '%Priority:%' ) audit
on SRC.Entry_Id = audit.Original_Request_ID
and SRC.Submit_Date = audit.Audit_Date
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 where (case when res1 < res2 then 'Y' else 'N' end) <> priority_de_escalated_flag