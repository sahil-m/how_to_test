source("functions.R")

# What to check:
# - group_var
#   - single/multiple
#   - NA in classes
#     - all
#       - has
#       - is
#     - not all
#       - has
#       - is
# 
# - value_vars
#   - single/multiple
#   - NA in values
#     - all
#     - few
#   - name
#   - functionality: mean


test_fun_group_mean_when_oneOfThe_groupClass_hasNA_and_oneValueVar <- function() {
  test_data = tibble(group_var = c('a', 'a', 'b', NA), value_var_1 = 1:4)
  result_data = fun_group_mean(test_data, 'group_var', 'value_var_1')
  
  are_equal(result_data, tibble(group_var = c('a','b',NA), mean_value_var_1 = c(1.5,3,4)))
}
test_fun_group_mean_when_oneOfThe_groupClass_hasNA_and_oneValueVar()


test_fun_group_mean_when_oneOfThe_groupClass_hasNA_and_multipleValueVar <- function() {
  test_data = tibble(group_var = c('a', 'a', 'b', NA), value_var_1 = 1:4, value_var_2 = 2:5)
  result_data = fun_group_mean(test_data, 'group_var', c('value_var_1', 'value_var_2'))
  
  are_equal(result_data, tibble(group_var = c('a','b',NA), mean_value_var_1 = c(1.5,3,4), mean_value_var_2 = c(2.5,4,5)))
}
test_fun_group_mean_when_oneOfThe_groupClass_hasNA_and_multipleValueVar()


# don't check for edge scenarios in input, instead
# check for valid input
# check for valid output
  # may be defined in terms of input
