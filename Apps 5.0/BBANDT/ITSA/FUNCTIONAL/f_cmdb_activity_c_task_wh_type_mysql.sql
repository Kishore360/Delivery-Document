SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cmdb_activity_c.updated_by' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT Count(1) AS CNT 
FROM bbandt_mdsdb.sys_audit_final SRC 
LEFT JOIN bbandt_mdwdb.f_cmdb_activity_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.tablename,'UNSPECIFIED')<>TRGT.task_wh_type
and
tablename IN (
                    'cmdb_ci_inf_software','cmdb_ci_desktop_software','cmdb_ci_application_software','cmdb_ci_solaris_server','cmdb_ci_ups','u_cmdb_ci_telco_circuit','cmdb_ci_ip_router','cmdb_ci_ip_switch','cmdb_ci_linux_server', 'cmdb_ci_unix_server', 'cmdb_ci_aix_server', 'cmdb_ci_hpux_server', 'u_cmdb_ci_voice_server', 'u_cmdb_ci_zlinux_server', 'cmdb_ci_app_server', 'cmdb_ci_app_server_weblogic', 'cmdb_ci_app_server_datapower', 'cmdb_ci_app_server_websphere', 'cmdb_ci_app_server_jboss', 'cmdb_ci_app_server_jb_module', 'cmdb_ci_app_server_tomcat', 'cmdb_ci_app_server_tomcat_war', 'cmdb_ci_app_server_ws_ear', 'cmdb_ci_ad_controller', 'cmdb_ci_app_server_ws_odr', 'cmdb_ci_appl_ca_dir_server', 'cmdb_ci_ftp_server', 'cmdb_ci_dir_policy_server', 'u_cmdb_ci_appliance_server', 'u_cmdb_ci_as_400_server', 'cmdb_ci_mainframe', 'cmdb_ci_mainframe_lpar', 'cmdb_ci_storage_server', 'u_cmdb_ci_ucos_server', 'cmdb_ci_win_server', 'cmdb_ci_hyper_v_server', 'cmdb_ci_vcenter_server_obj', 'cmdb_ci_esx_server', 'u_cmdb_ci_ucs_server', 'cmdb_ci_apache_web_server' 'cmdb_ci_microsoft_iis_web_server', 'cmdb_ci_nginx_web_server'
                ) 
) temp;


