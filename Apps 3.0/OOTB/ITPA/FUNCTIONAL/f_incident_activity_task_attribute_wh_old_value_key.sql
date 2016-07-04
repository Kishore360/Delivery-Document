select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for task_attribute_wh_old_value_key' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident_activity ftta join <<tenant>>_mdsdb.sys_audit_final au on ftta.row_id=au.sys_id and ftta.source_id=au.sourceinstance
 LEFT OUTER JOIN d_internal_contact  internal_contact_old 
	ON  internal_contact_old.row_id=concat('INTERNAL_CONTACT~',au.OLDVALUE) 
		AND internal_contact_old.source_id=ftta.source_id 
		AND DATE_FORMAT(ftta.created_on, '%Y-%m-%d %H:%i:%s') 
			BETWEEN internal_contact_old.effective_from AND internal_contact_old.effective_to
 LEFT OUTER JOIN  d_internal_contact  internal_contact_new  
	ON  internal_contact_new.row_id=concat('INTERNAL_CONTACT~',au.NEWVALUE) 
		AND internal_contact_new.source_id=ftta.source_id  
		AND DATE_FORMAT(ftta.created_on, '%Y-%m-%d %H:%i:%s') 
			BETWEEN internal_contact_new.effective_from AND internal_contact_new.effective_to
 LEFT OUTER JOIN d_internal_organization org_old 
	ON  org_old.row_id=concat('GROUP~',au.OLDVALUE) AND org_old.source_id=ftta.source_id 
		AND DATE_FORMAT(ftta.created_on, '%Y-%m-%d %H:%i:%s') 
			BETWEEN org_old.effective_from AND org_old.effective_to
 LEFT OUTER JOIN  d_internal_organization org_new 
	ON  org_new.row_id=concat('GROUP~',au.NEWVALUE) AND org_new.source_id=ftta.source_id 
		AND DATE_FORMAT(ftta.created_on, '%Y-%m-%d %H:%i:%s') 
			BETWEEN org_new.effective_from AND org_new.effective_to
 LEFT OUTER JOIN d_lov lov_old 
 	ON  lov_old.row_id=CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(au.OLDVALUE)) 
		AND lov_old.source_id=ftta.source_id 
 LEFT OUTER JOIN  d_lov lov_new  
  	ON  lov_new.row_id=CONCAT('STATE','~','INCIDENT','~','~','~',UPPER(au.NEWVALUE)) 
		AND lov_new.source_id=ftta.source_id 
		where au.TABLENAME='incident'
        and ftta.task_attribute_wh_old_value_key <> (CASE WHEN task_attribute_wh_name = 'assigned_to' 
			THEN COALESCE((CASE WHEN (au.OLDVALUE  is NULL or au.OLDVALUE='UNSPECIFIED') THEN 0 
								ELSE internal_contact_old.row_key  END  ),-1)
		 WHEN au.FIELDNAME='assignment_group' 
			THEN COALESCE((CASE WHEN (au.OLDVALUE  is NULL or au.OLDVALUE='UNSPECIFIED') THEN 0 
								ELSE org_old.row_key   END  ),-1)
		 WHEN au.FIELDNAME='state' 
			THEN COALESCE((CASE WHEN (au.OLDVALUE  is NULL or au.OLDVALUE='UNSPECIFIED') THEN 0 
								ELSE lov_old.row_key   END  ),-1) END)
                                

