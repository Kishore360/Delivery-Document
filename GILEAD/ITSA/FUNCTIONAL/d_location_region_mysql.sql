 SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  
FROM gilead_mdsdb.cmn_location_final SRC
join gilead_mdwdb.d_location a
 ON (SRC.sys_id =a.row_id  
 AND SRC.sourceinstance= a.source_id  )
left join  gilead_mdwdb.d_location b 
on a.site_c_key = b.row_key 
and a.site_c_key not in (0,-1) 
and (b.country_code is not null or b.region_c is not null )
where a.region_c<>b.region_c
)c 


 