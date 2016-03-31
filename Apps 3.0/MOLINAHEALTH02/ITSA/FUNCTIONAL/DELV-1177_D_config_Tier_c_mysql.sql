SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message

from molinahealth_mdsdb.cmdb_ci_final a
join molinahealth_mdwdb.d_configuration_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.tier_c<>a.u_tier