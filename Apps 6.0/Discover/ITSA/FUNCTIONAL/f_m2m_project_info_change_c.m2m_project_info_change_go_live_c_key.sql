SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_m2m_project_info_change_c.m2m_project_info_change_go_live_c_key' ELSE 'SUCCESS' END as Message 
FROM discover_mdsdb.u_m2m_project_info_change_final  SRC 
JOIN discover_mdsdb.change_request_final SRC_LKP ON SRC.u_change_request=SRC_LKP.sys_id 
and SRC.sourceinstance=SRC_LKP.sourceinstance AND SRC_LKP.u_project_related='yes'
JOIN discover_mdwdb.f_m2m_project_info_change_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN discover_mdwdb.d_lov LKP ON (CONCAT('U_GO_LIVE_C~M2M_PROJECT_INFO_CHANGE_C~',SRC.u_go_live) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_go_live IS NULL THEN 0 else -1 end) <> (TRGT.m2m_project_info_change_go_live_c_key)  and SRC.cdctype='X'