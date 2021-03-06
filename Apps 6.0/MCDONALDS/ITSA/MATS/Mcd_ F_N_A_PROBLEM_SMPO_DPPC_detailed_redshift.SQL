
/* D_CALENDAR_DATE
D_CALENDAR_MONTH
D_INTERNAL_CONTACT_ASSIGNED_TO
D_INTERNAL_CONTACT_ASSIGNMENT_GROUP_LEADER_SNAPSHOT
D_INTERNAL_CONTACT_ASSIGNMENT_GROUP_MANAGER_SNAPSHOT
D_INTERNAL_CONTACT_EXECUTIVE_LEADER_SNAPSHOT
D_INTERNAL_CONTACT_REQUEST_ITEM_CLOSED_BY_SMPO
D_INTERNAL_CONTACT_SENIOR_LEADER_SNAPSHOT
D_INTERNAL_ORGANIZATION_GROUP
D_SUPPLIER_ASSIGNED_TO_VENDOR_SNAPSHOT
F_A_PROBLEM_SMPO_DPPC
F_N_A_PROBLEM_SMPO_DPPC
 */
 
 select 'ldb."F_N_A_PROBLEM_SMPO_DPPC" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_A_PROBLEM_SMPO_DPPC" a11 
UNION 
select 'ldb."D_CALENDAR_MONTH" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_A_PROBLEM_SMPO_DPPC" a11 
join "ldb"."D_CALENDAR_MONTH" a12  on (a11.month_key = a12.ROW_KEY)
UNION 
select 'ldb."F_N_A_PROBLEM_SMPO_DPPC" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_N_A_PROBLEM_SMPO_DPPC" a11 
UNION 
Select 'D_INTERNAL_CONTACT_ASSIGNED_TO' AS Table_name,Count(a11.row_key) Row_Count 
from ldb.F_N_A_PROBLEM_SMPO_DPPC a11
JOIN ldb.D_INTERNAL_CONTACT_ASSIGNED_TO b ON a11.assigned_to_key=b.row_key 
UNION 
Select 'D_INTERNAL_ORGANIZATION_GROUP' AS Table_name,Count(a11.row_key) Row_Count 
from ldb.F_N_A_PROBLEM_SMPO_DPPC a11
JOIN ldb.D_INTERNAL_ORGANIZATION_GROUP b ON a11.ASSIGNMENT_GROUP_KEY=b.row_key
UNION 
Select 'D_INTERNAL_CONTACT_SENIOR_LEADER_SNAPSHOT' AS Table_name,Count(a11.row_key) Row_Count 
from ldb.F_N_A_PROBLEM_SMPO_DPPC a11
JOIN ldb.D_INTERNAL_CONTACT_SENIOR_LEADER_SNAPSHOT b ON a11.SENIOR_LEADER_KEY=b.row_key
UNION 
Select 'D_INTERNAL_CONTACT_REQUEST_ITEM_CLOSED_BY_SMPO' AS Table_name,Count(a11.row_key) Row_Count 
from ldb.F_N_A_PROBLEM_SMPO_DPPC a11
JOIN ldb.D_INTERNAL_CONTACT_REQUEST_ITEM_CLOSED_BY_SMPO b ON a11.request_item_closed_by_key=b.row_key
UNION 
Select 'D_INTERNAL_CONTACT_EXECUTIVE_LEADER_SNAPSHOT' AS Table_name,Count(a11.row_key) Row_Count 
from ldb.F_N_A_PROBLEM_SMPO_DPPC a11
JOIN ldb.D_INTERNAL_CONTACT_EXECUTIVE_LEADER_SNAPSHOT b ON a11.EXECUTIVE_LEADER_KEY=b.row_key
UNION 
Select 'D_INTERNAL_CONTACT_ASSIGNMENT_GROUP_MANAGER_SNAPSHOT' AS Table_name,Count(a11.row_key) Row_Count 
from ldb.F_N_A_PROBLEM_SMPO_DPPC a11
JOIN ldb.D_INTERNAL_CONTACT_ASSIGNMENT_GROUP_MANAGER_SNAPSHOT b ON a11.ASSIGNMENT_GROUP_MANAGER_KEY=b.row_key
UNION 
Select 'D_INTERNAL_CONTACT_ASSIGNMENT_GROUP_LEADER_SNAPSHOT' AS Table_name,Count(a11.row_key) Row_Count 
from ldb.F_N_A_PROBLEM_SMPO_DPPC a11
JOIN ldb.D_INTERNAL_CONTACT_ASSIGNMENT_GROUP_LEADER_SNAPSHOT b ON a11.LEADER_KEY=b.row_key
UNION 
Select 'D_SUPPLIER_ASSIGNED_TO_VENDOR_SNAPSHOT' AS Table_name,Count(a11.row_key) Row_Count 
from ldb.F_N_A_PROBLEM_SMPO_DPPC a11
JOIN ldb.D_SUPPLIER_ASSIGNED_TO_VENDOR_SNAPSHOT b ON a11.VENDOR_KEY=b.row_key