corner();

module corner() difference(){
    translate([0,0,6.5]) rotate([35.5,0,0]) union(){
        rotate([0,-45,0]) translate([-10,-10,-10]){
            cube([20,20,20]);
            translate([3.2,3.2,0]) cube([13.6,13.6,40]);
        }
        rotate([0,45,0]) translate([-10,-10,-10]){
            cube([20,20,20]);
            translate([3.2,3.2,0]) cube([13.6,13.6,40]);
        }
        rotate([0,-45,0]) rotate([-90,0,0]) translate([-10,-10,-10]){
            cube([20,20,20]);
            translate([3.2,3.2,0]) cube([13.6,13.6,40]);
        }
    }
    mirror([0,0,1]) cylinder(r=30,h=30);
}