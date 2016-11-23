d_access_application_c_name_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.u_access_application_final d_cr 
JOIN intuit_mdwdb.d_access_application_c f_cr ON sys_id=row_id and sourceinstance=source_id
WHERE d_cr.u_name <> f_cr.name


d_access_application_c_siiq_cert_flag_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.u_access_application_final d_cr 
JOIN intuit_mdwdb.d_access_application_c f_cr ON sys_id=row_id and sourceinstance=source_id
where
CASE
			WHEN d_cr.u_siiq_cert = 1
			 AND d_cr.u_type = 'Type2' THEN 'Y'
		ELSE 'N'
		END<>siiq_cert_flag
		
d_access_application_c_type_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.u_access_application_final d_cr 
JOIN intuit_mdwdb.d_access_application_c f_cr ON sys_id=row_id and sourceinstance=source_id
where
u_type<>type




d_access_application_c_siiq_term_flag_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.u_access_application_final d_cr 
JOIN intuit_mdwdb.d_access_application_c f_cr ON sys_id=row_id and sourceinstance=source_id
where
CASE
			WHEN d_cr.u_siiq_term = 1
			 AND d_cr.u_type = 'Type2' THEN 'Y'
		ELSE 'N'
		END
		<>siiq_cert_flag
		
		
		
		
d_configuration_application_c_related_columns_mysql


SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.cmdb_ci_appl_final i 
JOIN intuit_mdwdb.d_configuration_application_c f_cr ON sys_id=row_id and sourceinstance=source_id
where
i.asset_tag<>f_cr.asset_tag or
		i.assigned_to<>f_cr.assigned_to or
		i.category<>f_cr.category or
		i.department<>f_cr.department or
		i.location<>f_cr.location or
		i.managed_by<>f_cr.managed_by or
		i.manufacturer<>f_cr.manufacturer or
		i.model_number<>f_cr.model_number or
		i.name<>f_cr.name or
		i.owned_by<>f_cr.owned_by or
		i.subcategory<>f_cr.subcategory or
		i.sys_class_name<>f_cr.class


		

		
d_configuration_application_c_change_control_key_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.cmdb_ci_appl_final i 
JOIN intuit_mdwdb.d_internal_organization d_cr ON COALESCE(CONCAT('GROUP~',i.change_control),'UNSPECIFIED')=row_id and sourceinstance=source_id
join intuit_mdwdb.d_configuration_application_c f_cr  on sys_id=f_cr.row_id and sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when change_control is null then 0 else -1 end )<>f_cr.change_control_key 

d_configuration_application_c_support_group_key_mysql



SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.cmdb_ci_appl_final i 
JOIN intuit_mdwdb.d_internal_organization d_cr ON COALESCE(CONCAT('GROUP~',i.support_group),'UNSPECIFIED')=row_id and sourceinstance=source_id
join intuit_mdwdb.d_configuration_application_c f_cr  on sys_id=f_cr.row_id and sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when support_group is null then 0 else -1 end )<>f_cr.support_group_key




d_configuration_application_c_domain_key_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.cmdb_ci_appl_final i 
JOIN intuit_mdwdb.d_domain d_cr ON sys_domain=row_id and sourceinstance=source_id
join intuit_mdwdb.d_configuration_application_c f_cr  on sys_id=f_cr.row_id and sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when sys_domain is null then 0 else -1 end )<>f_cr.domain_key 



		

d_access_l1_c_type_name_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.u_access_l1_final i 
JOIN intuit_mdwdb.d_access_l1_c f_cr ON sys_id=row_id and sourceinstance=source_id
where
i.u_type<>f_cr.type or
		i.u_name<>f_cr.name


d_bufg_c_logical_org_group_mysql -- need to check -- 



SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.u_bufg_final i 
JOIN intuit_mdwdb.d_bufg_c f_cr ON sys_id=row_id and sourceinstance=source_id
where
i.u_logical_org_group<>f_cr.logical_org_group or
		i.u_name<>f_cr.name



d_incident_task_c_company_name_mysql -- need to run again --

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
from intuit_mdsdb.u_incident_task_final src
join intuit_mdwdb.d_incident_task_c tgt on tgt.row_id = src.sys_id  AND tgt.source_id = src.sourceinstance 
where 'N' <> exclude_flag
or CONCAT('<a href=\"','https://intuit.service-now.com/nav_to.do?uri=','u_incident_task.do?sys_id=',src.sys_id,'\" target=\"_blank\">',src.number,'</a>') <> source_url
or u_inin_interaction_id<>inin_interaction_c_id;

f_kb_task_c_incident_task_c_key_mysql 


SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.m2m_kb_task_final i 
 LEFT JOIN intuit_mdsdb.task_final b
    on i.task=b.sys_id
    and b.sys_class_name<>'ticket'
JOIN intuit_mdwdb.d_incident_task_c d_cr ON COALESCE( CASE WHEN b.sys_class_name='u_incident_task' then i.task end,'UNSPECIFIED')=row_id and i.sourceinstance=source_id
join intuit_mdwdb.f_kb_task_c f_cr  on i.sys_id=f_cr.row_id and i.sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when sys_class_name is null then 0 else -1 end )<>f_cr.incident_task_c_key 

d_access_environments_c_environment_mysql -- need to check --

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
from intuit_mdsdb.u_access_environments_final src
join intuit_mdwdb.d_access_environments_c tgt on tgt.row_id = src.sys_id  AND tgt.source_id = src.sourceinstance 
where u_environment <> environment

d_configuration_item_bufg14_c_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
from
intuit_mdwdb.d_configuration_item a
JOIN intuit_mdsdb.cmdb_ci_final b ON a.row_id =b.sys_id
 AND a.source_id=b.sourceinstance
LEFT JOIN intuit_mdsdb.u_bufg_final c ON b.u_bufg_l2=c.sys_id
LEFT JOIN intuit_mdsdb.u_bufg_final d ON b.u_bufg_l3=d.sys_id
LEFT JOIN intuit_mdsdb.u_bufg_final e ON b.u_bufgl4=e.sys_id
where a.bufg14_c<>e.u_name

d_incident_detected_by_c_key_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
from intuit_mdsdb.incident_final a
left join intuit_mdwdb.d_lov c on COALESCE(CONCAT('DETECTED_BY~INCIDENT','~','','~','','~',a.u_detected_by),'UNSPECIFIED')=c.row_id
join 
 intuit_mdwdb.d_incident b on b.row_id=a.sys_id and b.source_id=a.sourceinstance
where coalesce(c.row_key,case when a.u_detected_by is null then 0 else -1 end )<>b.detected_by_c_key

d_outage_c_multiple_columns_mysql

 SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
from intuit_mdsdb.cmdb_ci_outage_final src
join intuit_mdwdb.d_outage_c tgt on tgt.row_id = src.sys_id  AND tgt.source_id = src.sourceinstance 
where source_url_c <> CONCAT('<a href=\"','https://intuit.service-now.com/nav_to.do?uri=','cmdb_ci_outage.do?sys_id=',tgt.row_id,'\" target=\"_blank\">',tgt.outage_number,'</a>')
or 'N'<>exclude_flag
or src.short_description<>tgt.short_description;

f_outage_c_duration_mysql


SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
	   from intuit_mdsdb.cmdb_ci_outage_final src
join intuit_mdwdb.f_outage_c tgt on tgt.row_id = src.sys_id  AND tgt.source_id = src.sourceinstance 
	   where tgt.duration <> TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.duration)
	   
	   f_outage_c_outage_c_key_mysql
	   
SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
	   from intuit_mdsdb.cmdb_ci_outage_final src	   
	   join intuit_mdwdb.d_outage_c d on d.row_id = src.sys_id  AND d.source_id = src.sourceinstance
join intuit_mdwdb.f_outage_c tgt on tgt.row_id = src.sys_id  AND tgt.source_id = src.sourceinstance 	    
where coalesce(d.row_key,case when sys_id is null then 0 else -1 end)<>outage_c_key

d_kb_knowledge_c_source_url_mysql

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where 
CONCAT('<a href=\"','https://intuit.service-now.com/nav_to.do?uri=','kb_knowledge.do?sys_id=',src.sys_id,'\" target=\"_blank\">',src.number,'</a>') <> source_url
) temp

d_kb_knowledge_c_author_key_mysql

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_internal_contact lkp
 ON ( concat('INTERNAL_CONTACT~',src.author))= lkp.row_id 
AND src.sourceinstance= lkp.source_id 
where 
lkp.row_key <> tgt.author_key
) temp


d_request_item_ritm_reported_type_src_c_key_mysql

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from 
intuit_mdsdb.sc_req_item_final b 
join intuit_mdwdb.d_lov a  on COALESCE(CONCAT('CONTACT_TYPE~SC_REQ_ITEM','~','','~','','~',UPPER(b.contact_type)),'UNSPECIFIED')=a.row_id
join intuit_mdwdb.d_request_item c ON a.row_id = b.sys_id  AND a.source_id=b.sourceinstance
where c.ritm_reported_type_src_c_key = coalesce(a.row_key,case when b.contact_type is  null then 0 else -1 end  ))a

d_service_delivery_team_l4s_c_name_mysql


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM 
(select count(1) as cnt from 
intuit_mdsdb.u_service_delivery_team_l4s_final
join intuit_mdwdb.d_service_delivery_team_l4s_c on sys_id=row_id and sourceinstance=source_id
where u_name<>name)a

f_change_request_approved_to_close_duration_c_mysql

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(1) as cnt from 
intuit_mdwdb.f_change_request a
INNER JOIN intuit_mdsdb.change_request_final b ON a.row_id = b.sys_id
  AND a.source_id=b.sourceinstance
where a.approved_to_close_duration_c <> TIMESTAMPDIFF(SECOND,approval_set,closed_at))a;

f_incident_sub_type_code_c_mysql

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM
intuit_mdwdb.f_incident a
INNER JOIN intuit_mdsdb.incident_final b ON a.row_id = b.sys_id
  AND a.source_id=b.sourceinstance
where a.sub_type_code_c <> b.u_sub_type


f_kb_task_c_kb_knowledge_c_key_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.m2m_kb_task_final i 
 LEFT JOIN intuit_mdsdb.task_final b
    on i.task=b.sys_id
    and b.sys_class_name<>'ticket'
JOIN intuit_mdwdb.d_incident_task_c d_cr ON COALESCE(i.kb_knowledge,'UNSPECIFIED')=row_id and i.sourceinstance=source_id
join intuit_mdwdb.f_kb_task_c f_cr  on i.sys_id=f_cr.row_id and i.sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when kb_knowledge is null then 0 else -1 end )<>f_cr.kb_knowledge_c_key 

f_problem_close_code_src_c_key_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.problem_final i 
JOIN intuit_mdwdb.d_problem d_cr ON COALESCE(CONCAT('CLOSE_CODE~PROBLEM','~','~','~',UPPER(i.u_close_code)),'UNSPECIFIED')=row_id and i.sourceinstance=source_id
join intuit_mdwdb.f_problem f_cr  on i.sys_id=f_cr.row_id and i.sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when u_close_code is null then 0 else -1 end )<>f_cr.close_code_src_c_key 

f_problem_sub_type_src_c_key_mysql

SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.problem_final i 
JOIN intuit_mdwdb.d_problem d_cr ON COALESCE(CONCAT('SUB_TYPE~PROBLEM','~','~','~',i.u_sub_type),'UNSPECIFIED')=row_id and i.sourceinstance=source_id
join intuit_mdwdb.f_problem f_cr  on i.sys_id=f_cr.row_id and i.sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when u_sub_type is null then 0 else -1 end )<>f_cr.sub_type_src_c_key

