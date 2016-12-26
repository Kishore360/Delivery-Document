select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdsdb.incident_final SRC 
 JOIN whirlpool_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 left join whirlpool_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)  
 LEFT JOIN (
select source_id,max(lastupdated) as lastupdated from  whirlpool_workdb.d_o_data_freshness
group by source_id
) df ON TRGT.source_id = df.source_id
where  lm.dimension_wh_code = 'OPEN'  and TIMESTAMPDIFF(SECOND,SRC.sys_updated_on,CONVERT_TZ(df.lastupdated ,'America/New_York','GMT'))
<> TRGT.dormancy_age 