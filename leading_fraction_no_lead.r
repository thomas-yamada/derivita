"
By mostly Thomas and Richardson did the factor list making
"
#choose your roots (dont forget to add them to the roots list)
z1 := 2
z2 := -1
z3 := 2
z4 := -3
z5 := 5
z6 := 3
#choose your a value (this will be multiplied across your entire expression)
a := 1/2
#create a list of your roots
roots_list := [z1,z2,z3,z4]
#create a list of factors
factor_list := fill_list(item_count(roots_list), simplify(x-nth_item(index, roots_list)))


#poly_multiplied is your polynomial WITHOUT the "a" distributed over to everything. if this has fractions where you have a variable in the numerator of a fraction, use the file leading_fraction_from_polynomial.r
poly_multiplied := compute(product(factor_list))
#use that polynomial (without having multiplied over your a) and split them until each term's constant and variable(s)
is_match($c1:n$t1:term + $c2:n$t2:term + $c3:n$t3:term + $c4:n$t4:term + $c5:n$t5:term + $c6:n$t6:term + $c7:n$t7:term + $c8:n$t8:term + $c9:n$t9:term + $c10:n$t10:term, poly_multiplied)
#take each term and put them into a list
term_list := [t1, t2, t3, t4, t5, t6, t7, t8, t9, t10]
#remove 1, from the term that corresponds to the constant
exp1 := list_filter(term_list, is_match(:x^:nonzero_integer, item))
#square root everything to turn the "Undefined"s into errors
exp2 := list_transform(exp1, compute(sqrt(item)))
#filter out the errors now that "x" counts as a :variable
exp3 := list_filter(exp2, not(is_match(:x, item)))
#square the variables to return them to their original state
exp4 := list_transform(exp3, compute(item^2))
#create a dummy list of 1s
dummy_list := fill_list(10, 1)
#concatinate the final variable list with the dummy list
concat_var_list := list_concat(exp4, dummy_list)
#take each constant and put them into a list
constant_list := [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10]
#modify the constants by multiplying them by "a"
constant_list_modified := list_transform(constant_list, compute(item*a))
#take the first item in your modified constants list and the first item in the concatinated variable list and multiply them (not compute). do that for all 10 of each terms. as you can see, the dummy values were to dodge the Undefined outputs for those modified constants that dont have a variable to go with. zero times 1 is zero anyway. and the constant stays as is because its multiplied by 1
initial_combined := [nth_item(1, constant_list_modified)*nth_item(1 , concat_var_list), nth_item(2, constant_list_modified)*nth_item(2, concat_var_list), nth_item(3, constant_list_modified)*nth_item(3, concat_var_list), nth_item(4, constant_list_modified)*nth_item(4, concat_var_list), nth_item(5, constant_list_modified)*nth_item(5, concat_var_list), nth_item(6, constant_list_modified)*nth_item(6, concat_var_list), nth_item(7, constant_list_modified)*nth_item(7, concat_var_list), nth_item(8, constant_list_modified)*nth_item(8, concat_var_list), nth_item(9, constant_list_modified)*nth_item(9, concat_var_list), nth_item(10, constant_list_modified)*nth_item(10, concat_var_list)]
#simplify each list item, by getting rid of any non "multiplied" constants
final_combined := list_transform(initial_combined, basic_simplify(item))
#sum all the items up and basic simplify to take care of positive/negative symbols
final := basic_simplify(sum(final_combined))

poly_factored := a*factor(poly/a)
