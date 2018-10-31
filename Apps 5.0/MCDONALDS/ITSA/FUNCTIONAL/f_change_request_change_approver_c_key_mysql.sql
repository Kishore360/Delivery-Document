SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for change_Approver_c_key' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from 
-- (select x.number,x.sys_id,x.document_id,concat('INTERNAL_CONTACT~',x.approver),d1.row_id,f.change_request_number,f.change_Approver_c_key,d1.row_key,x.sys_created_on from
-- select x.*,b.* from 
(select number,src2.sys_created_on,approver,src1.sys_id,src1.sourceinstance,src2.document_id,src2.u_approval_completed from
mcdonalds_mdsdb.change_request_final src1
join
mcdonalds_mdsdb.sysapproval_approver_final src2
on
src1.sys_id=src2.document_id where src2.state="approved"  -- and  src1.sys_id='e6562e064f05f2002c1d029d0210c7b5'
) x
join
(select number, coalesce(max(u_approval_completed),max(a1.sys_created_on)) created from 
  mcdonalds_mdsdb.change_request_final a 
  join mcdonalds_mdsdb.sysapproval_approver_final a1 on a.sys_id=a1.document_id where a1.state="approved" 
  -- and a.sys_id='e6562e064f05f2002c1d029d0210c7b5' 
  group by 1 
  ) b
  on
  b.created=coalesce(x.u_approval_completed,x.sys_created_on) and x.number = b.number 
  left join mcdonalds_mdwdb.d_internal_contact d1 on concat('INTERNAL_CONTACT~',x.approver)=d1.row_id
  left join mcdonalds_mdwdb.f_change_request f on x.sys_id=f.row_id and x.sourceinstance=f.source_id
where  change_approver_c_key<>d1.row_key 
 and x.number not in (
select number from 
 (select number, a1.sys_created_on created,count(1) from    mcdonalds_mdsdb.change_request_final a    join 
mcdonalds_mdsdb.sysapproval_approver_final a1 on a.sys_id=a1.document_id where a1.state="approved"    group by 1,2   having count(1)>1
) 
a11

)
)temp;


