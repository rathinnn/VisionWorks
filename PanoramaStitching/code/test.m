close all
clear all
saveFileName="withalpha.png";
I1=imread("1.png");
I11=single(I1);
I2=imread("2.png");
I22=single(I2);
[f1,d1] = vl_sift(I11) ;
[f2,d2] = vl_sift(I22) ;
 M = SIFTSimpleMatcher(double(d1'), double(d2'), 0.7);
    TRANSFORM = RANSACFit(double(f1(1:2,:)'), double(f2(1:2,:)'), M,3,0.1,0.3*size(M,1));
    
 PairStitch(I1,I2, TRANSFORM, saveFileName);
disp(['The completed file has been saved as ' saveFileName]);

imshow(imread(saveFileName));
