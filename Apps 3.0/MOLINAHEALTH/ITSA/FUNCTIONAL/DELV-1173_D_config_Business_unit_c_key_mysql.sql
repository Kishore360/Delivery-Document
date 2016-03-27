SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message

from molinahealth_mdsdb.cmdb_ci_final a
join molinahealth_mdwdb.d_configuration_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
LEFT JOIN molinahealth_mdwdb.d_business_unit_c c
ON a.u_business_unit=c.row_id
AND c.source_id=a.sourceinstance
where coalesce(c.row_key,case when a.u_business_unit is null then 0 else -1 end)<>business_unit_c_key