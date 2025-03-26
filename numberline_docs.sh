# Number Line JSX Documentation
## The line numbers listed are based on the problem `1.1.4.4`.

# the graph input
input := jsx_input("number line")

#taking the inputs from the graph and sorting them to be extracted
input_points := sort([[nth_item(1, input), nth_item(5, input)], [nth_item(3, input), nth_item(6,input)]], nth_item(1, item))
#extracting the value of the left most point
input_point_1 := list_get(input_points, 1, 1)
#extracting the value of the right most point
input_point_2 := list_get(input_points, 2, 1)
#extracting the solidity of the left most point at generation. if the left most point is moved past the right most point, the "point 1 solidity" button continues to affect the same point, which is now the right most point.
# input_solidity_point_1 := 0, open circle. solidity = 1, closed circle
input_solidity_point_1 := list_get(input_points, 1, 2)
#extracting the solidity of the right most point at generation. if the right most point is moved past the left most point, the "point 2 solidity" button continues to affect the same point, which is now the left most point
# input_solidity_point_2 := 0, open circle. solidity = 1, closed circle
input_solidity_point_2 := list_get(input_points, 2, 2)
#when there is a 2 point graph and input_andor := 1, the arrows are pointing outwards to -infinity and + infinity while keeping the area between them unshaded.
#when there is a 1 point graph and input_andor := 1, the arrow is pointing to -infinity.
#when there is a 1 point graph and input_andor := 0, the arrow is pointing to +infinity.
#when there is a 2 point graph and input_andor := 0, the shaded region is between the two points.
input_andor := nth_item(7,input)
#extracting the point number of the graph.
#when there is a 1 point graph, input_type := 1.
#when there is a 2 point graph, input_type := 0.
input_type := nth_item(8, input)


#when creating a graph to show with pre-applied inputs, use the following:
sol_graph := jsx_graph("number line", [[left, 0], [right, 0], solidity1, solidity2, andor, type])
#a jsx_graph must be stored as a variable.
#the first parameter is the ID of the custom script, in quotation marks.
#the rest of the parameters will be in square brackets
#the second parameter is the arguments.
#the first argument is the left side value. use the same format being: [left, 0]
#the second argument is the righ side value. use the same format being: [right, 0]
#changing the value from 0 to any other number will mess up the graph, leave it as is for all cases.
#the third argument is the solidity of the left point.
#the fourth argument is the solidity of the right point.
#the fifth argument is the andor, as explained above
#the sixth argument is the type, as explained above.
#you can leave out the type off the end, but if you only need to check for 1 solidity, still input a solidity variable as to make sure the right variables go to the right argument.

#for bounding boxes and increasing the range of the number line, you'll need to tweak the following lines in the custom script:
#51 for bounding box. if you want a range between 10 and 20, set it to [10, 2.5, 20, -3.5] or else the number line will be "off screen"
#59 and 61, set the first coordinate value to your default lower bound. preferably midpoint-1
#64 and 66, set the first coordinate value to your default upper bound. preferably midpoint+1
#82 for right arrow. seems that the first coordinate is the end minus 0.4, the second is at the end. i belive the angled segment is mirrored.
#83 for left arrow. seems that the first coordinate is the end plus 0.4, the second is at the end. i belive the angled segment is mirrored.
#84 for the very right. the first coordinate is the upper bound
#85 for the very left. the first coordinate is the lower bound.
#95 for the upper and lower bounds. i must equal the last (most likely visible number) on the left. after that, i must be less than the last value (non-visible) on the right.
#99 to set the upper number bound (if the upper bound is 20 but the last visible number displayed on the right is 19, then set to (i < 19)) so it knows where to set the small mini segments.

#100 for the segment intervals. default set to .5, you can change that if needed.*
#101 for the segment intervals. default set to .5, you can change that if needed.**
#119 for the andor. update the coordinate just as you did for line 84
#120 for the andor. update the coordinate just as you did for line 85
#122 for the andor. update the coordinate just as you did for line 84
#123 for the andor. update the coordinate just as you did for line 85
#135 for the andor. update the coordinate just as you did for line 84
#136 for the andor. update the coordinate just as you did for line 85
#139 for the andor. update the coordinate just as you did for line 84
#140 for the andor. update the coordinate just as you did for line 85
#162 for the dragging value intervals. default set to .5, change if needed.
#for the buttons, they will need to be adjusted to fit your new bounding box. modify only the first value in the coordinates, as that is the horizonal shifting value. you'll need to fiddle with it a bit, but make sure the x-value is somewhere in between your upper and lower bounds. if you change the value to that and you dont see any change, try pressing the "two point graph" or "one point graph" button, as the button coordinates you were adjusting may be not visible due to the wrong type of graph displaying.


#unsure where to change the visible number intervals
#visible number intervals are generated automatically but only by integers. dont know how to make it by floats.


*#100: changing the small segment intervals. you need to create multiple copies of the following (i reccomend against this as the segment intervals become grainy when rendered):
    var halfPipT = board.create('segment', [[i+.5, .12], [i+.5, .01]], {strokeWidth: 1.5, fixed: true, highlight: false})
#to make small segment intervals that follow a 0.25 interval instead of 0.5 interval, you'll need 3 of the line above. repalce the .5 with .25 on the first one. then on the second one make it .5, the third needs to be .75
#you can also reduce the stroke width to not crowd the segments.

**#101: changing the small segment intervals. you need to create multiple copies of the following (i reccomend against this as the segment intervals become grainy when rendered):
    var halfPipB = board.create('segment', [[i+.5, -.01], [i+.5, -.12]], {strokeWidth: 1.5, fixed: true, highlight: false})
#to make small segment intervals that follow a 0.25 interval instead of 0.5 interval, you'll need 3 of the line above. repalce the .5 with .25 on the first one. then on the second one make it .5, the third needs to be .75
#you can also reduce the stroke width to not crowd the segments.
