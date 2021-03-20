xdel(winsid());
clc;
//getd('C:\Users\ab\Desktop\TP S7 eilco\TpImage\TP\cavite');


//// qst 1
//// qst2
//I=imread('code_postale.jpeg');
//figure;
//imshow(I);
//I_gray=rgb2gray(I);
//figure;
//imshow(I_gray);
////qst3
//seuil=imgraythresh(I_gray);
//I_bw=~im2bw(I_gray,seuil);
//figure;
//imshow(I_bw);
//// qst4
//str=imcreatese('ellipse',8,8);
////I_erode=imerode(I_bw,str);
//I_dilate=imdilate(I_bw,str);
//figure;
//imshow(I_dilate);
//// qst5
//figure;
//[L,N]=imlabel(I_dilate);
//imshow (L ,jetcolormap(N));
//// qst6
//for k= 1:N
//    objet=(L==k);figure;imshow(objet);
//end
//// L=1 donc 0g ; L=2 donc 1 ;L=3 donc 0d ;L=4 donc 2 ;L=5 donc 6
//
//// qst7
//image6= L==5;
//image2= L==4;
//image0d= L==3;
//image1= L==2;
//image0g= L==1;
//
////qst 8,9,10
////qst 11
//[surface_6_central_normalise,surface_6_ouest_normalise,surface_6_est_normalise,surface_6_sud_normalise,surface_6_nord_normalise]=cavite(image6);
//[surface_2_central_normalise,surface_2_ouest_normalise,surface_2_est_normalise,surface_2_sud_normalise,surface_2_nord_normalise]=cavite(image2);
//[surface_1_central_normalise,surface_1_ouest_normalise,surface_1_est_normalise,surface_1_sud_normalise,surface_1_nord_normalise]=cavite(image1);
//[surface_0g_central_normalise,surface_0g_ouest_normalise,surface_0g_est_normalise,surface_0g_sud_normalise,surface_0g_nord_normalise]=cavite(image0g);
//[surface_0d_central_normalise,surface_0d_ouest_normalise,surface_0d_est_normalise,surface_0d_sud_normalise,surface_0d_nord_normalise]=cavite(image0d);

//qst12
//qst13

Mtotale=[]; // manhattan
Vtotale=[];// barycentre

for i=0:9
    //strcat('.\training_set\',int2str(i),'.jpg');
    I=imread(strcat(['.\training_set\',string(i),'.jpg']));
    [Matrice,Vecteur]=train(I);
    Mtotale=[Mtotale;Matrice];
    Vtotale=[Vtotale;Vecteur];
end
//classifieur plus proche voisin 
// manhattan 
// test avec normalisation on n'a la même hauteur d'acquisition dans ce cas probléme 4/0 et parfois 7/1 et une fois 4/6
// test sans normalisation (sumsurface=1)) on n'a la même hauteur d'acquisition dans ce cas probléme 5/2 6/8 et une fois 5/1 
// euclidiene 
// test avec normalisation on n'a la même hauteur d'acquisition dans ce cas probléme 4/0 et parfois 7/1 et une fois 4/6
// test sans normalisation (sumsurface=1)) on n'a la même hauteur d'acquisition dans ce cas probléme 5/2 6/8 et une fois 2/9 et 4/6 et 5/1 et 7/1 

ImageAtester=imread('.\test_set\10.jpg');
figure;imshow(ImageAtester);
[M1,V1,centres]=train(ImageAtester);
for k=1:5
    tousCavite=M1(k,:);
    classe=1;
    //manhattan
    //Z= abs(tousCavite(1) - Mtotale(1,1)) + abs(tousCavite(2) - Mtotale(1,2)) + abs(tousCavite(3) - Mtotale(1,3)) + abs(tousCavite(4) - Mtotale(1,4)) + abs(tousCavite(5) - Mtotale(1,5)) ;
    //euclidiene
    Z= sqrt((tousCavite(1) - Mtotale(1,1))^2 + (tousCavite(2) - Mtotale(1,2))^2 + (tousCavite(3) - Mtotale(1,3))^2 + (tousCavite(4) - Mtotale(1,4))^2 + (tousCavite(5) - Mtotale(1,5))^2) ;
    for j=2:50
        //manhattan
        //Z0= abs(tousCavite(1) - Mtotale(j,1)) + abs(tousCavite(2) - Mtotale(j,2)) + abs(tousCavite(3) - Mtotale(j,3)) + abs(tousCavite(4) - Mtotale(j,4)) + abs(tousCavite(5) - Mtotale(j,5)) ;
        //euclidiene
        Z0= sqrt((tousCavite(1) - Mtotale(j,1))^2 + (tousCavite(2) - Mtotale(j,2))^2 + (tousCavite(3) - Mtotale(j,3))^2 + (tousCavite(4) - Mtotale(j,4))^2 + (tousCavite(5) - Mtotale(j,5))^2) ;
        if Z0<Z
            Z=Z0;
            classe=j;
        end
    end
    if(modulo(classe,5)== 0)then
                xstring(centres(1,k),150,msprintf('%d',(classe/5)-1));
                gce().font_size = 6;   
    else
                xstring(centres(1,k),150,msprintf('%d',classe/5));
                gce().font_size = 6; 
    end
end


////barycentre
//
//ImageAtester=imread('.\test_set\10.jpg');
//figure;imshow(ImageAtester);
//[M1,V1,centres]=train(ImageAtester);
//for k=1:5
//    tousCavite=M1(k,:);
//    classe=1;
//    //manhattan
//    Z= abs(tousCavite(1) - Vtotale(1,1)) + abs(tousCavite(2) - Vtotale(1,2)) + abs(tousCavite(3) - Vtotale(1,3)) + abs(tousCavite(4) - Vtotale(1,4)) + abs(tousCavite(5) - Vtotale(1,5)) ;
//    //euclidiene
//    //Z= sqrt((tousCavite(1) - Vtotale(1,1))^2 + (tousCavite(2) - Vtotale(1,2))^2 + (tousCavite(3) - Vtotale(1,3))^2 + (tousCavite(4) - Vtotale(1,4))^2 + (tousCavite(5) - Vtotale(1,5))^2) ;
//    for j=2:10
//        //manhattan
//        Z0= abs(tousCavite(1) - Vtotale(j,1)) + abs(tousCavite(2) - Vtotale(j,2)) + abs(tousCavite(3) - Vtotale(j,3)) + abs(tousCavite(4) - Vtotale(j,4)) + abs(tousCavite(5) - Vtotale(j,5)) ;
//        //euclidiene
//       // Z0= sqrt((tousCavite(1) - Vtotale(j,1))^2 + (tousCavite(2) - Vtotale(j,2))^2 + (tousCavite(3) - Vtotale(j,3))^2 + (tousCavite(4) - Vtotale(j,4))^2 + (tousCavite(5) - Vtotale(j,5))^2) ;
//        if Z0<Z
//            Z=Z0;
//            classe=j;
//        end
//    end
//    xstring(centres(1,k),150,msprintf('%d',(classe-1)));
//    gce().font_size = 6; 
//end







