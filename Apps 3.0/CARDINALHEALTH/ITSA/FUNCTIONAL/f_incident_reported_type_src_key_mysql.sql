
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.reported_type_src_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM cardinalhealth_mdsdb.incident_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON ( upper(contact_type)= substring(LKP.row_id,25,length(LKP.row_id)) )
 WHERE  LKP.soft_deleted_flag='N' and TRGT.soft_deleted_flag='N'
 and LKP.dimension_class ='CONTACT_TYPE~INCIDENT' and  COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 else -1 end)<> (TRGT.reported_type_src_key)
)a