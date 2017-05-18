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
join uclahealth_mdwdb.d_building_c d on c.sys_id=d.row_id and c.sourceinstance=d.source_id
where 
c.name <> building_NUMBER or
'Building' <> building_TYPE_CODE or
B.Name <> CONTACT_NAME or
c.name <> building_NAME or
COALESCE(c.contact ,'UNSPECIFIED') <> CONTACT_ID or
c.u_street <> ST_ADDRESS1 or

c.u_city <> CITY_CODE or
c.u_state <> STATE_CODE or
c.u_zip <> POSTAL_CODE or
c.u_country <> COUNTRY_CODE or
c.floors <> d.floors or
c.notes <> d.notes )a