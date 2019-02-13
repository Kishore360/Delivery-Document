SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_change_request.cab_recommendation_c' ELSE 'SUCCESS' END as Message 
FROM(select count(1) as CNT from 
(select sys_id,sourceinstance, cab_recommendation  from aetna_mdsdb.change_request_final where CDCTYPE<>'D') src
left JOIN  aetna_mdwdb.d_change_request trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
where coalesce(src.cab_recommendation) <> trgt.cab_recommendation_c)temp;