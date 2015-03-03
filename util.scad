//utility functions for the Handaptive prosthesis designed to be customized, adapted, and 3D printed for individual users
//Copyright (C) 2015 Dale Price

/*
	This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


//takes array of a single digit's segments and range of segments by numerical id (assumes valid range, defaults to all segments in this digit)
//iterates through specified segments in the digit and performs child node for each one
//passes digit segments array to children as $segments, current segment as $segment, and current segment index as $segmentId
module for_segments(segments, segmentRange) {
	for(s=segmentRange) {
		$segments = segments;
		$segmentId = s;
		$segment = segments[s];
		children();
	}
}

//takes array of a single digit's segments and the numerical id of the segment to position at
//segment array should contain translation, rotation, and rotation about axis as the first three indices for each segment
//translates and rotates children to the position for the designated segment of the given digit
//startingSegment and transforms params should only be used when the module calls itself recursively
module position_at_segment(digit, segmentId, startingSegment=0) {
	if(startingSegment < segmentId) { //if not yet reached designated segment, transform and recurse
		translate(digit[startingSegment][0]) rotate(digit[startingSegment][1]) translate([0,0,digit[startingSegment][3][0]]) rotate([0,0,digit[startingSegment][2]]) //perform transformations for this segment, including translation by the length of the segment
			position_at_segment(digit, segmentId, startingSegment=startingSegment+1) children();
	}
	else { //if at designated segment
		translate(digit[startingSegment][0]) rotate(digit[startingSegment][1]) rotate([0,0,digit[startingSegment][2]]) //perform transformations for this segment, but not translation by segment length
			children();
	}
}

//takes array of digits, range of digits to apply to by numerical id (assumes digit range is valid, default to all defined digits)
//passes the digit segments array to each child node as variable '$digit'
//performs the child node once for each digit
module for_digits(digits, digitRange) {
	for (i = digitRange) { //iterate thru digits
		$digit = digits[i];
		children();
	}
}

//takes array of digits, range of digits to apply to by numerical id (assumes digit range is valid, defaults to all defined digits)
//passes the digit segments array to each child node as variable '$digit'
//renders a hull over all of the digits
module hull_around_digits(digits, digitRange) {
	hull() {
		for_digits(digits=digits, digitRange=digitRange) children();
	}
}

//takes array of digits, range of digits to apply to by numerical id (assumes digit range is valid, defaults to all defined digits)
//passes the digit segments array to each child node as variable '$digit'
//renders a hull between each digit and the next, not over all of them
module hull_between_digits(digits, digitRange) {
	for(i = digitRange) { //iterate thru digits
		if (i < digitRange[2]) { //don't iterate over the last one in the range
			hull() { //hull the child node for this digit with the next one
				//call child node for this digit
				union() { //the union() is just here because OpenSCAD won't let you redefine a variable twice in the same block and assign() is deprecated
					$digit = digits[i];
					children();
				}
				
				//call child node for next digit
				union() { //see note on union() above
					$digit = digits[i + 1];
					children();
				}
			}
		}
	}
}
