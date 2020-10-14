

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.row_id' ELSE 'SUCCESS' END as Message
-- select count(*) 
 FROM ( SELECT * FROM humana_mdsdb.sys_user_group_final WHERE CDCTYPE<>'D') SRC 
  JOIN humana_mdwdb.d_internal_organization TRGT 
 ON (CONCAT('GROUP~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 join
 humana_mdwdb.d_internal_contact LKP
 on coalesce(CONCAT('INTERNAL_CONTACT~', SRC.manager), 'UNSPECIFIED')=LKP.row_id
 WHERE COALESCE( LKP.row_key,case when SRC.manager is null then 0 else -1 end  )<> COALESCE(TRGT.Manager_key)
