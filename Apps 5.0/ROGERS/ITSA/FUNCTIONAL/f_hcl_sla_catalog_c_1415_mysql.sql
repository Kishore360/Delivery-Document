SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_problem.problem_investigation_start_c' ELSE 'SUCCESS' END as Message FROM (
select a.*,round(b.attained_execution_expected,2) from 
(
select RIGHT(d.row_id,8) xy1,round(attained_execution,2)attained_execution
-- ,tier,services,hcl_schedule_ac_attachment_ref,metric,measurement_window,agreed_minimum,agreed_minimum_formatted_c,agreed_expected,agreed_expected_formatted_c ,csi_eligible,
-- weighting_factor,reference,rag
from   rogersdev_mdwdb.d_hcl_sla_catalog_c  d 
join   rogersdev_mdwdb.f_hcl_sla_catalog_c f on hcl_sla_catalog_c_key=d.row_key
where sla='1.4.15')a
left join 
(

select xy,a.cnt1,b.cnt2,(a.cnt1/b.cnt2)*100.0 as attained_execution_expected
from 
(
select  date_format(convert_tz(work_end,'GMT','America/New_York'),'%Y%m01') xy,count(1) cnt1
from   rogersdev_mdsdb.change_request_final src
left join  rogersdev_mdwdb.d_change_request trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
left join  rogersdev_mdwdb.f_change_request tgt on src.sys_id =tgt.row_id and src.sourceinstance=tgt.source_id
left join rogersdev_mdwdb.d_internal_organization LKP on tgt.change_initiator_workgroup_c_key=LKP.row_key
left join rogersdev_mdwdb.d_lov lov on concat('STATE~CHANGE_REQUEST~~~', src.state)=lov.row_id
where  extract(year from work_end)>=2018 and 
LKP.organization_name like 'HCL%' and src.approval='approved' and src.u_sub_status in ('Successful') 
and lov.dimension_name in ('Completed','Closed') and src.u_environment='production'
 group by extract(month from convert_tz(work_end,'GMT','America/New_York'))
)a

 join 

( select  date_format(convert_tz(work_end,'GMT','America/New_York'),'%Y%m01') yz,count(1) cnt2
from   rogersdev_mdsdb.change_request_final src
left join  rogersdev_mdwdb.d_change_request trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 
left join  rogersdev_mdwdb.f_change_request tgt on src.sys_id =tgt.row_id and src.sourceinstance=tgt.source_id
left join rogersdev_mdwdb.d_internal_organization LKP on tgt.change_initiator_workgroup_c_key=LKP.row_key
left join rogersdev_mdwdb.d_lov lov on concat('STATE~CHANGE_REQUEST~~~', src.state)=lov.row_id
where extract(year from work_end)>=2018 and  
LKP.organization_name like 'HCL%' and src.approval='approved' and
src.u_sub_status <> 'Cancelled' and lov.dimension_name in ('Completed','Closed') and src.u_environment='production'
group by extract(month from convert_tz(work_end,'GMT','America/New_York'))
) b on xy=yz)b on b.xy=a.xy1 where round(a.attained_execution,2)<> round(b.attained_execution_expected,2))b1;