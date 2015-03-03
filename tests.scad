//test configurations for the Handaptive prosthesis designed to be customized, adapted, and 3D printed for individual users
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


//render the hand using various test configurations

use <hand_gen.scad>

test1_digits = [
	//finger 0 (thumb)
	[
		//metacarpal
		[
			[-10, 15, 0], //position
			[-30, -15, 0], //rotation
			-100, //rotation about its own axis
			//attributes
			[
				60, //length
				15 //bone diameter
			]
		],
		//proximal phalange
		[
			[0, 0, 0], //position relative to end of previous segment
			[-15 - 60 * $t, 0, 0], //rotation relative to end of previous segment
			0, //rotation about its own axis relative to previous segment
			//attributes
			[
				35, //length
				10 //bone diameter
			]
		],
		//intermediate phalange
		[
			[0, 0, 0], //position
			[-10 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				32, //length
				10 //bone diameter
			]
		]
	],
	//finger 1 (forefinger)
	[
		//metacarpal
		[
			[0, 0, 0], //position
			[0, -3, 0], //rotation
			-7, //rotation about its own axis
			//attributes
			[
				75, //length
				15 //bone diameter
			]
		],
		//proximal phalange
		[
			[0, 0, 0], //position
			[-15 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				45, //length
				10 //bone diameter
			]
		],
		//intermediate phalange
		[
			[0, 0, 0], //position
			[-10 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				30, //length
				10 //bone diameter
			]
		],
		//distal phalange
		[
			[0, 0, 0], //position
			[-10 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				23, //length
				10 //bone diameter
			]
		],
	],
	//finger 2 (middle finger)
	[
		//metacarpal
		[
			[10, -1, 0], //position
			[2, 4, 0], //rotation
			2, //rotation about its own axis
			//attributes
			[
				75, //length
				15 //bone diameter
			]
		],
		//proximal phalange
		[
			[0, 0, 0], //position
			[-15 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				52, //length
				10 //bone diameter
			]
		],
		//intermediate phalange
		[
			[0, 0, 0], //position
			[-10 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				33, //length
				10 //bone diameter
			]
		],
		//distal phalange
		[
			[0, 0, 0], //position
			[-10 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				25, //length
				10 //bone diameter
			]
		]
	],
	//finger 3 (ring finger)
	[
		//metacarpal
		[
			[20, 0, 0], //position
			[0, 11, 0], //rotation
			7, //rotation about its own axis
			//attributes
			[
				72, //length
				15 //bone diameter
			]
		],
		//proximal phalange
		[
			[0, 0, 0], //position
			[-15 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				50, //length
				10 //bone diameter
			]
		],
		//intermediate phalange
		[
			[0, 0, 0], //position
			[-10 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				31, //length
				10 //bone diameter
			]
		],
		//distal phalange
		[
			[0, 0, 0], //position
			[-10 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				25, //length
				10 //bone diameter
			]
		]
	],
	//finger 4 (pinky finger)
	[
		//metacarpal
		[
			[30, 2, 0], //position
			[-3, 18, 0], //rotation
			12, //rotation about its own axis
			//attributes
			[
				69, //length
				15 //bone diameter
			]
		],
		//proximal phalange
		[
			[0, 0, 0], //position
			[-15 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				39, //length
				10 //bone diameter
			]
		],
		//intermediate phalange
		[
			[0, 0, 0], //position
			[-10 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				25, //length
				10 //bone diameter
			]
		],
		//distal phalange
		[
			[0, 0, 0], //position
			[-10 - 60 * $t, 0, 0], //rotation
			0, //rotation about its own axis
			//attributes
			[
				23, //length
				10 //bone diameter
			]
		]
	]
];

hand(test1_digits);
