select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_configuration_item.category'  ELSE 'SUCCESS'  END as Message
from  aetna_mdsdb.cmdb_ci_final a11
join aetna_mdwdb.d_configuration_item a12 on 
(a11.sys_id=a12.row_id and a11.sourceinstance=a12.source_id)
where a11.category<>a12.category;