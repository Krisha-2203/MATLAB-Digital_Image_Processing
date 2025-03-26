%Experiment 6 - Region Growing
%Krisha Lakhani - 60001200097
clc;
clear all;
close all;
a=imread('test2.bmp');
% a=rgb2gray(a);
[r c]=size(a);
g=zeros(r,c);
figure(1);
imshow(a);
[Y,X]=ginput(1);
temp=a(round(X),round(Y));
g(round(X),round(Y))=1;
for x=2:1:r-1
    for y=2:1:c-1
        for p=2:1:r-1
            for q=2:1:c-1
             if(g(p,q)==1)
                    if a(p,q)==a(p,q+1)
                        g(p,q+1)=1;
                    end
                    if a(p,q)==a(p,q-1)
                        g(p,q-1)=1;
                    end
                    if a(p,q)==a(p-1,q)
                        g(p-1,q)=1;
                    end
                    if a(p,q)==a(p+1,q)
                        g(p+1,q)=1;
                    end
               end
            end
        end
    end
end
figure(2);
imshow(g);

