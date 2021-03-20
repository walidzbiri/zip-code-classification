function [surface_central_normalise,surface_ouest_normalise,surface_est_normalise,surface_sud_normalise,surface_nord_normalise]=cavite(Image)
A1=Image;
A2=Image;
A3=Image;
A4=Image;
[row, column] = size(Image);
for  i=1:row
    for j=1:column
        if A1(i,j) == %T then
            A1(i,1:j) = %T;
        end
        if A2(i,j) == %T then
            A2(i,j:column) = %T;
        end
        if A3(i,j) == %T then
            A3(i:row,j) = %T;
        end
        if A4(i,j) == %T then
            A4(1:i,j) = %T;
        end
    end
end

and_cav= A1 & A2 & A3 & A4;
cavite_central= (and_cav & ~Image) |( ~and_cav & Image);
cavite_est= ~A1 & A2 & A3 & A4;
cavite_ouest= A1 & ~A2 & A3 & A4;
cavite_sud= A1 & A2 & A3 & ~A4;
cavite_nord= A1 & A2 & ~A3 & A4;

surface_central=sum(cavite_central==%t);
surface_ouest=sum(cavite_ouest==%t);
surface_est=sum(cavite_est==%t);
surface_nord=sum(cavite_nord==%t);
surface_sud=sum(cavite_sud==%t);

sum_surf=sum(cavite_central==%t)+sum(cavite_ouest==%t)+sum(cavite_est==%t)+sum(cavite_nord==%t)+sum(cavite_sud==%t);
// avec normalisation
if sum_surf ~= 0
    //sum_surf=1;
    surface_central_normalise=surface_central /sum_surf;
    surface_ouest_normalise=surface_ouest /sum_surf;
    surface_est_normalise=surface_est /sum_surf;
    surface_sud_normalise=surface_sud /sum_surf;
    surface_nord_normalise=surface_nord /sum_surf;
else
    surface_central_normalise=0;
    surface_ouest_normalise=0;
    surface_est_normalise=0;
    surface_sud_normalise=0;
    surface_nord_normalise=0;
end



endfunction;



