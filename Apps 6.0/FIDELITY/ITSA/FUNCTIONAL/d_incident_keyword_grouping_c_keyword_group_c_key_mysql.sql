SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.duration_c' ELSE 'SUCCESS' END as Message FROM fidelity_mdsdb.us_keyword_grouping_c_final  SRC JOIN fidelity_mdwdb.d_incident_keyword_grouping_c TRGT ON (CONCAT(SRC.group_name ,'~', SRC.keyword_part) = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
join
fidelity_mdwdb.d_keyword_group_c lkp
on COALESCE(SRC.group_name, 'UNSPECIFIED')=lkp.row_id AND SRC.sourceinstance = lkp.source_id
 WHERE coalesce(lkp.row_key, case when SRC.group_name is null then 0 else -1 end) <> (TRGT.keyword_group_c_key)  and SRC.cdctype<>'D'
