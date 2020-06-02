SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.changed_on' ELSE 'SUCCESS' END as Message
FROM  
(select * from #MDS_TABLE_SCHEMA.departments_final  where cdctype<>'D') SRC 
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_internal_organization) TRGT
ON CONCAT('DEPARTMENT','~',SRC.id) =TRGT.row_id  and   SRC.sourceinstance =TRGT.source_id
where COALESCE(CONVERT_TZ(SRC.LAST_UPDATED_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> COALESCE(TRGT.changed_on,'')	
