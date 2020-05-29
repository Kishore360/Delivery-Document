SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_prb_collection_2018_c_fact.who_implemented_the_change_ticket_or_action_manual' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.us_NODCS1718_2018PRBCollectionSheet_final  src
left join wpl_mdwdb.f_prb_collection_2018_c_fact trgt on   concat(coalesce(src.numbersnow,'unspecified'),'~',coalesce(src.dateandtimesnow,'unspecified'))=trgt.row_id and src.sourceinstance=trgt.source_id
where src.cdctype<>'D' and   src.whoimplementedthechangeticketoractionmanual <> who_implemented_the_change_ticket_or_action_manual) temp; 