-- Manually Verifying the Problem/Incident Reassignment 
-- -------------------------------------------

-- Step 1 : 
-- --------
-- Get the problem Number and place them in the below query 

-- select sys_id,opened_by,priority,assigned_to,assignment_group,convert_tz(sys_created_on,'GMT','America/New_York') 
-- from tjx_mdsdb.problem_final where number='PRB0045564'; 

-- Step 2:
-- --------
-- Use the sys_id from the above query and replace this  in the below query documentkey column 

-- Case 1 : If the activities of PRIORITY  has to be checked in sys_audit , then use the priority Query below.
		 -- If the priority is not present , then priority from the problem_final table will be the PRIORITY defaulted to display in the MSTR Web.
-- Case 2 : Similarly for assignment group and assigned_to


-- select a.documentkey,user,newvalue,oldvalue , fieldname,a.sys_created_on from  tjx_mdsdb.sys_audit_final a 
-- where  fieldname in ('priority') and tablename='problem' and a.documentkey='84375632eda139c0c10d9e456b86dbd8'; -- 2016-04-26 15:27:28

-- select a.documentkey,user,newvalue,oldvalue , fieldname,a.sys_created_on from   tjx_mdsdb.sys_audit_final a 
-- where  fieldname in ('assignment_group') and tablename='problem' and a.documentkey='c2ed87324fac52801715029d0210c79e';

-- select a.documentkey,user,newvalue,oldvalue , fieldname,a.sys_created_on from   tjx_mdsdb.sys_audit_final a 
-- where  fieldname in ('assigned_to') and tablename='problem' and a.documentkey='c2ed87324fac52801715029d0210c79e';

-- Step 3 :
-- --------
-- Verifying in the Target F_T_TASK_ACTIVITY TABLE

-- Case 1 :Use the below query to get the task_key value which is to be placed in the case 2 query below:
		
		-- Select row_key from tjx_mdwdb.d_problem where problem_number=''	
			
-- Case 2 : Use the upper query (row_key) and place it in the below Query to check the activity changes 

-- SELECT a.row_key,
       -- a.task_attribute_wh_name,
       -- a.task_wh_type,
       -- a.task_key,task_attribute_wh_old_value_key,lov_old.dimension_code old_val,
       -- a.task_attribute_wh_new_value_key,lov_new.dimension_code new_val,
       -- a.created_on,a.secondary_duration,a.assignment_group_on_change_c_key
-- FROM tjx_mdwdb.f_t_task_activity a join tjx_mdwdb.d_lov lov_old on a.task_attribute_wh_old_value_key = lov_old.row_key
-- join tjx_mdwdb.d_lov lov_new on a.task_attribute_wh_new_value_key = lov_new.row_key
-- WHERE task_key = 530207 and 
-- task_attribute_wh_name ='priority'
  -- AND task_wh_type = 'incident' order by created_on;

-- Step 4 :
-- --------
-- To Verify the assignee or assignment group use the below query : 
-- These row_id values  are nothing but the oldvalue and newvalue from the sys_audit table

-- select full_name from tjx_mdwdb.d_internal_contact where row_id like '%5c6a36c0753b2000d1bdd250276d1d87%';
-- select organization_name from tjx_mdwdb.d_internal_organization where row_id like '%a945831dd0ac340051aa709f7838f310%';

-- Step 5 :
-- --------
-- Please verify the ACTIVITES of a problem/Incident USING THE columns in MSTR WEB :

-- Priority_change_by_user
-- Assignment_Group_At_Change
-- Old Priority
-- New Priority
-- Old Assignment_Group
-- New Assignment_Group
-- Old Assignee
-- New Assignee
-- # of reassignments(priority)
-- # of reassignments(Group)
-- Activity Date
-- Assignee Handoff #
-- Duration 

-- Case 1 : While verifying the USER REASSIGNMENTS : Have the filter condition applied as USER
-- Case 2 : While verifying the PRIORITY REASSIGNMENTS like Priority change assignment group  and priority change user
			-- :Have the filter condition applied as PRIORITY
-- Case 3 : While verifying the GROUP REASSIGNMENTS:Have the filter condition applied as GROUP 

-- For More Detailed information please refer TEST Documents Uploaded @ :
-- ----------------------------------------------------------------------
-- https://72dc00769811d091.sharepoint.com/Shared%20Documents/Forms/AllItems.aspx?FolderCTID=0x012000436A45888F74CC4FB822B1769519937D&View=%7B71F363EE-A4F0-4FF4-B508-7DE71CAD62C2%7D&id=%2FShared%20Documents%2FServices%2FDELIVERY%20PROCESS%20IMPROVEMENT%2FPROJECT%20DOCUMENTS%2FTJX%2FQA%20Documents%2FDEV%2FReassignments-Problem%20and%20Incident%20DEV%20Tested

-- For More Information :Please contact Prabhuram Sridharan