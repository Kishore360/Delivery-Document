SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_cmdb_activity_c.updated_by' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT Count(1) AS CNT 
FROM truist_mdsdb.sys_audit_final SRC
left outer join 
(SELECT
            sys_dictionary.column_label AS column_label,
            sys_dictionary.element AS element,
            sys_dictionary.sourceinstance AS source_id,
            concat(sys_dictionary.element,
            '~',
            sys_dictionary.column_label) AS row_id        
        FROM
            truist_mdsdb.sys_dictionary_final sys_dictionary      
        INNER JOIN
            ( SELECT
            sys_dictionary.sourceinstance AS source_id,
            sys_dictionary.element AS row_id,
            MAX(sys_dictionary.sys_created_on) AS sys_created_on,
            sys_dictionary.element AS element    
        FROM
           truist_mdsdb.sys_dictionary_final sys_dictionary         
        WHERE
            sys_dictionary.name in(
                'cmdb','cmdb_ci','cmdb_ci_computer','cmdb_ci_server','cmdb_ci_netgear','cmdb_ci_spkg','u_cmdb_ci_telco_circuit'
            )  
            and sys_dictionary.element is not null    
        GROUP BY
            1,
            2,
            4 ) t_sys_dictionary_f_cmdb_activity_c_tmp1_truist 
                ON sys_dictionary.element=t_sys_dictionary_f_cmdb_activity_c_tmp1_truist.element 
                and sys_dictionary.sys_created_on=t_sys_dictionary_f_cmdb_activity_c_tmp1_truist.sys_created_on    
        WHERE
            sys_dictionary.name in(
                'cmdb','cmdb_ci','cmdb_ci_computer','cmdb_ci_server','cmdb_ci_netgear','cmdb_ci_spkg','u_cmdb_ci_telco_circuit'
            )  
            and sys_dictionary.element is not null 
        group by
            element,
            column_label,
            sourceinstance   ) b
             ON SRC.fieldname=b.element  
LEFT JOIN truist_mdwdb.f_cmdb_activity_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE case 
                    when b.column_label is null then SRC.fieldname 
                    else b.column_label 
                end<>TRGT.task_attribute_wh_name
and
tablename IN (
                    'cmdb_ci_inf_software','cmdb_ci_desktop_software','cmdb_ci_application_software','cmdb_ci_solaris_server','cmdb_ci_ups','u_cmdb_ci_telco_circuit','cmdb_ci_ip_router','cmdb_ci_ip_switch','cmdb_ci_linux_server', 'cmdb_ci_unix_server', 'cmdb_ci_aix_server', 'cmdb_ci_hpux_server', 'u_cmdb_ci_voice_server', 'u_cmdb_ci_zlinux_server', 'cmdb_ci_app_server', 'cmdb_ci_app_server_weblogic', 'cmdb_ci_app_server_datapower', 'cmdb_ci_app_server_websphere', 'cmdb_ci_app_server_jboss', 'cmdb_ci_app_server_jb_module', 'cmdb_ci_app_server_tomcat', 'cmdb_ci_app_server_tomcat_war', 'cmdb_ci_app_server_ws_ear', 'cmdb_ci_ad_controller', 'cmdb_ci_app_server_ws_odr', 'cmdb_ci_appl_ca_dir_server', 'cmdb_ci_ftp_server', 'cmdb_ci_dir_policy_server', 'u_cmdb_ci_appliance_server', 'u_cmdb_ci_as_400_server', 'cmdb_ci_mainframe', 'cmdb_ci_mainframe_lpar', 'cmdb_ci_storage_server', 'u_cmdb_ci_ucos_server', 'cmdb_ci_win_server', 'cmdb_ci_hyper_v_server', 'cmdb_ci_vcenter_server_obj', 'cmdb_ci_esx_server', 'u_cmdb_ci_ucs_server', 'cmdb_ci_apache_web_server' 'cmdb_ci_microsoft_iis_web_server', 'cmdb_ci_nginx_web_server'
                ) 
) temp;


