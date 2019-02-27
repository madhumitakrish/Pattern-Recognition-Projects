clc
clear all

%Reading in the training set
    
    traincase1 = fopen('C:/TakeHome1/data/train_case_1.dat','r');
    training_set = cell2mat(textscan(traincase1, '%f %f %f %f'));
    fclose(traincase1);
    
%Reading in the test set
    
    testcase1 = fopen('C:/TakeHome1/data/test_case_1.dat','r');
    test_set = cell2mat(textscan(testcase1, '%f %f %f %f'));
    fclose(testcase1);

%Writing Classification Results to the file 
fileID = fopen('C:/TakeHome1/takehome1_case_1.txt','wt');
example = fopen('C:/TakeHome1/exam.txt','wt');
fprintf(example,'Case1:\n');    
   
%Parameter Estimation
    %Mean for each class    
    u1=mean(training_set(1:5000,:));
    u2=mean(training_set(5001:10000,:));
    u3=mean(training_set(10001:15000,:));
   
    %Covariance for each class

    sigma1=cov(training_set(1:5000,:),1);
    sigma2=cov(training_set(5001:10000,:),1);
    sigma3=cov(training_set(10001:15000,:),1);
    
    u1=transpose(u1);
    u2=transpose(u2);
    u3=transpose(u3);
    
%Discriminant function for each class
%Training set classification

    for i=1:15000
        x=training_set(i,:);
        x=transpose(x);
        
        g1(i)= -0.5*(transpose(x-u1)*inv(sigma1)*(x-u1))-(0.5*log(det(sigma1)));
        g2(i)= -0.5*(transpose(x-u2)*inv(sigma2)*(x-u2))-(0.5*log(det(sigma2)));
        g3(i)= -0.5*(transpose(x-u3)*inv(sigma3)*(x-u3))-(0.5*log(det(sigma3)));
 
        %Classfication Rule
        if g1(i) > g2(i) && g1(i) > g3(i)
            class(i)=1;
         
        elseif g2(i) > g1(i) && g2(i) > g3(i)
            class(i)=2;
         
        else g3(i) > g1(i) && g3(i) > g2(i);
            class(i)=3;
         
        end
        
    end
 
    %Calculating misclassification for P(error) Estimation
    %Misclassification in class w1:
    
    Actual1Classified1=0;
    Actual1Classified2=0;
    Actual1Classified3=0;
    for i=1:5000
        if class(i) ==1
            Actual1Classified1=Actual1Classified1+1;
        elseif class(i)==2
            Actual1Classified2=Actual1Classified2+1;
        elseif class(i)==3
            Actual1Classified3=Actual1Classified3+1;
        end
    end
    
    %Misclassifications in class w2:
    
    Actual2Classified1=0;
    Actual2Classified2=0;
    Actual2Classified3=0;
    for i=5001:10000
        if class(i) ==1
            Actual2Classified1=Actual2Classified1+1;
        elseif class(i)==2
            Actual2Classified2=Actual2Classified2+1;
        elseif class(i)==3
            Actual2Classified3=Actual2Classified3+1;
        end
    end
    
    %Misclassifications in class w3:
    
    Actual3Classified1=0;
    Actual3Classified2=0;
    Actual3Classified3=0;
    for i=10001:15000
        if class(i) ==1
            Actual3Classified1=Actual3Classified1+1;
        elseif class(i)==2
            Actual3Classified2=Actual3Classified2+1;
        elseif class(i)==3
            Actual3Classified3=Actual3Classified3+1;
        end
    end
    
%Classification Results for test_case_1
    
    for i= 1:15000
    x=test_set(i,:);
    x=transpose(x);
    g1(i)= -0.5*(transpose(x-u1)*inv(sigma1)*(x-u1))-(0.5*log(det(sigma1)));
    g2(i)= -0.5*(transpose(x-u2)*inv(sigma2)*(x-u2))-(0.5*log(det(sigma2)));
    g3(i)= -0.5*(transpose(x-u3)*inv(sigma3)*(x-u3))-(0.5*log(det(sigma3)));
        
        %Classification Rule
        if g1(i) > g2(i) && g1(i) > g3(i)
            class(i)=1;
           
        elseif g2(i) > g1(i) && g2(i) > g3(i)
            class(i)=2;
            
        elseif g3(i) > g1(i) && g3(i) > g2(i)
            class(i)=3;
          
        
        end
    fprintf(fileID,sprintf('%d\n',class(i)));

    fprintf(example,sprintf('for sample %d class is %d \n',i,class(i)));
    end
    fclose(example);
    fclose(fileID);