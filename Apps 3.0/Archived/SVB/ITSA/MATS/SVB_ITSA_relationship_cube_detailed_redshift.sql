select 'ldb.f_configuration_item_relation_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_relation_c       a11 
union
select'ldb.d_configuration_item_child_rel_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_relation_c       a11 
join ldb.d_configuration_item_child_rel_c       a12
on (a11.child_ci_key = a12.row_key)
union
select'ldb.d_configuration_item_parent_rel_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_configuration_item_relation_c    a11 
join ldb.d_configuration_item_parent_rel_c       a13
on (a11.parent_ci_key = a13.row_key)


