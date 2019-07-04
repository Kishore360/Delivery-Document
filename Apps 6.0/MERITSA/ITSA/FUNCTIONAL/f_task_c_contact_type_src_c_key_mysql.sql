SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.task_final SRC
JOIN meritsa_mdwdb.f_task_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
join meritsa_mdwdb.d_lov LKP
on 
CASE    WHEN SRC.sys_class_name ='INCIDENT' THEN COALESCE( CONCAT('CONTACT_TYPE','~','TASK','~',UPPER(SRC.contact_type)),'UNSPECIFIED')

   WHEN SRC.sys_class_name ='U_ASC_TICKET' THEN COALESCE( CONCAT('CONTACT_TYPE','~','U_ASC_TICKET','~',UPPER(SRC.contact_type)),'UNSPECIFIED')

WHEN SRC.sys_class_name ='sn_customerservice_case' THEN COALESCE(

        CONCAT('REPORTED_TYPE','~','CASE','~',UPPER(SRC.contact_type)),'UNSPECIFIED')   

   ELSE COALESCE( CONCAT('CONTACT_TYPE','~','TASK','~',UPPER(SRC.contact_type)),'UNSPECIFIED') END=LKP.row_id
WHERE
SRC.sys_class_name in ('CHANGE_REQUEST','PROBLEM','CHANGE_TASK','PROBLEM_TASK','em_ci_severity_task','FACILITIES','HR_CASE',
'KB_SUBMISSION','PM_PROJECT','PM_PROJECT_TASK','RM_DEFECT','sn_customerservice_case','SYSAPPROVAL_GROUP','TASK',
'TICKET','U_ASC_TICKET','U_INCIDENT_TASK','U_PROBLEM_TASK','U_SHIFT_TURNOVER_REPORT','VTB_TASK') and

 coalesce(LKP.row_key,case when SRC.contact_type is null then  0 else -1 end )<> TRGT.contact_type_src_c_key
