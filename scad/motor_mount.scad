include <../library/nuts_and_bolts.scad>

$fn=60;

h1 = 3;
h2 = 6;

mount_tab_x = 1.5;
mount_tab_y = 7.5;
mount_tab_z = 6;

mount_tab_translation = [-mount_tab_x / 2, -mount_tab_y / 2, 0];

difference()
{
    union()
    {
        cylinder(r=20, h=h2);
        
        translate([0, 0, -h1])
        cylinder(r=20, h=h1);
    }
    union()
    {
        // for bottom rotor bearing/pin
        cylinder(r=12/2.0, h=h2);
        
        // for mount tabs
        mount_tab_xt = 9.75;
        for( y = [6.5 + 6.5/2, -6.5 - 6.5/2] )
        {
            for( x = [mount_tab_xt, -mount_tab_xt] )
            {
                translate([x, y, 0])
                translate(mount_tab_translation)
                {
                    cube([mount_tab_x, mount_tab_y, mount_tab_z]);
                    translate([-10, 6.5/2, 6/2])
                    rotate([0, 90, 0])
                    cylinder(r=1.6, h=20);
                }
            }
        }
        
        // for screws to lie flat
        x = 7.5;
        y = 6.5;
        z = 6;
        screw_plate_x = 19;
        screw_plate_y = 10;
        for( yt = [screw_plate_y, -screw_plate_y] )
        {
            for( xt = [screw_plate_x, -screw_plate_x] )
            {
                translate([xt, yt, 0])
                translate([-x/2, -y/2, 0])
                cube([x, y, z]);
            }
        }

//        rotate([0, 0, 90])
        {
            // main screw_holes
            x_translation = 19;
            y_translation = 25;
            for( x = [x_translation/2, -x_translation/2] )
            {
                translate( [x, 0, -h1] )
                {
                    cylinder(h=h1+h2, r=1.5);
                    translate([0, 0, h1+h2-2.5])
                    
                    {
                        for( z = [0, 2] )
                        {
                            translate([0, 0, z])
                            rotate([0, 0, 20])
                            nutHole(3);
                        }
                    }
                }
            }
            for( y = [y_translation/2, -y_translation/2] )
            {
                translate( [0, y, -h1] )
                {
                    cylinder(h=h1+h2, r=1.5);
                    translate([0, 0, h1+h2-2.5])
                    
                    {
                        for( z = [-4, -2, 0, 2] )
                        {
                            translate([0, 0, z])
                            rotate([0, 0, 20])
                            nutHole(3);
                        }
                    }
                }
            }
        }

//        rotate([0, 0, 40])
//        {
//            // main screw_holes
//            x_translation = 19;
//            y_translation = 25;
//            for( x = [x_translation/2, -x_translation/2] )
//            {
//                for( y = [y_translation/2, -y_translation/2] )
//                {
//                    translate( [x, y, -h1] )
//                    {
//                        cylinder(h=h1+h2, r=1.5);
//                        translate([0, 0, h1+h2-2.5])
//                        rotate([0, 0, 20])
//                        {
//                            if( x > 0 || y > 0)
//                            {
//                                translate([0, 0, 2])
//                                nutHole(3);
//                                
//                                nutHole(3);
//                            }
//                            else
//                            {
//                                translate([0, 0, -3.5])
//                                nutHole(3);
//                            }
//                        }
//                    }
//                }
//            }
//        }
        
        wire_void_x = 10;
        wire_void_y = 8;
        wire_void_z = 8;
        translate([- wire_void_x/2, -20, h1+h2-wire_void_z])
        cube([wire_void_x, wire_void_y, wire_void_z]);
//        x = 10;
//        y = 8;
//        z = 4;
//        translate([-x/2, -16 - y/2, h2 - z])
//        cube([x, y, z]);
    }
}

