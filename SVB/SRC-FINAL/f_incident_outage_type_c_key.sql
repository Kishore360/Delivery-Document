
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT a.sys_id,b.row_id   ,b. outage_type_c_key b_outage_type_c_key  ,a.u_outage_type_ a_u_outage_type_ ,c.row_key,
(case when a.u_outage_type_ is null then 'UNSPECIFIED' else coalesce(c.row_key,-1) end)
FROM
(SELECT sys_id,sourceinstance, u_outage_type_
FROM svb_mdsdb.incident_final )a
 left JOIN  
(SELECT  outage_type_c_key,source_id,row_id FROM  svb_mdwdb.d_configuration_item
 )b on a.sourceinstance=b.source_id AND  substring(b.row_id,instr(b.row_id,'~')+1,32)=sys_id
 
)h
where b_outage_type_c_key  <>(case when a_u_outage_type_  is null then 'UNSPECIFIED' else coalesce(row_key,-1) end))E;