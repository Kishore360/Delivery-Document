SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.manager_key' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.sys_user_final src 
 join  qualcomm_mdwdb.d_internal_contact trgt on  coalesce(concat('INTERNAL_CONTACT~',src.sys_id),'UNSPECIFIED')=trgt.row_id 
 and src.sourceinstance=trgt.source_id
        join  qualcomm_mdwdb.d_internal_contact lkp on coalesce(concat('INTERNAL_CONTACT~',src.manager),'UNSPECIFIED')=lkp.row_id
        and src.sourceinstance=lkp.source_id
        where COALESCE(lkp.row_key,CASE WHEN src.manager IS NULL THEN 0 else -1 end) <> (trgt.manager_key) and src.CDCTYPE='X'
		
		
		