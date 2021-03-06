%USAGE: drawskt(1,3,1,4,1,2) --- show actions 1,2,3 performed by subjects 1,2,3,4 with instances 1 and 2.
function drawskt()

J=[4     3     3     3     2    1      1     5    6     7     9      10     11     13    14    15    17    18    19;
   3     5     9     2     1    13     17    6    7     8     10     11     12     14    15    16    18    19    20];

B=[];
%for a=a1:a2
 %   for s=s1:s2
  %      for e=e1:e2
            file=sprintf('2534131250_captured_screen.txt');
            fp=fopen(file);
            if (fp>0)
               A=fscanf(fp,'%f');
               B=[B; A];
               fclose(fp);
            end
    %    end
    %end
%end

l=size(B,1)/4;
B=reshape(B,4,l);
B=B';
B=reshape(B,20,l/20,4);

X=B(:,:,1);
Z=400-B(:,:,2);
Y=B(:,:,3)/4;
P=B(:,:,4);

for s=1:size(X,2)
    S=[X(:,s) Y(:,s) Z(:,s)];
  
    xlim = [0 800];
    ylim = [0 800];
    zlim = [0 800];
    set(gca, 'xlim', xlim, ...
             'ylim', ylim, ...
             'zlim', zlim);

    h=plot3(S(:,1),S(:,2),S(:,3),'r.');
    %rotate(h,[0 45], -180);
    set(gca,'DataAspectRatio',[1 1 1])
    axis([-100 600 -100 600 -100 600])

    for j=1:19
        c1=J(1,j);
        c2=J(2,j);
        line([S(c1,1) S(c2,1)], [S(c1,2) S(c2,2)], [S(c1,3) S(c2,3)]);
    end
    pause(1/20)
    F(s) = getframe;
end

fig = figure;
movie(fig, F, 2)