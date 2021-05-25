SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_application.appl_owned_by_c_key' ELSE 'SUCCESS' END as Message
FROM (
SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_appl_final SRC
join  png_ccs_mdwdb.d_application TRGT
on concat('APPLICATION~', SRC.sys_id) = TRGT.row_id and SRC.sourceinstance = TRGT.source_id and TRGT.soft_deleted_flag = 'N'
left join   png_ccs_mdwdb.d_internal_contact LKP
on concat( 'INTERNAL_CONTACT~', SRC.owned_by) =   LKP.row_id
where coalesce(LKP.row_key, case when SRC.owned_by is NULL then 0 else -1 end)   <> TRGT.appl_owned_by_c_key 
) temp;
