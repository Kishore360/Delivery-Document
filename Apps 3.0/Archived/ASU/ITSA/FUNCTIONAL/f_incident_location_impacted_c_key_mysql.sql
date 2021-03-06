SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message from (
select count(1) as cnt 
from  (
select sys_id,sourceinstance,
u_locations_impacted  from  (select l.row_key,t.incident_location_impacted_key , sys_id,sourceinstance,
u_locations_impacted from (
select sys_id,sourceinstance,
substring_index( substring_index(a.u_locations_impacted,',',num),',',-1) as u_locations_impacted
from asu_mdsdb.incident_final a
left join (
select 1 num
union
select 2 num
union
select 3 num
union
select 4 num
union
select 5 num
union
select 6 num
)b
on char_length(a.u_locations_impacted)-char_length(replace(a.u_locations_impacted,',',''))+1
>=num
where a.u_locations_impacted is not null
union
select Sys_id,sourceinstance,u_locations_impacted
from asu_mdsdb.incident_final a  where u_locations_impacted is null )SRC
left join asu_mdwdb.d_location l
on SRC.u_locations_impacted=l.row_id and SRC.sourceinstance=l.source_id
left join asu_mdwdb.f_incident_location_impacted_c t
on SRC.sourceinstance=t.source_id and concat(SRC.sys_id,'~',SRC.u_locations_impacted)=t.row_id
)A
where  A.row_key<>A.incident_location_impacted_key) c ) d;


