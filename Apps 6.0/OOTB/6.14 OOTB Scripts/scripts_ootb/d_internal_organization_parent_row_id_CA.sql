SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.parent_row_id' ELSE 'SUCCESS' END as Message
FROM  
(select * from #MDS_TABLE_SCHEMA.departments_final  where cdctype<>'D') SRC 
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_internal_organization) TRGT
ON CONCAT('DEPARTMENT','~',SRC.id) =TRGT.row_id  and   SRC.sourceinstance =TRGT.source_id
where COALESCE(case when SRC.PARENT_DEPARTMENT_ID='' then NULL 
else CONCAT('DEPARTMENT','~',SRC.parent_department_id) end,'') <>COALESCE(TRGT.parent_row_id,'')