clc
clear all
%Reading in the training set
train_case_1 = fopen('C:/TakeHome1/data/train_case_1.dat','r');
    trainset = cell2mat(textscan(train_case_1, '%f %f %f %f'));
    fclose(train_case_1);
    
%Reading in the test set
    
    test_case_1 = fopen('C:/TakeHome1/data/test_case_1.dat','r');
    testset1 = cell2mat(textscan(test_case_1, '%f %f %f %f'));
    fclose(test_case_1);
%Modifying the training set to Homogeneous Representation
trainset1 = [trainset(1:10000,:) ones(10000,1)];

%Replacing the Homogeneous Vectors by their negative to yield the desired
%constraint
trainset1(5001:10000,:) = -1 .* trainset1(5001:10000,:);

%Calling the Function
[w1] = function1(trainset1);

%Filtering the test data to eliminate class 3 
B1=[2;3;1;3;1; 2];
B=repmat(B1,2500,1);
testset1(:,5)=B;
testset1(testset1(:, 5)== 3, :)= [] ;
testset1(:,5)=1;

%Creating a known group label for the confusion matrix
B2=[2;1;1;2];
real=repmat(B2,2500,1);
   
%Classifying the test set based on the hyperplane derived
for i = 1:10000
    test = testset1(i,:) * w1;
    
    if test > 0
        c(i) = 1;
    else
        c(i) = 2;
    end
    
end
%Creating a confusion matrix for Ho/Kashyap Procedure
C = confusionmat(real,c)
%Function which develops the hyperplane for Ho/kashyap 
function [w] = function1(A)

    max = 1000;
    p = 0.9; 
    i1 = 0;
    w = ones(5,1);
    b = zeros(10000,1);
    %initial b
    b1=ones(10000,1);
    %condition for convergence
    while (i1 < max && abs(min(b-b1)) > 0.001)  
        
        b=b1;
        
        w = inv(A' * A)*A' * b;
        
        c = 0.5 * (((A * w) - b )+ abs((A * w) - b)); 
        %updating b
        b1 = b + (p * c);
        %number of iterations to converge
        i1 = i1 + 1;
    end
end

