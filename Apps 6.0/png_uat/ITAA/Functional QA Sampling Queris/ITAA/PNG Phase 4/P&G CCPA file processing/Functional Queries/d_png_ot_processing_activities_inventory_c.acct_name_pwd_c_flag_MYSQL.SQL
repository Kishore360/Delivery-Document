SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS acct_name_pwd_c_flag ' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.acct_name_pwd_c_flag' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM  png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
where 
COALESCE(src.Consumer_account_username_and_password,'UNSPECIFIED') <> trgt.acct_name_pwd_c_flag
) 


