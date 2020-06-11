select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_hr_case_activity.task_attribute_wh_old_value_key' else 'SUCCESS' end as Message
from #DWH_TABLE_SCHEMA.f_hr_case_activity ftta 
join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') au on ftta.row_id=au.sys_id and ftta.source_id=au.sourceinstance
 LEFT OUTER JOIN #DWH_TABLE_SCHEMA.d_internal_contact  internal_contact_old 
	ON  internal_contact_old.row_id=concat('INTERNAL_CONTACT~',au.OLDVALUE) 
		AND internal_contact_old.source_id=ftta.source_id 
		AND DATE_FORMAT(ftta.created_on, '%Y-%m-%d %H:%i:%s') 
			BETWEEN internal_contact_old.effective_from AND internal_contact_old.effective_to
 LEFT OUTER JOIN  #DWH_TABLE_SCHEMA.d_internal_contact  internal_contact_new  
	ON  internal_contact_new.row_id=concat('INTERNAL_CONTACT~',au.NEWVALUE) 
		AND internal_contact_new.source_id=ftta.source_id  
		AND DATE_FORMAT(ftta.created_on, '%Y-%m-%d %H:%i:%s') 
			BETWEEN internal_contact_new.effective_from AND internal_contact_new.effective_to
 LEFT OUTER JOIN #DWH_TABLE_SCHEMA.d_internal_organization org_old 
	ON  org_old.row_id=concat('GROUP~',au.OLDVALUE) AND org_old.source_id=ftta.source_id 
		AND DATE_FORMAT(ftta.created_on, '%Y-%m-%d %H:%i:%s') 
			BETWEEN org_old.effective_from AND org_old.effective_to
 LEFT OUTER JOIN  #DWH_TABLE_SCHEMA.d_internal_organization org_new 
	ON  org_new.row_id=concat('GROUP~',au.NEWVALUE) AND org_new.source_id=ftta.source_id 
		AND DATE_FORMAT(ftta.created_on, '%Y-%m-%d %H:%i:%s') 
			BETWEEN org_new.effective_from AND org_new.effective_to
where au.TABLENAME='hr_case'
        and ftta.task_attribute_wh_new_value_key <> (CASE WHEN task_attribute_wh_name = 'assigned_to' 
			THEN COALESCE((CASE WHEN (au.NEWVALUE  is NULL or au.NEWVALUE ='UNSPECIFIED') THEN 0 
								ELSE internal_contact_old.row_key  END  ),-1)
		 WHEN au.FIELDNAME='assignment_group' 
			THEN COALESCE((CASE WHEN (au.NEWVALUE  is NULL or au.NEWVALUE='UNSPECIFIED') THEN 0 
								ELSE org_old.row_key   END  ),-1)
		 END);