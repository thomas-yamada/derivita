#input a polynomial with 10 or less terms
INPUT_POLYNOMIAL := 

is_match($c1:n$t1:term + $c2:n$t2:term + $c3:n$t3:term + $c4:n$t4:term + $c5:n$t5:term + $c6:n$t6:term + $c7:n$t7:term + $c8:n$t8:term + $c9:n$t9:term + $c10:n$t10:term, INPUT_POLYNOMIAL)
#take each term and put them into a list
term_list := [t1, t2, t3, t4, t5, t6, t7, t8, t9, t10]
#set a math func for each term
math_funcs(one_h, two_h, three_h, four_h, five_h, six_h, seven_h, eight_h, nine_h, ten_h)
#setup a function to equal each term. if you have multiple possible variables that can be used for the question, put all of them in
one_h(x, t) = t1; two_h(x, t) = t2; three_h(x, t) = t3; four_h(x, t) = t4; five_h(x, t) = t5; six_h(x, t) = t6; seven_h(x, t) = t7; eight_h(x, t) = t8; nine_h(x, t) = t9; ten_h(x, t) = t10
#compute all of the functions of each term, putting "1" in for each possible variable.
altered := [compute(one_h(1, 1)), compute(two_h(1,1)), compute(three_h(1,1)), compute(four_h(1,1)), compute(five_h(1,1)), compute(six_h(1,1)), compute(seven_h(1,1)), compute(eight_h(1,1)), compute(nine_h(1,1)), compute(ten_h(1,1))]
#remove "undefined"
altered2 := list_filter(altered, not(is_match(:x, item)))
#isolate variables by multiplying original terms by reciprocal of the coefficient
isolate_var := [compute((t1)/(nth_item(1, altered2))), compute((t2)/(nth_item(2, altered2))), compute((t3)/(nth_item(3, altered2))), compute((t4)/(nth_item(4, altered2))), compute((t5)/(nth_item(5, altered2))), compute((t6)/(nth_item(6, altered2))), compute((t7)/(nth_item(7, altered2))), compute((t8)/(nth_item(8, altered2))), compute((t9)/(nth_item(9, altered2))), compute((t10)/(nth_item(10, altered2)))]
#remove 1
isolate_var2 := list_filter(isolate_var, not(is_match(1, item)))
#turn all variables into a square root so that all variables are caught by pattern matching
isolate_var3 := list_transform(isolate_var2,  compute(sqrt(item)))
#remove the errors
isolate_var4 := list_filter(isolate_var3, not(is_match(:x, item)))
#restore variables to originals
isolate_var5 := list_transform(isolate_var4, compute(item^2))
#create a dummy constant list with enough 0s to make the coefficients list match the max amount of possible terms
dummy_const := fill_list(compute(item_count(term_list)-item_count(altered2)), 0)
#concat them
const_ready := list_concat(altered2, dummy_const)
#create a dummy variabl elist with enough 0s to make the variable list match the max amount of possible terms
dummy_var := fill_list(compute(item_count(term_list)-item_count(isolate_var5)), 1)
#concat them
var_ready := list_concat(isolate_var5, dummy_var)
#combine everything together, including the excess 0s and 1s
combined := [nth_item(1, const_ready)*nth_item(1, var_ready), nth_item(2, const_ready)*nth_item(2, var_ready), nth_item(3, const_ready)*nth_item(3, var_ready), nth_item(4, const_ready)*nth_item(4, var_ready), nth_item(5, const_ready)*nth_item(5, var_ready), nth_item(6, const_ready)*nth_item(6, var_ready), nth_item(7, const_ready)*nth_item(7, var_ready), nth_item(8, const_ready)*nth_item(8, var_ready), nth_item(9, const_ready)*nth_item(9, var_ready), nth_item(10, const_ready)*nth_item(10, var_ready)]
#basic simplify it all
semi_final := list_transform(combined, basic_simplify(item))
#combine and remove 0s
final := basic_simplify(sum(semi_final))
