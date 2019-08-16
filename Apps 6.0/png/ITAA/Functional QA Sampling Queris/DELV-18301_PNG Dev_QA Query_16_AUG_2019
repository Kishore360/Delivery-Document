SELECT Count(1) AS CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC 
LEFT JOIN 
(
select APP_HEX, sourceinstance, 
replace(replace( REPLACE((CASE WHEN RELEASE_NATURE='Instance' 
THEN concat(COALESCE(RELEASE_NAME,'UNSPECIFIED'),', ', COALESCE(INSTANCE_NAME,'UNSPECIFIED')) 
ELSE  COALESCE(INSTANCE_NAME,'UNSPECIFIED') END),'UNSPECIFIED, ','') ,', UNSPECIFIED,',''),', UNSPECIFIED' ,'') as INSTANCENAME
from
png_mdsdb.pg_mega_snv_app_hierarchy_final lkp
where lkp.app_hex is not null and lkp.cdctype = 'X'
group by 1,2
) SRC1 ON SRC.NAME=SRC1.APP_HEX AND SRC.sourceinstance=SRC1.sourceinstance 
LEFT JOIN pgrita_workdb.ds_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.INSTANCENAME,'UNSPECIFIED')<>TRGT.instance_name_c
AND SRC.cdctype='X'