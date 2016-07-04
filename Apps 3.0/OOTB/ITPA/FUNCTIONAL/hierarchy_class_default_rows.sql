select hierarchy_class,row_id,row_key from <<tenant>>_mdwdb.d_h_all_hierarchies
where row_key in(0,-1)
order by row_key
