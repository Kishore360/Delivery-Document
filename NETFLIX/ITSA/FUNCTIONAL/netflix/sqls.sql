SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from netflix_mdwdb.d_task_sla a where lower(sla_name) like '%Incident%Closure%' and a.sla_category='resolution'
) c


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from netflix_mdwdb.d_task_sla a where lower(sla_name) like '%ISS Urgent Assignment%' OR lower(sla_name) like '%Normal Assignment%' OR lower(sla_name) like '%Urgent Assignment%' and a.sla_category='response'
) c


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from netflix_mdwdb.d_incident di join netflix_mdwdb.f_brand_protect_phishing_c phis on di.row_key = phis.incident_key and di.row_key not  in ( 0,-1) and di.incident_type = 'PHISHING') c

select count(*) from netflix_mdwdb.d_incident di join netflix_mdwdb.f_malware_tracking_c mal on di.row_key = mal.incident_key and di.row_key not  in ( 0,-1) and di.incident_type = 'MALWARE';


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from netflix_mdwdb.d_facility_request  f JOIN (SELECT id, TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',mi.duration) as duration FROM netflix_mdsdb.metric_instance_delta mi JOIN netflix_mdsdb.metric_definition_final mf ON mi.definition = mf.sys_id WHERE mf.table = 'facilities' AND NAME = 'FAC - Create to Resolve Duration') mi on f.row_id = mi.id and f.open_to_close_duration <> mi.duration) c



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select a.cnt1-b.cnt2 as cnt from 
(select count(*) as cnt1 from netflix_mdwdb.d_brand_protect_phishing_c where source_id in(0,2))a,
(select count(*) as cnt2 FROM netflix_mdsdb.u_brandprotectphishing_delta  bpp
WHERE bpp.sourceinstance IN(0,2) )b) c;



SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select a.cnt1-b.cnt2 as cnt from 
(select count(*) as cnt1 from netflix_mdwdb.f_brand_protect_phishing_c where source_id in(0,2))a,
(select count(*) as cnt2 FROM netflix_mdsdb.u_brandprotectphishing_delta  bpp
WHERE bpp.sourceinstance IN(0,2))b)c;


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from netflix_mdwdb.d_incident a join (select sys_id, u_requester, opened_by from netflix_mdsdb.incident_delta where u_requester is not null and opened_by is not null) b on a.row_id = b.sys_id and a.opened_for_self_flag= case when b.u_requester<> b.opened_by then 'Y' else 'N' end) c


