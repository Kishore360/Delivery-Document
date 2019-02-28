
select SRC.name,
 SRC.purchase_date,SRC.sys_created_on,(SELECT Max(x.lastupdated) FROM equifax_workdb.o_data_freshness x),
timestampdiff(second,COALESCE(SRC.purchase_date,SRC.sys_created_on),
(SELECT Max(x.lastupdated) FROM equifax_workdb.o_data_freshness x)) AS seconds,timestampdiff(second,COALESCE(SRC.purchase_date,SRC.sys_created_on),
(SELECT Max(x.lastupdated) FROM equifax_workdb.o_data_freshness x))/(86400.00*365) AS Years,
TRGT.age_c
from equifax_mdsdb.cmdb_ci_final SRC
left join equifax_mdwdb.f_configuration_item_c TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE 
timestampdiff(second,COALESCE(SRC.purchase_date,SRC.sys_created_on),
(SELECT Max(x.lastupdated) FROM equifax_workdb.o_data_freshness x)) <> TRGT.age_c and SRC.name='BONES';




