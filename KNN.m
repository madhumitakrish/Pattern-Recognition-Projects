clc
clear all
TEST_SIZE = 15000;

traincase1 = fopen('C:/TakeHome1/data/train_case_1.dat','r');
    trainset1 = cell2mat(textscan(traincase1, '%f %f %f %f'));
    fclose(traincase1);
    
%Reading in the test set
    
    testcase1 = fopen('C:/TakeHome1/data/test_case_1.dat','r');
    testset1 = cell2mat(textscan(testcase1, '%f %f %f %f'));
    fclose(testcase1);
    
    B1=[2;3;1;3;1; 2];
    B=repmat(B1,2500,1);
    testset1(:,5)=B;
    testset1(testset1(:, 5)== 3, :)= [] ; 
    testset1(:,5)=[];
    trainset1=trainset1(1:10000,:);
    

%Creating a known group label for the confusion matrix
B1=[2;1;1; 2];
key=repmat(B1,2500,1);
%change K=1,3,5
n=5;

    c=zeros(10000,1);
    for i = 1:10000
        
distances = zeros(10000, 1);

for j = 1:10000
            distances(j) = norm((testset1(i,:)-trainset1(j,:)));
end

        class1 = 0;
        class2 = 0;
      
            distances(1:5000,2)=1;
        
            distances(5001:10000,2)=2;
       
        % sort distances with correct labels
        x1 = sortrows(distances,1);
        
        if n == 1
            c(i)=x1(1,2);
            
        elseif n == 3
            for k = 1:3
                if x1(k,2) == 1
                    class1 = class1 + 1;
                else
                    class2 = class2 + 1;
                
                end
            end
            
            if class1 > class2 
                
                c(i)=1;
            else
                
                c(i)=2;
            end      
        elseif n == 5
            for k = 1:5
                if x1(k,2) == 1
                    class1 = class1 + 1;
                else
                    class2 = class2 + 1;
                end
            end
            
            if class1 > class2
                
                c(i)=1;
            else
                
                c(i)=2;
            end            
        end      
     end
    
%Confusion Matrix for K-NN
C1=confusionmat(key,c)


