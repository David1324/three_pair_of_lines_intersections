function find_3_lines_intersections_without_rotation()
    %set P:
    %line_i in set P: [pxi pyi pzi]'+t1i*[vxi vyi vzi]'

    %set Q:
    %line_i in set Q: [qxi qyi qzi]'+t2i*[uxi uyi uzi]'

    %The folowing 6 symbols are the UNKNOWN variables
    syms t11 t12 t13
    syms t21 t22 t23
    
    %In this function we find the values of the above 6 unkown variables
    %for intersection between line_i in set P with line_i in set Q    

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


    %for finding intersection between a line and its corresponding line,
    %only 2 components of the lines are enough for solving the equations
    %(the last component is used to make sure the is no inconsistency in
    %the solution). in this case I chose to use only the x and y components
    %of the line. Z component is omitted.
    %but this is not always possible. when coming to numbers instead of
    %symbols, sometimes I must take specific components in order to avoid
    %division be zero. Since it's symbolic equations, we don't have to
    %consider it here.
    lines1_points_without_rotation=lines1_points(1:2,:);
    lines1_vecs_without_rotation=lines1_vecs(1:2,:);
    lines2_points_without_rotation=lines2_points(1:2,:);
    lines2_vecs_without_rotation=lines2_vecs(1:2,:);

    eqn_without_rotation = lines1_points_without_rotation+lines1_vecs_without_rotation*vars1==lines2_points_without_rotation+lines2_vecs_without_rotation*vars2;

    tic
    [t11_result_without_rotation, t12_result_without_rotation, t13_result_without_rotation, t21_result_without_rotation, t22_result_without_rotation, t23_result_without_rotation] = solve(eqn_without_rotation,[t11, t12, t13, t21, t22, t23]);
    toc
    
    t11_result_without_rotation
    fprintf('\n');

    t12_result_without_rotation
    fprintf('\n');

    t13_result_without_rotation
    fprintf('\n');

    t21_result_without_rotation
    fprintf('\n');

    t22_result_without_rotation
    fprintf('\n');

    t23_result_without_rotation   
    fprintf('\n');
end