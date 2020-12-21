/* select	a11.row_key AS row_key,
	max(a11.organization_name) AS organization_name,
	a11.manager AS manager,
	a11.ag_level1_manager_name_c AS ag_level1_manager_name_c,
	a11.ag_level2_manager_name_c AS ag_level2_manager_name_c,
	a11.ag_level3_manager_name_c AS ag_level3_manager_name_c
from	ldb.d_ag_manager_hierarchy_c	a11
group by	a11.row_key,
	a11.manager,
	a11.ag_level1_manager_name_c,
	a11.ag_level2_manager_name_c,
	a11.ag_level3_manager_name_c */
	
	
select 'ldb.d_ag_manager_hierarchy_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_ag_manager_hierarchy_c a11


