clear all

close all

filename = 'BUDDI3D_1.stl';

[V, F, N, C, stltitle] = stlread(filename);

filename_customaircraft = ['BUDDI',sprintf('%d'),'.mat'];

F = F;

V = V;

C = C;
    
save(filename_customaircraft,'F','V','C')

cad2matdemo(filename)