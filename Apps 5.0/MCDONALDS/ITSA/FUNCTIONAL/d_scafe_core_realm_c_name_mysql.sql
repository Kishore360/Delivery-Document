SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
			FROM
mcdonalds_mdsdb.x_scafe_core_realm_final a 
JOIN mcdonalds_mdwdb.d_scafe_core_realm_c b on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.name<>b.name


