function [M,V,CT]=train(Image)
    I_gray=rgb2gray(Image);
    seuil=imgraythresh(I_gray);
    I_bw=~im2bw(I_gray,seuil);
    str=imcreatese('ellipse',2,2);
    I_erode=imerode(I_bw,str);
    I_dilate=imdilate(I_bw,str);
    M=[];
    V=[];
    [L,N]=imlabel(I_dilate);
    [A,BB,CT] = imblobprop(L);
    for k= 1:N
        objet=(L==k);
        [surface_central_normalise,surface_ouest_normalise,surface_est_normalise,surface_sud_normalise,surface_nord_normalise]=cavite(objet);
        M=[M;surface_central_normalise,surface_ouest_normalise,surface_est_normalise,surface_sud_normalise,surface_nord_normalise];
    end 
    for j=1:5
        S=0;
        for i=1:5
            S=S+M(i,j);
        end
        V=[V S/5];
    end
endfunction;
