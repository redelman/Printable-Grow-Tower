
// Only variables need to config are right here
tower_piece_height=4;
// Diameter of each piece. If you want 3" Schedule 40,
// then piece_diameter should be 3.5.
piece_diameter=3;
// Adjust lip height = 0.25" for 3" tower height
// Adjust lip height = 0.375" for everything else
lip_height = 0.375;
//lip_height = 0.25;
// Adjust netpot angle = 45" for 4" tower height
// Adjust netpot angle = 60" for 3" tower height
netpot_angle=45;
//netpot_angle=60;
// Adjust wall thickness = 5.4864mm for 3.5" diameter or larger
// Adjust wall thickness = 4mm for 3" diameter piece
//wall_thickness=5.4864; // 0.216" (wall thickness of 3" Schedule 40 PVC)
wall_thickness = 4;

// Uncomment the part you want to generate/render below.
//stackable_tower();
//end_cap();
//end_cap(cord_holes=false);
//end_cap(cord_holes=false,tube_hole=false);
//cap_insert();
//spacer();
//spacer(holes=false);

// DO NOT TOUCH ANYTHING BELOW THIS LINE

$fn = 360;
mm_per_inch = 25.4;
outside_diameter = mm_per_inch*piece_diameter; // Schedule 40 3" PVC is 3.5" OD, 3.068" ID

// Height of the mounting lip on bottom (or recess on top)
lip_h = mm_per_inch*lip_height;
lip_d = outside_diameter - wall_thickness;
lip_r = lip_d/2;

cyl_height = mm_per_inch*tower_piece_height-lip_h;


outside_radius = outside_diameter/2;

inside_diameter = outside_diameter - (wall_thickness*2);
inside_radius = inside_diameter/2;

//netpot_height = mm_per_inch*2.5;
netpot_height = cyl_height +lip_h - (mm_per_inch*1.5);
netpot_outside_dia = mm_per_inch*2;
netpot_outside_radius = netpot_outside_dia/2;
netpot_wall_thickness = 1.5;
netpot_inside_dia = netpot_outside_dia - (netpot_wall_thickness*2);
netpot_inside_radius = netpot_inside_dia/2;

cap_h = mm_per_inch*0.125;
cap_d = outside_diameter;
cap_r = cap_d/2;

// Spacer total height is 1.5", including lip
spacer_h = mm_per_inch*1.5-lip_h;

module stackable_tower() {
  difference() {
    // Create vertical cylinder
    union() {
      // outside cylinder
      translate([0,0,lip_h])
        cylinder(h=cyl_height-lip_h, r=outside_radius);
      // Create netpot cylinder
      translate([outside_diameter/2,0,cyl_height/2+3])
        rotate([0,netpot_angle,0]) 
        cylinder(h=netpot_height,r=netpot_outside_radius,center=true);
      // Bottom lip
      cylinder(h=lip_h, r=lip_r);
    }
    // top lip for mounting
    translate([0,0,cyl_height-lip_h])
      cylinder(h=lip_h, r=lip_r);
    // Netpot negative space
    translate([outside_diameter/2,0,cyl_height/2+3])
      rotate([0,netpot_angle,0])
      cylinder(h=netpot_height,r=netpot_inside_radius,center=true);
    // vertical cylinder negative space
    cylinder(h=cyl_height+2*lip_h, r=inside_radius);
  }
}

module end_cap(cord_holes=true, tube_hole=true)
{
  difference() {
    union() {
      difference() {
        cylinder(h=lip_h, r=lip_r);
        cylinder(h=lip_h, r=inside_radius);
      }
      translate([0,0,lip_h])
        cylinder(h=cap_h,r=cap_r);
    }
    if (tube_hole) {
      // hole for 1/4" poly drip tubing
      translate([0,0,lip_h]) 
        cylinder(h=cap_h,r=mm_per_inch*0.25/2);
    }
    if (cord_holes) {
      // 1/4" holes for parachute cord
      translate([0,cap_r/1.5,lip_h])
        cylinder(h=cap_h,r=mm_per_inch*0.25/2);
      translate([0,-cap_r/1.5,lip_h])
        cylinder(h=cap_h,r=mm_per_inch*0.25/2);
    }
  }
}

module cap_insert()
{
  insert_h = mm_per_inch*0.5;
  insert_l = outside_diameter-(wall_thickness*2)-wall_thickness/2;
  // insert wall thickness
  insert_t = 2;
  
  difference() {
    union() {
      translate([-insert_l/2,-insert_l/8,0]) 
        cube([insert_l, insert_l/4, insert_h]);
      translate([insert_l/8,-insert_l/2,0]) 
        rotate([0,0,90])
        cube([insert_l, insert_l/4, insert_h]);
    }
    
    translate([-insert_l/2,-insert_l/8+2,insert_t])
      cube([insert_l, insert_l/4-insert_t*2, insert_h]);
    translate([insert_l/8-2,-insert_l/2,insert_t]) rotate([0,0,90])
      cube([insert_l, insert_l/4-insert_t*2, insert_h]);
    
  }
}

module spacer(holes=true) {
  difference() {
    union() {
      translate([0,0,lip_h])
        cylinder(h=spacer_h, r=outside_radius);
      // Bottom lip
      cylinder(h=lip_h, r=lip_r);
    }
    cylinder(h=spacer_h+lip_h, r=inside_radius);
    // top lip for mounting
    translate([0,0,spacer_h])
      cylinder(h=lip_h, r=lip_r);

    if (holes) {
      // 1/4" holes for parachute cord
      translate([0,0,(spacer_h+lip_h)/2])
        rotate([0,90,0])
        cylinder(h=cyl_height,r=mm_per_inch*0.25/2,center=true);
    }

  }
}