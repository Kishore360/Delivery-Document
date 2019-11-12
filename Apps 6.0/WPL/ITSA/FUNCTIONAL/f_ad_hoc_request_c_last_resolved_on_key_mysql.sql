
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select COUNT(1) cnt from(
SELECT A.SYS_ID,B.ROW_ID,
B.  last_resolved_on_key B_last_resolved_on_key ,
case when year <2000 then A.last_resolved_on_key+20000000 else A.last_resolved_on_key 
end as  A_last_resolved_on_key from
(SELECT SYS_ID,sourceinstance, 
DATE_FORMAT(CONVERT_TZ(coalesce(u_adhoc_resolved_dt,closed_at,sys_updated_on),'GMT','America/New_York'),'%Y')  AS   year,
DATE_FORMAT(CONVERT_TZ(coalesce(u_adhoc_resolved_dt,closed_at,sys_updated_on),'GMT','America/New_York'),'%Y%m%d')  AS   last_resolved_on_key
FROM wpl_mdsdb.u_ad_hoc_request_final 

)A
 JOIN  
(SELECT  f.last_resolved_on_key,f.source_id,f.ROW_ID,dimension_class FROM  wpl_mdwdb.f_ad_hoc_request_c f
join wpl_mdwdb.d_lov_map dlm ON f.state_src_key = dlm.src_key -- and f.state_src_code=dlm.dimension_code 
where dlm.dimension_class = 'STATE~U_AD_HOC_REQUEST'
AND dlm.dimension_wh_code IN('RESOLVED','CLOSED')-- and state>4
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)h
WHERE A_last_resolved_on_key<> B_last_resolved_on_key)E;
