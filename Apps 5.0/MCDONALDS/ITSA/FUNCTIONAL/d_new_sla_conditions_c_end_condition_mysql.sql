

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select count(1) cnt 
			from mcdonalds_mds_viewdb.us_new_sla_map_final us_sla                  
            LEFT OUTER JOIN
                mcdonalds_mdsdb.cmdb_ci_service_final serv 
                    ON us_sla.business_service = serv.name  
            LEFT OUTER JOIN
                mcdonalds_mdsdb.core_company_final core_company 
                    ON us_sla.assignment_group_vendor=core_company.name  
            LEFT OUTER JOIN
                mcdonalds_mdsdb.sys_user_group_final sys_user_group 
                    ON core_company.sys_id=sys_user_group.u_vendor   
				left join mcdonalds_mdwdb.d_internal_organization d on CONCAT('GROUP~',sys_user_group.sys_id)=d.row_id
join mcdonalds_mdwdb.d_new_sla_conditions_c d1 on 
				LEFT(CONCAT( COALESCE(us_sla.sla_name,
            'UNSPECIFIED'),
            '~',
            COALESCE(us_sla.type,
            'UNSPECIFIED'),
            '~',
            COALESCE(sys_user_group.sys_id,
            'UNSPECIFIED'),
            '~',
            COALESCE(us_sla.assignment_group_vendor,
            'UNSPECIFIED'),
            '~',
            COALESCE(us_sla.business_service,
            'UNSPECIFIED'),
            '~',
            COALESCE(us_sla.priority,
            'UNSPECIFIED')),
            255) =d1.row_id and serv.sourceinstance=d1.source_id
			where  us_sla.end_condition<> d1.end_condition)a