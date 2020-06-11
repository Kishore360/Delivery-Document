SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_type' ELSE 'SUCCESS' END as Messages
 FROM ( SELECT * FROM itp_dev_mdsdb.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
 LEFT JOIN(select * from itp_dev_mdsdb.odf_ca_project_final where cdctype<>'D')SRC1
 on SRC.id=SRC1.id
 LEFT JOIN itp_dev_mdwdb.d_project TRGT 
 ON (SRC.id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE COALESCE(SRC1.obj_request_type,'')<> COALESCE(TRGT.project_type,'')