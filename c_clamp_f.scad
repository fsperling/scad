use <c_clamp_m.scad>
use <screw_with_nut.scad>

module c_clamp_f_holes(vertical_spacing=-8.4) {
  // hole 1
  translate([18,vertical_spacing,8]) {
    rotate([90,0,0]) screw_with_nut();
  }

  // hole 2
  translate([18,vertical_spacing,21]) {
    rotate([90,0,0]) screw_with_nut();
  }
}

module remove() {
  c_clamp_f_holes();
  translate([-3.5,0.5,0]) {
    scale(1.20, 1.25, 1) {
      c_clamp_m();
    }
  }

  // make space for the bottom.
  translate([3,-1,0]) {
    color([1,1,1]) cube([30,1, 64]);
  }

  // extra spacing to deal with 3D-printing errors
  // translate([11.5,-5,0]) {
    // color([0,1,0]) cube([13,1, 64]);
  // }
}

module c_clamp_f() {
  difference() {
    translate([8,-13,0]) {
      color([0,1,1]) cube([20,12, 64]);
    }
    remove();
  }
}

c_clamp_f();
// translate([0,-1,0]) {
  // c_clamp_m();
// }

// c_clamp_f_holes();
