SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_prb_collection_2018_c_fact.did_it_go_through_our_testing_service' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.us_NODCS1718_2018PRBCollectionSheet_final  src
left join wpl_mdwdb.f_prb_collection_2018_c_fact trgt on   concat(coalesce(src.numbersnow,'unspecified'),'~',coalesce(src.dateandtimesnow,'unspecified'))=trgt.row_id and src.sourceinstance=trgt.source_id
where src.cdctype<>'D' and   src.diditgothroughourtestingservice <> did_it_go_through_our_testing_service) temp; 