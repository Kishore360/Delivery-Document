SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_tribe_c.inactive ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from watson_mdsdb.u_tribe_final src
 left join watson_mdwdb.d_tribe_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where case when src.u_inactive=1 then 'Y' else 'N' end <>trgt.inactive)ma	