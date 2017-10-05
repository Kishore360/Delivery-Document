SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM   qualcomm_mdsdb.sys_user_group_final src 
        join   qualcomm_mdwdb.d_internal_organization trgt on concat('GROUP~',src.sys_id)=trgt.row_id and src.sourceinstance=trgt.source_id
        where src.u_exclude_from_reports<>trgt.exclude_from_reports_c
		
		