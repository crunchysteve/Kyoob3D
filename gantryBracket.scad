gantryCorner();

module gantryCorner(tBolts=true) difference(){
    $fn = 60;
    union(){
        translate([-5.3,-5.3,10]) cube([30.6,30.6,40],center=true);
        translate([-20.6,-20.6,10]) rotate([21,0,0]) cube([3,12,16.8]);
        translate([-20.6,-20.6,10]) rotate([0,-21,0]) cube([12,3,16.8]);
        rotate([0,90,0]) translate([-10,-15,-10]){
            translate([3.2,3.2,0]) cube([13.6,13.6,40]);
        }
        rotate([-90,0,0]) translate([-15,-10,-10]){
            translate([3,3,0]) cube([14,14,40]);
        }
    }
    if(tBolts){
        for(a=[0:90:270]) rotate([0,0,a]) 
                translate([0,7,-11]) cylinder(r=1.5,h=42);
    } else {
        for(a=[0:120:240]) rotate([0,0,a]) 
                translate([0,7,-11]) cylinder(r=1.5,h=42);
    }
    translate([-5,-21,20]) rotate([-90,0,0]) cylinder(r=4,h=42);
    translate([0,0,-11]) cylinder(r=4,h=42);
    translate([10,10,14]) rotate([0,0,45]) cube([7,7,50],center=true);
}