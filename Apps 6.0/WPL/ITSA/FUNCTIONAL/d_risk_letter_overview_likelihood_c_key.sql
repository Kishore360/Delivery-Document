SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_risk_letter_overview.likelihood_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
wpl_mdsdb.us_rlo_history_final src
left join wpl_mdwdb.d_risk_letter_overview trgt
on  concat(COALESCE(src.risknumber,'UNSPECIFIED'), '~', REPLACE(COALESCE(src.monthyear,'UNSPECIFIED'),'-','') )=trgt.row_id and src.sourceinstance=trgt.source_id
join wpl_mdwdb.d_lov lkp on COALESCE( CONCAT('LIKELIHOOD~RISK_LETTER_HI~',src.likelihood),'UNSPECIFIED') =lkp.row_id and src.sourceinstance=lkp.source_id
where src.cdctype<>'D' and coalesce(lkp.row_key,case when src.likelihood is null then 0 else -1 end)<>trgt.likelihood_c_key)ma
;