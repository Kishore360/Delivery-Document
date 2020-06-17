
select CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_ci_application_c.version' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
from equifax_mdsdb.cmdb_ci_final SRC
left join equifax_mdwdb.f_configuration_item_c TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE 
timestampdiff(second,CONVERT_TZ(COALESCE(SRC.purchase_date,SRC.sys_created_on),'GMT','America/New_York'),
(SELECT Max(x.lastupdated) FROM equifax_mdwdb.d_o_data_freshness x))<>TRGT.age_c and SRC.cdctype<>'D')ma;




