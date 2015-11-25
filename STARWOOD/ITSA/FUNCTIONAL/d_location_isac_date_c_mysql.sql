SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  

from starwood_mdsdb.cmn_location_final a 
left join 
 
starwood_mdwdb.d_location b on 
a.sys_id=b.row_id and a.sourceinstance=b.source_id

where DATE_FORMAT(CONVERT_TZ(a.u_isac_date,'GMT','America/New_York'),'%Y%m%d%h%m%s')  <>
 DATE_FORMAT(b.isac_date_c,'%Y%m%d%h%m%s')
)c 