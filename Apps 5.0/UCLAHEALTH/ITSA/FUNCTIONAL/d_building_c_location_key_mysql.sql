SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from   
 (SELECT sys_id,sourceinstance FROM uclahealth_mdsdb.cmn_building_final
  UNION
  SELECT A.sys_id, A.sourceinstance FROM uclahealth_mdsdb.cmn_building_final A
  JOIN uclahealth_mdsdb.sys_user_final B ON A.contact = B.sys_id AND A.sourceinstance = B.sourceinstance
)Driver
LEFT OUTER JOIN uclahealth_mdsdb.cmn_building_final c ON c.sys_id = Driver.sys_ID AND c.sourceinstance = Driver.sourceinstance
LEFT OUTER JOIN uclahealth_mdsdb.sys_user_final B ON c.contact = B.sys_id AND c.sourceinstance = B.sourceinstance
join uclahealth_mdwdb.d_location d on c.location=d.row_id and c.sourceinstance=d.source_id
join uclahealth_mdwdb.d_building_c f on  c.sys_id=d.row_id and c.sourceinstance=d.source_id
where 
coalesce(d.row_key,case when c.location is null then 0 else -1 end )<> f.location_key 
 )a
 
 