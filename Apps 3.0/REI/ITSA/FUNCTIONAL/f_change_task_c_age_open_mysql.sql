/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt FROM 
 rei_mdwdb.f_change_task_c f 
JOIN rei_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code IN ('OPEN')
JOIN rei_mdwdb.d_change_task_c a ON a.row_key = f.change_task_key
AND f.source_id = a.source_id
join
rei_mdwdb.d_o_data_freshness df ON f.source_id = df.source_id
WHERE
if(timestampdiff(second, CONVERT_TZ(a.opened_on,'GMT','America/Los_Angeles'), 
CONVERT_TZ(df.lastupdated,'GMT','America/Los_Angeles'))>0,
timestampdiff(second, CONVERT_TZ(a.opened_on,'GMT','America/Los_Angeles'), 
CONVERT_TZ(df.lastupdated,'GMT','America/Los_Angeles')),0)
<> f.age
  )a
  