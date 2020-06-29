SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_entitlement.is_expired' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdsdb.service_entitlement_final SRC 
LEFT JOIN ibmwatson_mdwdb.d_service_entitlement TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  ibmwatson_mdwdb.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id )
WHERE TRGT.row_key not in (0, -1) and 
COALESCE(case when TIMESTAMPDIFF(DAY, date_format(df.lastupdated,'%Y%m%d'), date_format(DATE_ADD(SRC.end_date, INTERVAL '1' DAY),'%Y%m%d'))<=0 then 'Y' else 'N' end,'')<> COALESCE(TRGT.is_expired,'');