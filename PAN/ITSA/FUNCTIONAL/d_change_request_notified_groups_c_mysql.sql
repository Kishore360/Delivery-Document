SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message  from 
(
select 
count(1)
from 
(select 
sys_id,
notified_group_count,
(case when ij.notified_group_count=1 then concat(b.organization_name)
 when ij.notified_group_count=2 
  then concat(coalesce(b.organization_name,part1),',',coalesce(c.organization_name,part2))
 when ij.notified_group_count=3 
  then concat(coalesce(b.organization_name,part1),',',coalesce(c.organization_name,part2),',',coalesce(d.organization_name,part3))
 when ij.notified_group_count=4
  then concat(coalesce(b.organization_name,part1),',',coalesce(c.organization_name,part2),',',coalesce(d.organization_name,part3),',',coalesce(e.organization_name,part4)) 
 when ij.notified_group_count=5
  then concat (coalesce(b.organization_name,part1),',',coalesce(c.organization_name,part2),',',coalesce(d.organization_name,part3),',',coalesce(e.organization_name,part4),',',coalesce(f.organization_name,part5))
 when ij.notified_group_count=6
  then concat (coalesce(b.organization_name,part1),',',coalesce(c.organization_name,part2),',',coalesce(d.organization_name,part3),',',coalesce(e.organization_name,part4),',',coalesce(f.organization_name,part5),',',coalesce(g.organization_name,part6)) 
 else null end) as notified_groups_c
from
(select 
a.sys_id, 
(LENGTH(`u_notified_groups`) - LENGTH(REPLACE(`u_notified_groups`, ',', ''))+1) as notified_group_count,
SUBSTRING_INDEX(a.u_notified_groups, ',', 1) part1,
SUBSTRING_INDEX(SUBSTRING_INDEX(u_notified_groups,',',2),',',-1) AS part2,
SUBSTRING_INDEX(SUBSTRING_INDEX(u_notified_groups,',',3),',',-1) AS part3,
SUBSTRING_INDEX(SUBSTRING_INDEX(u_notified_groups,',',4),',',-1) AS part4,
SUBSTRING_INDEX(SUBSTRING_INDEX(u_notified_groups,',',5),',',-1) AS part5,
SUBSTRING_INDEX(SUBSTRING_INDEX(u_notified_groups,',',6),',',-1) AS part6
from pan_mdsdb.change_request_final a
)ij
left join pan_mdwdb.d_internal_organization b
on concat('GROUP~',ij.part1)=b.row_id
left join pan_mdwdb.d_internal_organization c
on concat('GROUP~',ij.part2)=c.row_id
left join pan_mdwdb.d_internal_organization d
on concat('GROUP~',ij.part3)=d.row_id
left join pan_mdwdb.d_internal_organization e
on concat('GROUP~',ij.part4)=e.row_id
left join pan_mdwdb.d_internal_organization f
on concat('GROUP~',ij.part5)=f.row_id
left join pan_mdwdb.d_internal_organization g
on concat('GROUP~',ij.part6)=g.row_id

)SRC
left join pan_mdwdb.d_change_request TRG
on SRC.sys_id=TRG.row_id 
where SRC.notified_groups_c <>TRG.notified_groups_c
)A
