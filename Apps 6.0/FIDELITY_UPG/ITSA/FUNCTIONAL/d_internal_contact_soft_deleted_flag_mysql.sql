SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_raise_impact_c' ELSE 'SUCCESS' END as Message


from
( SELECT
                    sys_id,
                    sourceinstance,
                    CASE 
                        WHEN cdctype = 'D' THEN 'Y' 
                        ELSE 'N' 
                    END soft_deleted_flag 
                FROM
                    fidelity_mdsdb.sys_user_final    
                UNION
                SELECT
                    sys_user.sys_id ,
                    sys_user.sourceinstance ,
                    CASE 
                        WHEN sys_user.cdctype = 'D' THEN 'Y' 
                        ELSE 'N' 
                    END soft_deleted_flag 
                FROM
                    fidelity_mdsdb.sys_user_final sys_user    
                JOIN
                   fidelity_mdsdb.core_company_final core_company 
                        ON core_company.sourceinstance=sys_user.sourceinstance 
                        AND core_company.sys_id=sys_user.company 
                ) Driver        
        LEFT OUTER JOIN
            fidelity_mdsdb.sys_user_final sys_user  
                ON sys_user.sys_id = Driver.sys_id 
                AND sys_user.sourceinstance = Driver.sourceinstance 
JOIN
 fidelity_mdwdb.d_internal_contact trgt1
on  CONCAT('INTERNAL_CONTACT~', Driver.sys_id) = trgt1.row_id and sys_user.sourceinstance = trgt1.source_id
where Driver.soft_deleted_flag <>trgt1.soft_deleted_flag and sys_user.cdctype<>'D'

