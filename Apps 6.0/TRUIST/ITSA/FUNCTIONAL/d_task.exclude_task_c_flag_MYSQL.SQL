SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
from truist_mdwdb.d_task d_task   
LEFT OUTER JOIN
truist_mdwdb.d_internal_organization d_internal_organization 
ON f_task.assignment_group_key=d_internal_organization.row_key  
where
d_task.exclude_task_c_flag <> case                      
when ( (d_internal_organization.organization_name not like 'ITSM-LOB-Branchinfo%'                        
and d_internal_organization.organization_name not like 'ITSM-LOB-HumanSystems%'                        
and d_internal_organization.organization_name not like 'ITSM-LOB-CPS%'                        
and d_internal_organization.organization_name not like 'ITSM-LOB-LoanServices%'                        
and d_internal_organization.organization_name not like 'ITSM-LOB-Wealth%')                       
or d_internal_organization.organization_name is  null) then 'N' else 'Y'    end