function find_3_lines_intersections_with_rotation()
    %set P:
    %set P is the set of lines that rotate towards set Q
    %line_i in set P: [pxi pyi pzi]'+t1i*[vxi vyi vzi]'

    %set Q:
    %set Q is fixed (not moving or rotating)
    %line_i in set Q: [qxi qyi qzi]'+t2i*[uxi uyi uzi]'

    %The folowing 9 symbols are the UNKNOWN variables
    syms t11 t12 t13
    syms t21 t22 t23    
    syms angle_x angle_y angle_z
    
    %In this function we find the values of the above unkown variables for 
    %intersection between the rotated set P and the fixed set Q      

    %The folowing symbols are the KNOWN variables
    syms px1 py1 pz1
    syms px2 py2 pz2
    syms px3 py3 pz3

    syms vx1 vy1 vz1
    syms vx2 vy2 vz2
    syms vx3 vy3 vz3    

    syms qx1 qy1 qz1
    syms qx2 qy2 qz2
    syms qx3 qy3 qz3

    syms ux1 uy1 uz1
    syms ux2 uy2 uz2
    syms ux3 uy3 uz3 

    lines1_points = [px1 px2 px3 ; py1 py2 py3 ; pz1 pz2 pz3];
    lines1_vecs = [vx1 vx2 vx3 ; vy1 vy2 vy3 ; vz1 vz2 vz3];
    lines2_points = [qx1 qx2 qx3 ; qy1 qy2 qy3 ; qz1 qz2 qz3];
    lines2_vecs = [ux1 ux2 ux3 ; uy1 uy2 uy3 ; uz1 uz2 uz3];

    vars1 = diag([t11 t12 t13]);
    vars2 = diag([t21 t22 t23]);

    rotate_z = [cos(angle_z) -sin(angle_z) 0;
            sin(angle_z) cos(angle_z) 0 ;
            0 0 1];

    rotate_y = [cos(angle_y) 0 sin(angle_y);
                0           1       0 ;
                -sin(angle_y) 0 cos(angle_y)];

    rotate_x = [1       0           0;
                0 cos(angle_x) -sin(angle_x) ;
                0 sin(angle_x) cos(angle_x)];

    R=rotate_x*rotate_y*rotate_z;

    eqn_with_rotation = R*(lines1_points+lines1_vecs*vars1)==lines2_points+lines2_vecs*vars2;

    
    %matlab runs the following equation for a very long time
    %I stopped in the middle. don't know if matlab was stuck or it just takes a
    %very long time
    fprintf('Solving the equation. please wait. might take a very long time (Or might stuck. dont really know..)\n');
    tic
    [t11_result_with_rotation, t12_result_with_rotation, t13_result_with_rotation, t21_result_with_rotation, t22_result_with_rotation, t23_result_with_rotation, angle_x_result, angle_y_result, angle_z_result] = solve(eqn_with_rotation,[t11, t12, t13, t21, t22, t23, angle_x, angle_y, angle_z]);
    toc
    fprintf('Finished solving the equation.\n');
    
    t11_result_with_rotation
    fprintf('\n');

    t12_result_with_rotation
    fprintf('\n');

    t13_result_with_rotation
    fprintf('\n');

    t21_result_with_rotation
    fprintf('\n');

    t22_result_with_rotation
    fprintf('\n');

    t23_result_with_rotation   
    fprintf('\n');

    angle_x_result
    fprintf('\n');

    angle_y_result
    fprintf('\n');

    angle_z_result
    fprintf('\n');
end