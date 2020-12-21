SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.db_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
pgcmdb_mdwdb.d_rita_application_ext_c ds
join
(SELECT APP_HEX,sourceinstance
,GROUP_CONCAT(distinct COALESCE(DB_NAME,'UNSPECIFIED') order by DB_NAME) as DB_NAME
from png_mdsdb.pg_mega_snv_app_hierarchy_final as app
where app.app_hex is not null and app.cdctype = 'X'
group by 1,2 
) lkp
on ds.mega_id_c=lkp.APP_HEX and ds.source_id=lkp.sourceinstance
where
ds.db_name_c=CASE WHEN 
replace(replace( REPLACE(lkp.DB_NAME,'UNSPECIFIED, ','') ,', UNSPECIFIED,',''),', UNSPECIFIED' ,'') ='' THEN 'UNSPECIFIED'
ELSE replace(replace( REPLACE(lkp.DB_NAME,'UNSPECIFIED, ','') ,', UNSPECIFIED,',''),', UNSPECIFIED' ,'')  END
) temp;




