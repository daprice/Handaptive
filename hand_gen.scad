//modules used to generate the parts of the Handaptive prosthesis
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


include <util.scad>

module hand(digits) {

	allDigits = [0:len(digits)-1];

	//palm
	difference() {
		hull_between_digits(digits, allDigits) {
			//main body of palm
			translate($digit[0][0]) rotate($digit[0][1]) rotate($digit[0][2]) cylinder(h = $digit[0][3][0], d = $digit[0][3][1]);
			
			//rounded knuckles
			position_at_segment($digit, [0]) {
				translate([0,0,$digit[0][3][0]]) sphere(d=$digit[0][3][1]);
			}
		}
		
		//cutout for wearer's hand
		hull() {
			hull_between_digits(digits, [1:4]) {
				position_at_segment($digit, 0) { //position at the metacarpal
					hull() {
						translate([0, $digit[0][3][1] / 2, -5]) { //position halfway palmward from the center of the metacarpal
							cylinder(h = $digit[0][3][0] - 5, d = $digit[0][3][1] / 2);
							translate([0,0,$digit[0][3][0] - 5]) sphere(d=$digit[0][3][1] / 2);
						}
					}
				}
			}
			//hull with another copy far away to ensure nothing blocks the wearer's hand
			translate([0,100,0]) hull_between_digits(digits, [1:4]) {
				position_at_segment($digit, 0) { //position at the metacarpal
					hull() {
						translate([0, $digit[0][3][1] / 2, -5]) { //position halfway palmward from the center of the metacarpal
							cylinder(h = $digit[0][3][0] - 5, d = $digit[0][3][1] / 2);
						}
					}
				}
			}
		}
	}

	for_digits(digits, allDigits) {
		//finger bones
		for_segments(segments = $digit, segmentRange=[1 : len($digit) - 1]) { //for all segments except metacarpal
			position_at_segment(digit=$segments, segmentId=$segmentId) {
				cylinder(h=$segment[3][0], d=$segment[3][1]); //finger "bone"
				translate([0,0,$segment[3][0]]) sphere(d=$segment[3][1]); //rounded knuckle
			}
		}
	}
}
