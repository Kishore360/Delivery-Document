
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_case_activity.row_id' ELSE 'SUCCESS' END as Message

FROM (
SELECT TRGT.row_id FROM #DWH_TABLE_SCHEMA.f_hr_case_activity TRGT 
WHERE  TRGT.row_id NOT IN(SELECT SRC.sys_id FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC 
WHERE  SRC.tablename = 'hr_case') 
UNION
SELECT SRC.sys_id FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC 
WHERE SRC.tablename = 'hr_case'
AND SRC.sys_id  NOT IN (SELECT TRGT.row_id FROM #DWH_TABLE_SCHEMA.f_hr_case_activity TRGT)
) Res