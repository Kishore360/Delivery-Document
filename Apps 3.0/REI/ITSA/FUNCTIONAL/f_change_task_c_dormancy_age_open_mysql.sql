/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM rei_mdwdb.f_change_task_c TRGT 
 join rei_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.state_src_key)AND  lm.dimension_wh_code = 'OPEN' and lm.dimension_class = 'STATE~Change_task'
JOIN (
select source_id,max(lastupdated) as lastupdated from  rei_mdwdb.d_o_data_freshness
group by source_id
) df ON TRGT.source_id = df.source_id
 where 
 timestampdiff(second, CONVERT_TZ(TRGT.changed_on,'America/Los_Angeles','GMT'),
 CONVERT_TZ(df.lastupdated,'America/Los_Angeles','GMT'))  
 <> TRGT.dormancy_age 



 
 

