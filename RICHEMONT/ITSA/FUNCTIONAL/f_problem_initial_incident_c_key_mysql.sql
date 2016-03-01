SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  
richemont_mdsdb.problem_final  SRC
left join richemontdev_mdwdb.f_problem TRG
on TRG.row_id=SRC.sys_id   and SRC.SourceInstance =TRG.source_id
left join  richemontdev_mdwdb.d_incident di
on di.row_id=COALESCE(SRC.u_initial_incident,'UNSPECIFIED')
and di.source_id = CASE WHEN SRC.u_initial_incident IS NULL THEN 0 ELSE SRC.SourceInstance end 
where TRG.initial_incident_c_key<>di.row_key ) temp