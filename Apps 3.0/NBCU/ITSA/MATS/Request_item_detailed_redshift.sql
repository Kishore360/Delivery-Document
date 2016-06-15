 select'f_request_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 union
 select'd_lov_sc_req_item_action_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join  ldb.d_lov_sc_req_item_action_c         a12
on (a11.action_src_c_key = a12.row_key)
union
 select'd_lov_sc_req_item_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join  ldb.d_lov_sc_req_item_category_c         a12
on (a11.category_src_c_key = a12.row_key)
 union
  select'd_lov_sc_req_item_close_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join  ldb.d_lov_sc_req_item_close_code_c         a12
on (a11.close_code_src_c_key = a12.row_key)
union
  select'd_lov_sc_req_item_pending_state_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join  ldb.d_lov_sc_req_item_pending_state_c         a12
on (a11.pending_state_src_c_key = a12.row_key)
union
 select'd_lov_sc_req_item_region_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join  ldb.d_lov_sc_req_item_region_c                  a12
on (a11.region_src_c_key   = a12.row_key)
union
 select'd_lov_sc_req_item_sub_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join  ldb.d_lov_sc_req_item_sub_category_c                       a12
on (a11.sub_category_src_c_key    = a12.row_key)
union
 select'd_internal_contact_fulfilled_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join  ldb.d_internal_contact_fulfilled_by_c                  a12
on (a11.fulfilled_by_c_key    = a12.row_key)
union
 select'd_internal_contact_requestor_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join  ldb.d_internal_contact_requestor_c         a13
on (a11.requestor_c_key = a13.row_key)



union
 select'dh_user_group_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
                join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
union
 select'dh_user_group_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
                join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
				   join        ldb.dh_user_group_level1           a127
                  on         (a16.lev_1_key = a127.row_key)
union
 select'dh_user_group_level2' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
                join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
			 join        ldb.dh_user_group_level2           a130
                  on         (a16.lev_2_key = a130.row_key)
union






 select'dh_user_group_level3' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
                join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
				   join        ldb.dh_user_group_level3           a127
                  on         (a16.lev_3_key = a127.row_key)
union
 select'dh_user_group_level4' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
                join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
			 join        ldb.dh_user_group_level4           a130
                  on         (a16.lev_4_key = a130.row_key)
union

 select'dh_user_group_level5' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_item             a11 
 join        ldb.d_internal_organization_group         a15
                  on         (a11.assignment_group_key = a15.row_key)
                join        ldb.dh_user_group_hierarchy    a16
                  on         (a15.row_dn_key = a16.lev_0_key)
			 join        ldb.dh_user_group_level5           a130
                  on         (a16.lev_5_key = a130.row_key)