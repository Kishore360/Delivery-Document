select 'f_problem' as Table_name, count(a11.row_key) Row_Count from ldb.f_problem a11
union
select 'd_problem_cause_code_c' as Table_name, count(a11.row_key) Row_Count from ldb.f_problem a11
join        ldb.d_problem  a120
                  on     a11.problem_key=a120.row_key
 join        ldb.d_problem_cause_code_c   a136
                  on         (a120.cause_code_c_key = a136.row_key)
				  union
				  select 'd_problem_close_code_c' as Table_name, count(a11.row_key) Row_Count from ldb.f_problem a11
join        ldb.d_problem  a120
                  on     a11.problem_key=a120.row_key
				  join        ldb.d_problem_close_code_c    a137
                  on         (a120.close_code_c_key = a137.row_key)
				  union
				  select 'd_problem_itlc_poc_c' as Table_name, count(a11.row_key) Row_Count from ldb.f_problem a11
join        ldb.d_problem  a120
                  on     a11.problem_key=a120.row_key
				    join        ldb.d_problem_itlc_poc_c           a138
                  on         (a120.itlc_poc_c_key = a138.row_key)
				  union
				  select 'd_problem_resolution_code_c' as Table_name, count(a11.row_key) Row_Count from ldb.f_problem a11
join        ldb.d_problem  a120
                  on     a11.problem_key=a120.row_key
				    join        ldb.d_problem_resolution_code_c          a140
                  on         (a120.resolution_code_c_key = a140.row_key)
				  union
				  select 'd_problem_sub_cause_code_c' as Table_name, count(a11.row_key) Row_Count from ldb.f_problem a11
join        ldb.d_problem  a120
                  on     a11.problem_key=a120.row_key
				  join        ldb.d_problem_sub_cause_code_c          a141
                  on         (a120.sub_cause_code_c_key = a141.row_key)