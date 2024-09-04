use <CornerBracket.scad>
use <gantryBracket.scad>

//xPosition = rands(0,200,1)[0];
//yPosition = rands(0,200,2)[0];
//zPosition = rands(100,320,3)[0];
xPosition = 0; 
yPosition = 0;
zPosition = 160;
//echo("x = ", xPosition, " y = ", yPosition, " and z = ", zPosition);

mstrCnr();
translate([0,320,0]) mirror([0,1,0]) mstrCnr();
translate([320,0,0]) mirror([1,0,0]) mstrCnr();
translate([320,320,0]) rotate([0,0,180]) mstrCnr();
translate([0,0,320]) mirror([0,0,1]){
    mstrCnr();
    translate([0,320,0]) mirror([0,1,0]) mstrCnr();
    translate([320,0,0]) mirror([1,0,0]) mstrCnr();
    translate([320,320,0]) rotate([0,0,180]) mstrCnr();
}
for(x=[0,320]) for(y=[0,320]) for(z=[0,320]){
    translate([x,y,10]) sqrTube();
    translate([10,y,z]) rotate([0,90,0]) sqrTube();
    translate([x,10,z]) rotate([-90,0,0]) sqrTube();
}
translate([0,0,0]){
//  Y rails
for(x=[26,294]) translate([x,30,zPosition-20]) 
                        rotate([-90,0,0]) linearRod(l=260);
//  X rails
for(y=[30,50]){
    translate([42,20+yPosition+y,zPosition-20]) 
            rotate([0,90,0]) linearRod(l=236);
}
//  X truck
translate([xPosition+41,yPosition+41,zPosition-40]) difference(){
    cube([38,38,6]);
    translate([19,19,-1]) cylinder(r=5,h=8);
}
// printable perimeter = 200 x 200 mm
translate([60,60,23]) difference(){
    translate([0,0]) square(200);
    translate([1,1]) square(198);
}

//  gantry
translate([31,31,zPosition]) mirror([0,0,1]) gantryCorner();
translate([289,31,zPosition]) 
        mirror([1,0,0]) mirror([0,0,1]) gantryCorner();
translate([289,289,zPosition]) 
        rotate([0,0,180]) mirror([0,0,1]) gantryCorner();
translate([31,289,zPosition]) mirror([0,1,0]) mirror([0,0,1]) gantryCorner();
translate([41,26,zPosition]) rotate([0,90,0]) sqrTube(l=238);
translate([26,41,zPosition]) 
        rotate([0,-90,0]) rotate([-90,0,0]) sqrTube(l=238);
translate([294,41,zPosition]) rotate([-90,0,0]) sqrTube(l=238);
translate([41,294,zPosition]) rotate([0,90,0]) sqrTube(l=238);
}

// zNema
for(x=[31,289]) for(y=[31,289]) translate([x,y,-2]) zNema();

//bed frame
color("silver") translate([-10,-10,20]) difference(){
    cube([340,340,2.5]);
    for(x=[0,340]) for(y=[0,340]) 
            translate([x,y,2]) cube([43,43,5],center=true);
    for(x=[41,299]) for(y=[41,299]) 
            translate([x,y,-1]) cylinder(r=12,h=5);
    for(x=[68,272]) for(y=[68,272]) 
            translate([x,y,-1]) cylinder(r=2,h=5);
    translate([79,79,-1]) cube([182,182,5]);
}

module linearRod(l=300,r=4){
    color("white") cylinder(d=2*r,h=l);
}

module sqrTube(l=300,od=20,w=3) color("lightgray"){
    linear_extrude(height=l) difference(){
        square(od,center=true);
        square(od-2*w,center=true);
    }
}
module angle(l=300,od=20,w=3) color("lightgray"){
    linear_extrude(height=l) difference(){
        square(od,center=true);
        translate([-3,3,0]) square([od,od],center=true);
    }
}

module mstrCnr() color("slategray") translate([-3.8,-3.8,-3.8]){
    rotate([0,0,135]) rotate([90-35.5]) corner();
}

module zNema(){
    color("black") linear_extrude(height=21.9){
        offset(3) offset(-3) square(42,center=true);
    }
    color("silver"){
        translate([0,0,21.9]) linear_extrude(height=0.1){
            offset(3) offset(-3) square(42,center=true);
        }
        cylinder(r=11,h=22.9);
    }
    color("black") cylinder(r=2.5,h=40);
}