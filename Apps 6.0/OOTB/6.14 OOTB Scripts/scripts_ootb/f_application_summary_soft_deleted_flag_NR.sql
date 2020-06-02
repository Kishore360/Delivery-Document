SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_summary.soft_deleted_flag' ELSE 'SUCCESS' END as Message
    from app_test.transaction_nr SRC
    LEFT JOIN #DWH_TABLE_SCHEMA.f_application_summary TRGT 
    on SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id 
    where COALESCE(case when SRC.cdctype = 'D' then 'Y' else 'N' end, '')<> COALESCE(TRGT.soft_deleted_flag ,'')