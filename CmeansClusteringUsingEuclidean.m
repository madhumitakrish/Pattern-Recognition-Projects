clc
clear all
testcase1 = fopen('C:/TakeHome2/data/test_case_1.dat','r');
testset1 = cell2mat(textscan(testcase1, '%f %f %f %f'));
fclose(testcase1);

c=3;
s = RandStream('mlfg6331_64');
m1 = datasample(s,testset1,c,'Replace',false);
m=zeros(c,4);


count=0;
while max(abs(m1-m)) > 0.001
    distance1 = zeros(15000, 1);
    distance2 = zeros(15000, 1);
    distance3 = zeros(15000, 1);
    distance4 = zeros(15000, 1);
    distance5 = zeros(15000, 1);
    distancelabel = zeros(15000, 1);
    m=m1;
     if c==2
         for j = 1:15000
            distance1(j) = norm((testset1(j,1:4)-m(1,:)));
         end 

        for j = 1:15000
            distance2(j) = norm((testset1(j,1:4)-m(2,:)));
        end
        for j=1:15000
            if distance1(j)<distance2(j) 
                distancelabel(j)=1;
            else
                distancelabel(j)=2;
            end
        end
        testset1(:,5)=distancelabel(:);

        m1(1,:)=mean(testset1(testset1(:, 5)== 1, 1:4));
        m1(2,:)=mean(testset1(testset1(:, 5)== 2, 1:4));
        
        count=count+1;
    elseif c==3
        for j = 1:15000
            distance1(j) = norm((testset1(j,1:4)-m(1,:)));
        end 

        for j = 1:15000
            distance2(j) = norm((testset1(j,1:4)-m(2,:)));
        end
        for j = 1:15000
            distance3(j) = norm((testset1(j,1:4)-m(3,:)));
        end
        for j=1:15000
            if distance1(j)<distance2(j) && distance1(j)<distance3(j)
                distancelabel(j)=1;
            elseif distance2(j)<distance1(j) && distance2(j)<distance3(j)
                distancelabel(j)=2;
            else
                distancelabel(j)=3;
            end
        end
        testset1(:,5)=distancelabel(:);

        m1(1,:)=mean(testset1(testset1(:, 5)== 1, 1:4));
        m1(2,:)=mean(testset1(testset1(:, 5)== 2, 1:4));
        m1(3,:)=mean(testset1(testset1(:, 5)== 3, 1:4));
        count=count+1;
   
    elseif c==4
         for j = 1:15000
            distance1(j) = norm((testset1(j,1:4)-m(1,:)));
        end 

        for j = 1:15000
            distance2(j) = norm((testset1(j,1:4)-m(2,:)));
        end
        for j = 1:15000
            distance3(j) = norm((testset1(j,1:4)-m(3,:)));
        end
        for j = 1:15000
            distance4(j) = norm((testset1(j,1:4)-m(4,:)));
        end
        for j=1:15000
            if distance1(j)<distance2(j) && distance1(j)<distance3(j) && distance1(j)<distance4(j)
                distancelabel(j)=1;
            elseif distance2(j)<distance1(j) && distance2(j)<distance3(j) && distance2(j)<distance4(j)
                distancelabel(j)=2;
            elseif distance3(j)<distance1(j) && distance3(j)<distance2(j) && distance3(j)<distance4(j)
                distancelabel(j)=3;
            else
                distancelabel(j)=4;
            end
        end
        testset1(:,5)=distancelabel(:);

        m1(1,:)=mean(testset1(testset1(:, 5)== 1, 1:4));
        m1(2,:)=mean(testset1(testset1(:, 5)== 2, 1:4));
        m1(3,:)=mean(testset1(testset1(:, 5)== 3, 1:4));
        m1(4,:)=mean(testset1(testset1(:, 5)== 4, 1:4));
        count=count+1;
        elseif c==5
         for j = 1:15000
            distance1(j) = norm((testset1(j,1:4)-m(1,:)));
        end 

        for j = 1:15000
            distance2(j) = norm((testset1(j,1:4)-m(2,:)));
        end
        for j = 1:15000
            distance3(j) = norm((testset1(j,1:4)-m(3,:)));
        end
        for j = 1:15000
            distance4(j) = norm((testset1(j,1:4)-m(4,:)));
        end
        for j = 1:15000
            distance5(j) = norm((testset1(j,1:4)-m(5,:)));
        end
        for j=1:15000
            if distance1(j)<distance2(j) && distance1(j)<distance3(j) && distance1(j)<distance4(j) && distance1(j)<distance5(j)
                distancelabel(j)=1;
            elseif distance2(j)<distance1(j) && distance2(j)<distance3(j) && distance2(j)<distance4(j) &&distance2(j)<distance5(j)
                distancelabel(j)=2;
            elseif distance3(j)<distance1(j) && distance3(j)<distance2(j) && distance3(j)<distance4(j) && distance3(j)<distance5(j)
                distancelabel(j)=3;
            elseif distance4(j)<distance1(j) && distance4(j)<distance2(j) && distance4(j)<distance3(j) && distance4(j)<distance5(j)
                distancelabel(j)=4;
            else
                distancelabel(j)=5;
            end
        end
        testset1(:,5)=distancelabel(:);

        m1(1,:)=mean(testset1(testset1(:, 5)== 1, 1:4));
        m1(2,:)=mean(testset1(testset1(:, 5)== 2, 1:4));
        m1(3,:)=mean(testset1(testset1(:, 5)== 3, 1:4));
        m1(4,:)=mean(testset1(testset1(:, 5)== 4, 1:4));
        m1(5,:)=mean(testset1(testset1(:, 5)== 5, 1:4));
        count=count+1;
     
    end
end

count1=0;
while max(abs(m1-m)) > 0.001
    distance1 = zeros(15000, 1);
    distance2 = zeros(15000, 1);
    distance3 = zeros(15000, 1);
    distance4 = zeros(15000, 1);
    distance5 = zeros(15000, 1);
    distancelabel = zeros(15000, 1);
    m=m1;
     if c==2
         for j = 1:15000
            distance1(j) =  pdist2(testset1(j,1:4),m(1,:));
         end 

        for j = 1:15000
            distance2(j) =  pdist2(testset1(j,1:4),m(2,:));
        end
        for j=1:15000
            if distance1(j)<distance2(j) 
                distancelabel(j)=1;
            else
                distancelabel(j)=2;
            end
        end
        testset1(:,6)=distancelabel(:);

        m1(1,:)=mean(testset1(testset1(:, 5)== 1, 1:4));
        m1(2,:)=mean(testset1(testset1(:, 5)== 2, 1:4));
        
        count1=count1+1;
    elseif c==3
        for j = 1:15000
            distance1(j) =  pdist2(testset1(j,1:4),m(1,:));
        end 

        for j = 1:15000
            distance2(j) =  pdist2(testset1(j,1:4),m(2,:));
        end
        for j = 1:15000
            distance3(j) = pdist2(testset1(j,1:4),m(3,:));
        end
        for j=1:15000
            if distance1(j)<distance2(j) && distance1(j)<distance3(j)
                distancelabel(j)=1;
            elseif distance2(j)<distance1(j) && distance2(j)<distance3(j)
                distancelabel(j)=2;
            else
                distancelabel(j)=3;
            end
        end
        testset1(:,6)=distancelabel(:);

        m1(1,:)=mean(testset1(testset1(:, 5)== 1, 1:4));
        m1(2,:)=mean(testset1(testset1(:, 5)== 2, 1:4));
        m1(3,:)=mean(testset1(testset1(:, 5)== 3, 1:4));
        count1=count1+1;
   
    elseif c==4
         for j = 1:15000
            distance1(j) =  pdist2(testset1(j,1:4),m(1,:));
        end 

        for j = 1:15000
            distance2(j) =  pdist2(testset1(j,1:4),m(2,:));
        end
        for j = 1:15000
            distance3(j) =  pdist2(testset1(j,1:4),m(3,:));
        end
        for j = 1:15000
            distance4(j) =  pdist2(testset1(j,1:4),m(4,:));
        end
        for j=1:15000
            if distance1(j)<distance2(j) && distance1(j)<distance3(j) && distance1(j)<distance4(j)
                distancelabel(j)=1;
            elseif distance2(j)<distance1(j) && distance2(j)<distance3(j) && distance2(j)<distance4(j)
                distancelabel(j)=2;
            elseif distance3(j)<distance1(j) && distance3(j)<distance2(j) && distance3(j)<distance4(j)
                distancelabel(j)=3;
            else
                distancelabel(j)=4;
            end
        end
        testset1(:,6)=distancelabel(:);

        m1(1,:)=mean(testset1(testset1(:, 5)== 1, 1:4));
        m1(2,:)=mean(testset1(testset1(:, 5)== 2, 1:4));
        m1(3,:)=mean(testset1(testset1(:, 5)== 3, 1:4));
        m1(4,:)=mean(testset1(testset1(:, 5)== 4, 1:4));
        count1=count1+1;
        elseif c==5
         for j = 1:15000
            distance1(j) =  pdist2(testset1(j,1:4),m(1,:));
        end 

        for j = 1:15000
            distance2(j) =  pdist2(testset1(j,1:4),m(2,:));
        end
        for j = 1:15000
            distance3(j) =  pdist2(testset1(j,1:4),m(3,:));
        end
        for j = 1:15000
            distance4(j) =  pdist2(testset1(j,1:4),m(4,:));
        end
        for j = 1:15000
            distance5(j) =  pdist2(testset1(j,1:4),m(5,:));
        end
        for j=1:15000
            if distance1(j)<distance2(j) && distance1(j)<distance3(j) && distance1(j)<distance4(j) && distance1(j)<distance5(j)
                distancelabel(j)=1;
            elseif distance2(j)<distance1(j) && distance2(j)<distance3(j) && distance2(j)<distance4(j) &&distance2(j)<distance5(j)
                distancelabel(j)=2;
            elseif distance3(j)<distance1(j) && distance3(j)<distance2(j) && distance3(j)<distance4(j) && distance3(j)<distance5(j)
                distancelabel(j)=3;
            elseif distance4(j)<distance1(j) && distance4(j)<distance2(j) && distance4(j)<distance3(j) && distance4(j)<distance5(j)
                distancelabel(j)=4;
            else
                distancelabel(j)=5;
            end
        end
        testset1(:,6)=distancelabel(:);

        m1(1,:)=mean(testset1(testset1(:, 5)== 1, 1:4));
        m1(2,:)=mean(testset1(testset1(:, 5)== 2, 1:4));
        m1(3,:)=mean(testset1(testset1(:, 5)== 3, 1:4));
        m1(4,:)=mean(testset1(testset1(:, 5)== 4, 1:4));
        m1(5,:)=mean(testset1(testset1(:, 5)== 5, 1:4));
        count1=count1+1;
     
    end
end
w1=0;
w2=0;
w3=0;
w4=0;
w5=0;
for i=1:15000
    if testset1(i,5)==1
        w1=w1+1;
    elseif testset1(i,5)==2
        w2=w2+1;
    elseif testset1(i,5)==3
        w3=w3+1;
    elseif testset1(i,5)==4
        w4=w4+1;
    else
        w5=w5+1;
    end
end

B1=[2;3;1;3;1; 2];
B=repmat(B1,2500,1);
KEY=B;
confusionmat(KEY,testset1(:,5))