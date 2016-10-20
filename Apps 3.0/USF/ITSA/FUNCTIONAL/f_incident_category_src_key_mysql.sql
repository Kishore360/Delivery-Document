SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.category_src_key' ELSE 'SUCCESS' END as Message
FROM usf_mdsdb.incident_final SRC 
 LEFT JOIN usf_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
left OUTER join usf_mdsdb.sc_category_final c
on (SRC.u_csi_category=c.sys_id)
LEFT JOIN usf_mdwdb.d_lov LKP 
 ON CASE WHEN SRC.opened_at<'2014-08-14 00:00:00'  THEN COALESCE( CONCAT('CATEGORY','~','INCIDENT','~','~','~',UPPER(SRC.u_csi_category)),'UNSPECIFIED')  ELSE COALESCE( CONCAT('CATEGORY','~','INCIDENT','~','~','~',UPPER(c.u_csi_category)),'UNSPECIFIED') END= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN (CASE WHEN SRC.opened_at<'2014-08-14 00:00:00'  THEN CONCAT('CATEGORY','~','INCIDENT','~','~','~',UPPER(SRC.u_csi_category))  ELSE CONCAT('CATEGORY','~','INCIDENT','~','~','~',UPPER(c.u_csi_category)) end ) IS NULL THEN 0 else -1 end)<>(TRGT.category_src_key) 
