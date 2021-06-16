Unit testing queries:
*********************

select case when cnt>0 then "Data doesn't match between MDS and Warehouse"
else "Data matches" end as Result
from
(select count(1) as cnt
from pgrita_mdwdb.d_rita_application_ext_c d 
join 
(select APP_HEX, sourceinstance, replace(replace( REPLACE((GROUP_CONCAT(distinct CASE WHEN RELEASE_NATURE='Instance' THEN concat(COALESCE(RELEASE_NAME,'UNSPECIFIED'),', ', COALESCE(INSTANCE_NAME,'UNSPECIFIED')) ELSE  COALESCE(INSTANCE_NAME,'UNSPECIFIED') END order by DB_NAME)),'UNSPECIFIED, ','') ,', UNSPECIFIED,',''),', UNSPECIFIED' ,'') as INSTANCENAME
from
png_mdsdb.pg_mega_snv_app_hierarchy_final lkp
where lkp.app_hex is not null and lkp.cdctype = 'X'
group by 1,2) lkp
on (d.row_id=lkp.APP_HEX and d.source_id=lkp.sourceinstance)
where 
d.instance_name_c<>lkp.INSTANCENAME) a;



SELECT  APP_HEX, REPLACE(INSTANCE_NAME,'UNSPECIFIED','') as INSTANCE_NAME,
RELEASE_INSTANCE_NAME,
REPLACE(CONCAT(INSTANCE_NAME,',',RELEASE_INSTANCE_NAME),'UNSPECIFIED','') as new_instance,
RELEASE_NATURE, RELEASE_NAME,
INSTANCE_NAME_1, replace(INSTANCE_NAME_1, 'UNSPECIFIED,', '') as aa,
INSTANCENAME
FROM 
(SELECT APP_HEX,sourceinstance, GROUP_CONCAT(distinct COALESCE(INSTANCE_NAME,'UNSPECIFIED') order by DB_NAME) as INSTANCE_NAME
,GROUP_CONCAT(distinct COALESCE(RELEASE_NAME,'UNSPECIFIED') order by DB_NAME) as RELEASE_NAME
,GROUP_CONCAT(distinct COALESCE(RELEASE_NATURE,'UNSPECIFIED') order by DB_NAME) as RELEASE_NATURE
,GROUP_CONCAT(distinct COALESCE(SERVER_NAME,'UNSPECIFIED') order by DB_NAME) as SERVER_NAME
,GROUP_CONCAT(distinct COALESCE(DB_NAME,'UNSPECIFIED') order by DB_NAME) as DB_NAME,
GROUP_CONCAT(distinct CASE WHEN RELEASE_NATURE='Instance' THEN  RELEASE_NAME ELSE 'UNSPECIFIED' END order by DB_NAME) as RELEASE_INSTANCE_NAME,
GROUP_CONCAT(distinct CASE WHEN RELEASE_NATURE='Instance' THEN COALESCE(RELEASE_NAME,'UNSPECIFIED') ELSE  COALESCE(INSTANCE_NAME,'UNSPECIFIED') END order by DB_NAME) as INSTANCE_NAME_1,
GROUP_CONCAT(distinct CASE WHEN RELEASE_NATURE='Instance' THEN concat(COALESCE(RELEASE_NAME,'UNSPECIFIED'),', ', COALESCE(INSTANCE_NAME,'UNSPECIFIED')) ELSE  COALESCE(INSTANCE_NAME,'UNSPECIFIED') END order by DB_NAME) as INSTANCENAME 
from png_mdsdb.pg_mega_snv_app_hierarchy_final as app
where app.app_hex is not null and app.cdctype = 'X' and app.app_hex='3D983E1056CC72B7'
group by 1,2
)a ;

select INSTANCE_NAME, RELEASE_NATURE, RELEASE_NAME from png_mdsdb.pg_mega_snv_app_hierarchy_final as app where app.APP_HEX='3D983E1056CC72B7'
and cdctype ='X';

select instance_name_c from pgrita_mdwdb.d_rita_application_ext_c
where row_id='3D983E1056CC72B7';
