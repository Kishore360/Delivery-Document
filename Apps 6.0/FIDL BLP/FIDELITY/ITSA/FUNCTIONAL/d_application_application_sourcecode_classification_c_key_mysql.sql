
BI Application Modeller Shubha.Rao@fidelity.com 
M2S_ITS_SN_DS_FMR_CIO_GROUP_C_DM_FIDELITY
Source
ENTITIES
ENTITY RELATIONSHIPS
FILTER
ENTITIESENTITY RELATIONSHIPSFILTER
 
Filter Results...
Name	Alias	Propagate Changes	Actions
u_fmr_cio_group(P)	u_fmr_cio_group	true	
Target Table (d_fmr_cio_group_c) 
BUSINESS COLUMNS
SYSTEM COLUMNS
BUSINESS COLUMNSSYSTEM COLUMNS

Filter Results...
Col	Data Class	Aggregate	Mapping Expression
Generated SQL
SQL
 
-- START

    INSERT 
    INTO
        @#LDB_CLIENT_MYSQL_STG_Database@#.ds_fmr_cio_group_c
        (
            name, cdctype, changed_by, changed_on, created_by, created_on, etl_run_number, row_id, soft_deleted_flag, source_id, cio_group_status_c_id, cio_user_c_id, number_c
        )  (
            SELECT
                u_fmr_cio_group.u_cio_group_name AS name,
                u_fmr_cio_group.cdctype AS cdctype,
                u_fmr_cio_group.sys_updated_by AS changed_by,
                CONVERT_TZ (u_fmr_cio_group.sys_updated_on,
                '@#TENANT_SSI_TIME_ZONE@#',
                '@#DW_TARGET_TIME_ZONE@#') AS changed_on,
                u_fmr_cio_group.sys_created_by AS created_by,
                CONVERT_TZ (u_fmr_cio_group.sys_created_on,
                '@#TENANT_SSI_TIME_ZONE@#',
                '@#DW_TARGET_TIME_ZONE@#') AS created_on,
                @#PARENT_ETL_RUN_ID@# AS etl_run_number,
                u_fmr_cio_group.sys_id AS row_id,
                CASE 
                    WHEN u_fmr_cio_group.cdctype='D' then 'Y' 
                    else 'N' 
                END AS soft_deleted_flag,
                u_fmr_cio_group.sourceinstance AS source_id,
                COALESCE(CONCAT('STATUS_C~CIO_GROUP~',
                u_fmr_cio_group.u_status),
                'UNSPECIFIED') AS cio_group_status_c_id,
                COALESCE(CONCAT('INTERNAL_CONTACT~',
                u_fmr_cio_group.u_cio,
                'UNSPECIFIED')) AS cio_user_c_id,
                u_fmr_cio_group.u_number AS number_c              
            FROM
                @#LDB_CLIENT_SOURC_Database@#.u_fmr_cio_group_delta u_fmr_cio_group                                      
        );-- END


