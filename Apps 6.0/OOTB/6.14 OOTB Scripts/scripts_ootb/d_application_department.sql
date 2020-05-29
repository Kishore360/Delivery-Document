-- mapping it to null as part of JIRA ITSM-3461

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'department validation failed for d_application' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_appl_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_application TRGT 
 ON (concat('APPLICATION~', SRC.sys_id)  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
where TRGT.department is not NULL and row_key not in (0,-1);