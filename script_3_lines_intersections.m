clear;
close all;
clc;

%This function is working fine:
find_3_lines_intersections_without_rotation();

fprintf('\n\n\n');

%matlab runs the following equation (with rotation) for a very long time
%I stopped in the middle. don't know if matlab was stuck or it just takes a
%very long time

find_3_lines_intersections_with_rotation();
