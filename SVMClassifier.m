clc
clear all
traincase1 = fopen('C:/TakeHome2/data/train_case_1.dat','r');
    training_set = cell2mat(textscan(traincase1, '%f %f %f %f'));
    fclose(traincase1);
training_set(10001:15000,:)=[];
training_set(1:5000,5)=1;
training_set(5001:10000,5)=2;
fileID = fopen('C:/TakeHome2/trainlibsvm.txt', 'w');
for i=1:10000
    fprintf(fileID,'%d 1:%f 2:%f 3:%f 4:%f\n', training_set(i,5),training_set(i,1),training_set(i,2),training_set(i,3),training_set(i,4));
end
fclose(fileID);


[trainlabels, trainfeatures] = libsvmread('C:/TakeHome2/libsvm-3.23/windows/scaled.scale');
 
model = svmtrain(trainlabels, trainfeatures, '-s 0 -t 2 -c 32768 -g 0.5 ');

 testcase1 = fopen('C:/TakeHome2/data/test_case_1.dat','r');
    testset1 = cell2mat(textscan(testcase1, '%f %f %f %f'));
    fclose(testcase1);
B1=[2;3;1;3;1; 2];
B=repmat(B1,2500,1);
testset1(:,5)=B;
testset1(testset1(:, 5)== 3, :)= [] ; 

fileID = fopen('C:/TakeHome2/testlibsvm.txt', 'w');
for i=1:10000
    fprintf(fileID,'%d 1:%f 2:%f 3:%f 4:%f\n', testset1(i,5),testset1(i,1),testset1(i,2),testset1(i,3),testset1(i,4));
end
fclose(fileID);

[testlabels, testfeatures] = libsvmread('C:/TakeHome2/libsvm-3.23/windows/scaledtest.scale');
[predicted_label,accuracy,prob_estimates]=svmpredict(testlabels,testfeatures,model);
B1=[2;1;1; 2];
key=repmat(B1,2500,1);
C=confusionmat(key,predicted_label)