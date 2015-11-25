
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select COUNT(*) cnt from(
SELECT A.SYS_ID,B.ROW_ID,
B.  last_resolved_on_key B_last_resolved_on_key ,
case when year <2000 then A.last_resolved_on_key+20000000 else A.last_resolved_on_key 
end as  A_last_resolved_on_key from
(SELECT SYS_ID,sourceinstance, 
DATE_FORMAT(CONVERT_TZ(resolved_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),'%Y')  AS   year,
DATE_FORMAT(CONVERT_TZ(resolved_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),'%Y%m%d')  AS   last_resolved_on_key
FROM <<tenant>>_mdsdb.incident_final 

)A
 JOIN  
(SELECT  f.last_resolved_on_key,f.source_id,f.ROW_ID FROM  <<tenant>>_mdwdb.f_incident f
join <<tenant>>_mdwdb.d_lov_map dlm ON f.state_src_key = dlm.src_key and f.state_src_code=dlm.dimension_code 
where dlm.dimension_class = 'STATE~INCIDENT'
AND dlm.dimension_wh_code IN('RESOLVED','CLOSED')and state_src_code>4
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)h
WHERE A_last_resolved_on_key<> B_last_resolved_on_key)E;