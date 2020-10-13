fun_group_mean <- function(df, group_var, value_vars) {
  df %>% 
    group_by(.data[[group_var]]) %>% 
    summarise(across(all_of(value_vars), mean, .names = "mean_{col}")) %>% 
    ungroup()
}