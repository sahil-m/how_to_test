fun_group_mean <- function(df, group_var, value_vars) {
  assert_that(is.tibble(df))
  assert_that(length(group_var) == 1)
  assert_that(length(value_vars) >= 1)
  assert_that(group_var %in% colnames(df))
  assert_that(all(value_vars %in% colnames(df)))
  
  result_df <- df %>% 
    group_by(.data[[group_var]]) %>% 
    summarise(across(all_of(value_vars), mean, na.rm=T, .names = "mean_{col}")) %>% 
    ungroup()
  
  assert_that(is.tibble(result_df))
  assert_that(nrow(result_df) == n_distinct(df[[group_var]]))
  assert_that(ncol(result_df) == length(group_var) + length(value_vars))
  
  return(result_df)
}

test_data = tibble(group_var = c('a', 'a', 'b', NA), value_var_1 = 1:4, value_var_2 = 2:5)
result_data = fun_group_mean(test_data, 'group_var', c('value_var_1', 'value_var_2'))
