SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  vip_flag A_vip_flag,B.  vip_flag B_vip_flag FROM
(SELECT SYS_ID,sourceinstance, vip AS   vip_flag
FROM uclahealth_mdsdb.sys_user )A
LEFT OUTER JOIN  
(SELECT  vip_flag ,source_id,ROW_ID FROM  uclahealth_mdwdb.d_internal_contact
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE A_vip_flag<> B_vip_flag;