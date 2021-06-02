SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_item.level_2_product_management_ready_c' ELSE 'SUCCESS' END as Message
FROM jhi_mdsdb.issue_final  SRC
JOIN jhi_jira_sb_mdwdb.d_work_item_ext_c TRGT ON
SRC.id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
JOIN jhi_jira_sb_mdwdb.d_work_item TRGT2 on TRGT.work_item_c_key=TRGT2.row_key
JOIN jhi_jira_sb_mdwdb.f_work_item LKP on LKP.work_item_key=TRGT2.row_key
WHERE  CASE             
            WHEN (CASE 
                WHEN LKP.product_manager_assigned_c = 1 
                AND LKP.taxonomies_completed_c = 1 THEN 1 
                ELSE 0 
            END) = 1 
            AND LKP.overview_of_prod_mgmt_completed_c = 1 
            AND (CASE 
                WHEN LKP.roadmaps_created_in_aha_c = 1 
                AND LKP.roadmaps_reviewed_with_product_family_c = 1 
                AND LKP.roadmaps_reviewed_with_business_c = 1 
                AND LKP.roadmaps_reviewed_with_tech_org_c = 1 THEN 1 
                ELSE 0 
            END) = 1 
            AND LKP.quarterly_planning_completed_and_first_held_c = 1
            THEN 1             
            ELSE 0          
        END  <> (LKP.level_2_product_management_ready_c) and LKP.soft_deleted_flag ='N';