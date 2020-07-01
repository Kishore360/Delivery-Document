SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.close_code_src_code' ELSE 'SUCCESS' END as Message
 FROM(select count(1) as cnt from  truist_mdsdb.incident_final SRC 
 join truist_mdsdb.sys_user_group_final lkp 
on SRC.assignment_group = lkp.sys_id 
and SRC.sourceinstance = lkp.sourceinstance
  JOIN truist_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE lkp.name not like 'ITSM-LOB-Branchinfo%' and lkp.name not like 'ITSM-LOB-HumanSystems%' and name not like 'ITSM-LOB-CPS%'
and lkp.name not like 'ITSM-LOB-LoanServices%' and lkp.name not like 'ITSM-LOB-Wealth%' and ( SRC.close_code)<>TRGT.close_code_src_code
and TRGT.soft_deleted_flag='N' and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma
 ;
