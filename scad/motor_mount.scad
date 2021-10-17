include <../library/nuts_and_bolts.scad>

$fn=60;

h1 = 3;
h2 = 6;

mount_tab_x = 1.5;
mount_tab_y = 6.5;
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
        for( y = [6.5 + 6.5/2, -6.5 - 6.5/2] )
        {
            for( x = [6.5 + 1.5/2, -6.5 - 1.5/2] )
            {
                translate([x, y, 0])
                translate(mount_tab_translation)
                {
                    cube([1.5, 6.5, 6]);
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

        rotate([0, 0, 40])
        {
            // main screw_holes
            x_translation = 19;
            y_translation = 25;
            for( x = [x_translation/2, -x_translation/2] )
            {
                for( y = [y_translation/2, -y_translation/2] )
                {
                    translate( [x, y, -h1] )
                    {
                        cylinder(h=h1+h2, r=1.5);
                        translate([0, 0, h1+h2-2.5])
                        rotate([0, 0, 20])
                        {
                            nutHole(3);
                            translate([0, 0, 2])
                            nutHole(3);
                        }
                    }
                }
            }
        }
    }
}

