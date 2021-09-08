SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
			FROM
                mcd_mdsdb.us_new_sla_map_final us_sla                  
            LEFT OUTER JOIN
                mcd_mdsdb.cmdb_ci_service_final serv 
                    ON us_sla.business_service = serv.name  
            LEFT OUTER JOIN
                mcd_mdsdb.core_company_final core_company 
                    ON us_sla.assignment_group_vendor=core_company.name  
            LEFT OUTER JOIN
                mcd_mdsdb.sys_user_group_final sys_user_group 
                    ON core_company.sys_id=sys_user_group.u_vendor              
					
 LEFT OUTER JOIN mcd_mdwdb.d_lov l on    COALESCE(CONCAT('PRIORITY~INCIDENT~~~', us_sla.priority),'UNSPECIFIED')=l.row_id
					 
					 join mcd_mdwdb.d_new_sla_conditions_c d1 on 
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
            255) =d1.row_id and us_sla.sourceinstance=d1.source_id
			where coalesce(l.row_key,case when sys_user_group.sys_id is null then 0 else -1 end )<>d1.priority_src_key
			
			