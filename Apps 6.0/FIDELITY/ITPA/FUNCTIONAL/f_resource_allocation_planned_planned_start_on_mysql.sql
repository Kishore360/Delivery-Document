SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
from
                ( SELECT
                    POSITION_FORECAST_ID,
                    sourceinstance,
                    CASE 
                        WHEN cdctype = 'D' THEN 'Y' 
                        ELSE 'N' 
                    END soft_deleted_flag 
                FROM
                   fidelity_mdsdb.hp_rsc_position_forecast_final    
                UNION
                SELECT
                    rsc_position_forecast.POSITION_FORECAST_ID ,
                    rsc_position_forecast.sourceinstance ,
                    CASE 
                        WHEN rsc_position_forecast.cdctype = 'D' THEN 'Y' 
                        ELSE 'N' 
                    END soft_deleted_flag 
                FROM
                    fidelity_mdsdb.hp_rsc_position_forecast_final rsc_position_forecast    
                JOIN
                    fidelity_mdsdb.hp_rsc_positions_final rsc_positions 
                        ON rsc_position_forecast.POSITION_ID=rsc_positions.POSITION_ID 
                        and rsc_position_forecast.sourceinstance=rsc_positions.sourceinstance 
                UNION
                SELECT
                    rsc_position_forecast.POSITION_FORECAST_ID ,
                    rsc_position_forecast.sourceinstance ,
                    CASE 
                        WHEN rsc_position_forecast.cdctype = 'D' THEN 'Y' 
                        ELSE 'N' 
                    END soft_deleted_flag 
                FROM
                    fidelity_mdsdb.hp_rsc_position_forecast_final rsc_position_forecast    
                JOIN
                    fidelity_mdsdb.hp_kcrt_fg_pfm_project_final kcrt_fg_pfm_project 
                        ON rsc_position_forecast.STAFFING_PROFILE_ID=kcrt_fg_pfm_project.PRJ_STAFF_PROF_ID 
                        and rsc_position_forecast.sourceinstance=kcrt_fg_pfm_project.sourceinstance 
                UNION
                SELECT
                    rsc_position_forecast.POSITION_FORECAST_ID ,
                    rsc_position_forecast.sourceinstance ,
                    CASE 
                        WHEN rsc_position_forecast.cdctype = 'D' THEN 'Y' 
                        ELSE 'N' 
                    END soft_deleted_flag 
                FROM
                    fidelity_mdsdb.hp_rsc_position_forecast_final rsc_position_forecast    
                JOIN
                    fidelity_mdsdb.hp_rsc_staffing_profiles_final rsc_staffing_profiles 
                        ON rsc_position_forecast.STAFFING_PROFILE_ID =rsc_staffing_profiles.STAFFING_PROFILE_ID 
                        and rsc_position_forecast.sourceinstance=rsc_staffing_profiles.sourceinstance 
                UNION
                SELECT
                    rsc_position_forecast.POSITION_FORECAST_ID ,
                    rsc_position_forecast.sourceinstance ,
                    CASE 
                        WHEN rsc_position_forecast.cdctype = 'D' THEN 'Y' 
                        ELSE 'N' 
                    END soft_deleted_flag 
                FROM
                    fidelity_mdsdb.hp_rsc_position_forecast_final rsc_position_forecast   
                JOIN
                    fidelity_mdsdb.hp_rsc_positions_final rsc_positions 
                        ON rsc_position_forecast.POSITION_ID=rsc_positions.POSITION_ID 
                        and rsc_position_forecast.sourceinstance=rsc_positions.sourceinstance  
                JOIN
                    fidelity_mdsdb.hp_rsc_resource_pools_final rsc_resource_pools 
                        ON rsc_positions.RESOURCE_POOL_ID=rsc_resource_pools.RESOURCE_POOL_ID 
                        and rsc_positions.sourceinstance=rsc_resource_pools.sourceinstance 
                UNION
                SELECT
                    rsc_position_forecast.POSITION_FORECAST_ID ,
                    rsc_position_forecast.sourceinstance ,
                    CASE 
                        WHEN rsc_position_forecast.cdctype = 'D' THEN 'Y' 
                        ELSE 'N' 
                    END soft_deleted_flag 
                FROM
                    fidelity_mdsdb.hp_rsc_position_forecast_final rsc_position_forecast   
                JOIN
                    fidelity_mdsdb.hp_kcrt_fg_pfm_project_final kcrt_fg_pfm_project 
                        ON rsc_position_forecast.STAFFING_PROFILE_ID=kcrt_fg_pfm_project.PRJ_STAFF_PROF_ID 
                        and rsc_position_forecast.sourceinstance=kcrt_fg_pfm_project.sourceinstance  
                JOIN
                    (SELECT
                pfm_lifecycle_parent_entity.PROJECT_REQ_ID AS row_id,
                pfm_lifecycle_parent_entity.sourceinstance AS source_id,
                MAX(1) AS req_count       
            FROM
                fidelity_mdsdb.hp_pfm_lifecycle_parent_entity_final pfm_lifecycle_parent_entity                               
            GROUP BY
                1,
                2) t_ITP_HP_UNIQUE_PRJREQUESTS_FROM_LIFECYCLE_ENTITY 
                        ON kcrt_fg_pfm_project.REQUEST_ID=t_ITP_HP_UNIQUE_PRJREQUESTS_FROM_LIFECYCLE_ENTITY.row_id 
                        and kcrt_fg_pfm_project.sourceinstance=t_ITP_HP_UNIQUE_PRJREQUESTS_FROM_LIFECYCLE_ENTITY.source_id 
                ) Driver        
        LEFT OUTER JOIN
            fidelity_mdsdb.hp_rsc_position_forecast_final rsc_position_forecast  
                ON rsc_position_forecast.POSITION_FORECAST_ID = Driver.POSITION_FORECAST_ID 
                AND rsc_position_forecast.sourceinstance = Driver.sourceinstance  
        LEFT OUTER JOIN
            fidelity_mdsdb.hp_rsc_positions_final rsc_positions 
                ON rsc_position_forecast.POSITION_ID=rsc_positions.POSITION_ID 
                and rsc_position_forecast.sourceinstance=rsc_positions.sourceinstance
                        LEFT OUTER JOIN
            fidelity_mdsdb	.hp_kcrt_fg_pfm_project_final kcrt_fg_pfm_project 
                ON rsc_position_forecast.STAFFING_PROFILE_ID=kcrt_fg_pfm_project.PRJ_STAFF_PROF_ID 
                and rsc_position_forecast.sourceinstance=kcrt_fg_pfm_project.sourceinstance 
join
fidelity_mdwdb.f_resource_allocation TRGT
on COALESCE(CONCAT('PLANNED~',COALESCE(kcrt_fg_pfm_project.PRJ_PROJECT_ID,'UNSPECIFIED'),'~',COALESCE(rsc_position_forecast.POSITION_FORECAST_ID,'UNSPECIFIED'),'~',COALESCE(rsc_position_forecast.POSITION_ID,'UNSPECIFIED')),'UNSPECIFIED') =TRGT.row_id and rsc_position_forecast.sourceinstance = TRGT.source_id
where CONVERT_TZ(rsc_positions.START_DATE,'GMT','America/New_York')<>TRGT.planned_start_on