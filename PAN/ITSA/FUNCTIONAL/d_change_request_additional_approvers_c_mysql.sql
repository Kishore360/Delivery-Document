SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message  from 
(
select 
count(1)
from 
(select 
sys_id,
approver_count,
(case when ij.approver_count=1 then concat(b.full_name)
 when ij.approver_count=2 
  then concat(coalesce(b.full_name,part1),',',coalesce(c.full_name,part2))
 when ij.approver_count=3 
  then concat(coalesce(b.full_name,part1),',',coalesce(c.full_name,part2),',',coalesce(d.full_name,part3))
 when ij.approver_count=4
  then concat(coalesce(b.full_name,part1),',',coalesce(c.full_name,part2),',',coalesce(d.full_name,part3),',',coalesce(e.full_name,part4)) 
 when ij.approver_count=5
  then concat (coalesce(b.full_name,part1),',',coalesce(c.full_name,part2),',',coalesce(d.full_name,part3),',',coalesce(e.full_name,part4),',',coalesce(f.full_name,part5))
 when ij.approver_count=6
  then concat (coalesce(b.full_name,part1),',',coalesce(c.full_name,part2),',',coalesce(d.full_name,part3),',',coalesce(e.full_name,part4),',',coalesce(f.full_name,part5),',',coalesce(g.full_name,part6)) 
 else null end) as approvers_c
from
(select 
a.sys_id, 
(LENGTH(`u_additional_approvers`) - LENGTH(REPLACE(`u_additional_approvers`, ',', ''))+1) as approver_count,
SUBSTRING_INDEX(a.u_additional_approvers, ',', 1) part1,
SUBSTRING_INDEX(SUBSTRING_INDEX(u_additional_approvers,',',2),',',-1) AS part2,
SUBSTRING_INDEX(SUBSTRING_INDEX(u_additional_approvers,',',3),',',-1) AS part3,
SUBSTRING_INDEX(SUBSTRING_INDEX(u_additional_approvers,',',4),',',-1) AS part4,
SUBSTRING_INDEX(SUBSTRING_INDEX(u_additional_approvers,',',5),',',-1) AS part5,
SUBSTRING_INDEX(SUBSTRING_INDEX(u_additional_approvers,',',6),',',-1) AS part6
from pan_mdsdb.change_request_final a
)ij
left join pan_mdwdb.d_internal_contact b
on concat('INTERNAL_CONTACT~',ij.part1)=b.row_id
left join pan_mdwdb.d_internal_contact c
on concat('INTERNAL_CONTACT~',ij.part2)=c.row_id
left join pan_mdwdb.d_internal_contact d
on concat('INTERNAL_CONTACT~',ij.part3)=d.row_id
left join pan_mdwdb.d_internal_contact e
on concat('INTERNAL_CONTACT~',ij.part4)=e.row_id
left join pan_mdwdb.d_internal_contact f
on concat('INTERNAL_CONTACT~',ij.part5)=f.row_id
left join pan_mdwdb.d_internal_contact g
on concat('INTERNAL_CONTACT~',ij.part6)=g.row_id

)SRC
left join pan_mdwdb.d_change_request TRG
on SRC.sys_id=TRG.row_id
where TRG.additional_approvers_c<>SRC.approvers_c
)A
