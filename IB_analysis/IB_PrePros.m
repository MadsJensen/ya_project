% Import and prepare data for analysis for intentional binding-paradigm

clear all
close all
cd '/home/mje/Projects/youth_addiction/pilot/test data 2/agency'


all_subjects = [201,203,204,205,207,208,209,210,211,212,214,215,217,218,219,220]; %List of all subjects in the experiment - coded numbers
conditionTypes = {'actionPressHand','singlePressHand','actionToneHand','singleTone','actionPressFoot','singlePressFoot','actionToneFoot'};

for subject = 1:length(all_subjects);
        %Import the data and make condition specific variables and calculations...
    for condition = 1:length(conditionTypes)
        conditionType = conditionTypes{condition};

        if condition == 1 % = actionPressHand
            [~,~,data] = xlsread(['C:\Libet-IB foot\IB-part\data\subject_',num2str(all_subjects(subject)),'_',conditionType,'.csv']);
            data.data = data(2:end,:);
            
            temp.actionPressHand.fuckUps = strcmp(data.data(:,16), 'True'); %single out trials marked as bad by subjects for later removal
            temp.actionPressHand.nOut = sum(temp.actionPressHand.fuckUps);
            temp.actionPressHand.dotDelay = cell2mat(data.data(:,4));
            temp.actionPressHand.toneOnset = cell2mat(data.data(:,5));
            temp.actionPressHand.toneAngle = cell2mat(data.data(:,6));
            temp.actionPressHand.pressOnset = cell2mat(data.data(:,7));
            temp.actionPressHand.pressAngle = cell2mat(data.data(:,8));
            temp.actionPressHand.ansAngle = cell2mat(data.data(:,9));
            temp.actionPressHand.ansTime = cell2mat(data.data(:,10));
            
            temp.actionPressHand.Recalc.LH = 90 > temp.actionPressHand.ansAngle & temp.actionPressHand.pressAngle > 180; % +1.+H
            temp.actionPressHand.ansAngle(temp.actionPressHand.Recalc.LH) = temp.actionPressHand.ansAngle(temp.actionPressHand.Recalc.LH)+360;
            temp.actionPressHand.Recalc.HL = 270 < temp.actionPressHand.ansAngle & temp.actionPressHand.pressAngle < 90; % +H,+1
            temp.actionPressHand.pressAngle(temp.actionPressHand.Recalc.HL) = temp.actionPressHand.pressAngle(temp.actionPressHand.Recalc.HL)+360;
                       
            temp.actionPressHand.errorAngle = temp.actionPressHand.ansAngle-temp.actionPressHand.pressAngle;%*2550/360;
            temp.actionPressHand.errorTime = temp.actionPressHand.errorAngle*2550/360;
            temp.actionPressHand.errorTime(temp.actionPressHand.fuckUps) = NaN;
        end
        if condition == 2 % = singlePressHand
            [~,~,data] = xlsread(['C:\Libet-IB foot\IB-part\data\subject_',num2str(all_subjects(subject)),'_',conditionType,'.csv']);
            data.data = data(2:end,:);
            
            temp.singlePressHand.fuckUps = strcmp(data.data(:,16), 'True'); %single out trials marked as bad by subjects for later removal
            temp.singlePressHand.nOut = sum(temp.singlePressHand.fuckUps);
            temp.singlePressHand.dotDelay = cell2mat(data.data(:,4));
            temp.singlePressHand.toneOnset = cell2mat(data.data(:,5));
            temp.singlePressHand.toneAngle = cell2mat(data.data(:,6));
            temp.singlePressHand.pressOnset = cell2mat(data.data(:,7));
            temp.singlePressHand.pressAngle = cell2mat(data.data(:,8));
            temp.singlePressHand.ansAngle = cell2mat(data.data(:,9));
            temp.singlePressHand.ansTime = cell2mat(data.data(:,10));

               %correct valuses for boarder angelses
            temp.singlePressHand.Recalc.LH = 90 > temp.singlePressHand.ansAngle & temp.singlePressHand.pressAngle > 180; % +1.+H
            temp.singlePressHand.ansAngle(temp.singlePressHand.Recalc.LH) = temp.singlePressHand.ansAngle(temp.singlePressHand.Recalc.LH)+360;
            temp.singlePressHand.Recalc.HL = 270 < temp.singlePressHand.ansAngle & temp.singlePressHand.pressAngle < 90; % +H,+1
            temp.singlePressHand.pressAngle(temp.singlePressHand.Recalc.HL) = temp.singlePressHand.pressAngle(temp.singlePressHand.Recalc.HL)+360;
            
            temp.singlePressHand.errorAngle = temp.singlePressHand.ansAngle-temp.singlePressHand.pressAngle;%*2550/360;
            temp.singlePressHand.errorTime = temp.singlePressHand.errorAngle*2550/360; 
            temp.singlePressHand.errorTime(temp.singlePressHand.fuckUps) = NaN;
        end
        if condition == 3 % = actionToneHand
            [~,~,data] = xlsread(['C:\Libet-IB foot\IB-part\data\subject_',num2str(all_subjects(subject)),'_',conditionType,'.csv']);
            data.data = data(2:end,:);
            
            temp.actionToneHand.fuckUps = strcmp(data.data(:,16), 'True'); %single out trials marked as bad by subjects for later removal
            temp.actionToneHand.nOut = sum(temp.actionToneHand.fuckUps);
            temp.actionToneHand.dotDelay = cell2mat(data.data(:,4));
            temp.actionToneHand.toneOnset = cell2mat(data.data(:,5));
            temp.actionToneHand.toneAngle = cell2mat(data.data(:,6));
            temp.actionToneHand.pressOnset = cell2mat(data.data(:,7));
            temp.actionToneHand.pressAngle = cell2mat(data.data(:,8));
            temp.actionToneHand.ansAngle = cell2mat(data.data(:,9));
            temp.actionToneHand.ansTime = cell2mat(data.data(:,10));
            
                %correct valuses for boarder angelses
            temp.actionToneHand.Recalc.LH = 90 > temp.actionToneHand.ansAngle & temp.actionToneHand.toneAngle > 180; % +1.+H
            temp.actionToneHand.ansAngle(temp.actionToneHand.Recalc.LH) = temp.actionToneHand.ansAngle(temp.actionToneHand.Recalc.LH)+360;
            temp.actionToneHand.Recalc.HL = 270 < temp.actionToneHand.ansAngle & temp.actionToneHand.toneAngle < 90; % +H,+1
            temp.actionToneHand.toneAngle(temp.actionToneHand.Recalc.HL) = temp.actionToneHand.toneAngle(temp.actionToneHand.Recalc.HL)+360;
          
            temp.actionToneHand.errorAngle = temp.actionToneHand.ansAngle-temp.actionToneHand.toneAngle;%*2550/360;
            temp.actionToneHand.errorTime = temp.actionToneHand.errorAngle*2550/360; 
            temp.actionToneHand.errorTime(temp.actionToneHand.fuckUps) = NaN;

        end     
        if condition == 4 % = singleTone
            [~,~,data] = xlsread(['C:\Libet-IB foot\IB-part\data\subject_',num2str(all_subjects(subject)),'_',conditionType,'.csv']);
            data.data = data(2:end,:);

            temp.singleTone.fuckUps = strcmp(data.data(:,16), 'True'); %single out trials marked as bad by subjects for later removal
            temp.singleTone.nOut = sum(temp.singleTone.fuckUps);
            temp.singleTone.dotDelay = cell2mat(data.data(:,4));
            temp.singleTone.toneOnset = cell2mat(data.data(:,5));
            temp.singleTone.toneAngle = cell2mat(data.data(:,6));
            temp.singleTone.pressOnset = cell2mat(data.data(:,7));
            temp.singleTone.pressAngle = cell2mat(data.data(:,8));
            temp.singleTone.ansAngle = cell2mat(data.data(:,9));
            temp.singleTone.ansTime = cell2mat(data.data(:,10));

                %correct valuses for boarder angelses
            temp.singleTone.Recalc.MH = 0 > temp.singleTone.ansAngle & temp.singleTone.toneAngle > 180; % -1,+H
            temp.singleTone.ansAngle(temp.singleTone.Recalc.MH) = temp.singleTone.ansAngle(temp.singleTone.Recalc.MH)+360;
            temp.singleTone.Recalc.LH = 90 > temp.singleTone.ansAngle & temp.singleTone.toneAngle > 180; % +1.+H
            temp.singleTone.ansAngle(temp.singleTone.Recalc.LH) = temp.singleTone.ansAngle(temp.singleTone.Recalc.LH)+360;
            temp.singleTone.Recalc.HL = 270 < temp.singleTone.ansAngle & temp.singleTone.toneAngle < 90; % +H,+1
            temp.singleTone.toneAngle(temp.singleTone.Recalc.HL) = temp.singleTone.toneAngle(temp.singleTone.Recalc.HL)+360;
          
            temp.singleTone.errorAngle = temp.singleTone.ansAngle-temp.singleTone.toneAngle;%*2550/360;
            temp.singleTone.errorTime = temp.singleTone.errorAngle*2550/360; 
            temp.singleTone.errorTime(temp.singleTone.fuckUps) = NaN;
        end
            
       if condition == 5 % = actionPressFoot
            [~,~,data] = xlsread(['C:\Libet-IB foot\IB-part\data\subject_',num2str(all_subjects(subject)),'_',conditionType,'.csv']);
            data.data = data(2:end,:);
            
            temp.actionPressFoot.fuckUps = strcmp(data.data(:,16), 'True'); %single out trials marked as bad by subjects for later removal
            temp.actionPressFoot.nOut = sum(temp.actionPressFoot.fuckUps);
            temp.actionPressFoot.dotDelay = cell2mat(data.data(:,4));
            temp.actionPressFoot.toneOnset = cell2mat(data.data(:,5));
            temp.actionPressFoot.toneAngle = cell2mat(data.data(:,6));
            temp.actionPressFoot.pressOnset = cell2mat(data.data(:,7));
            temp.actionPressFoot.pressAngle = cell2mat(data.data(:,8));
            temp.actionPressFoot.ansAngle = cell2mat(data.data(:,9));
            temp.actionPressFoot.ansTime = cell2mat(data.data(:,10));
            
            temp.actionPressFoot.Recalc.LH = 90 > temp.actionPressFoot.ansAngle & temp.actionPressFoot.pressAngle > 180; % +1.+H
            temp.actionPressFoot.ansAngle(temp.actionPressFoot.Recalc.LH) = temp.actionPressFoot.ansAngle(temp.actionPressFoot.Recalc.LH)+360;
            temp.actionPressFoot.Recalc.HL = 270 < temp.actionPressFoot.ansAngle & temp.actionPressFoot.pressAngle < 90; % +H,+1
            temp.actionPressFoot.pressAngle(temp.actionPressFoot.Recalc.HL) = temp.actionPressFoot.pressAngle(temp.actionPressFoot.Recalc.HL)+360;
                       
            temp.actionPressFoot.errorAngle = temp.actionPressFoot.ansAngle-temp.actionPressFoot.pressAngle;%*2550/360;
            temp.actionPressFoot.errorTime = temp.actionPressFoot.errorAngle*2550/360;
            temp.actionPressFoot.errorTime(temp.actionPressFoot.fuckUps) = NaN;
        end
        if condition == 6 % = singlePressFoot
            [~,~,data] = xlsread(['C:\Libet-IB foot\IB-part\data\subject_',num2str(all_subjects(subject)),'_',conditionType,'.csv']);
            data.data = data(2:end,:);
            
            temp.singlePressFoot.fuckUps = strcmp(data.data(:,16), 'True'); %single out trials marked as bad by subjects for later removal
            temp.singlePressFoot.nOut = sum(temp.singlePressFoot.fuckUps);
            temp.singlePressFoot.dotDelay = cell2mat(data.data(:,4));
            temp.singlePressFoot.toneOnset = cell2mat(data.data(:,5));
            temp.singlePressFoot.toneAngle = cell2mat(data.data(:,6));
            temp.singlePressFoot.pressOnset = cell2mat(data.data(:,7));
            temp.singlePressFoot.pressAngle = cell2mat(data.data(:,8));
            temp.singlePressFoot.ansAngle = cell2mat(data.data(:,9));
            temp.singlePressFoot.ansTime = cell2mat(data.data(:,10));

               %correct valuses for boarder angelses
            temp.singlePressFoot.Recalc.LH = 90 > temp.singlePressFoot.ansAngle & temp.singlePressFoot.pressAngle > 180; % +1.+H
            temp.singlePressFoot.ansAngle(temp.singlePressFoot.Recalc.LH) = temp.singlePressFoot.ansAngle(temp.singlePressFoot.Recalc.LH)+360;
            temp.singlePressFoot.Recalc.HL = 270 < temp.singlePressFoot.ansAngle & temp.singlePressFoot.pressAngle < 90; % +H,+1
            temp.singlePressFoot.pressAngle(temp.singlePressFoot.Recalc.HL) = temp.singlePressFoot.pressAngle(temp.singlePressFoot.Recalc.HL)+360;
            
            temp.singlePressFoot.errorAngle = temp.singlePressFoot.ansAngle-temp.singlePressFoot.pressAngle;%*2550/360;
            temp.singlePressFoot.errorTime = temp.singlePressFoot.errorAngle*2550/360; 
            temp.singlePressFoot.errorTime(temp.singlePressFoot.fuckUps) = NaN;
        end
        if condition == 7 % = actionToneFoot
            [~,~,data] = xlsread(['C:\Libet-IB foot\IB-part\data\subject_',num2str(all_subjects(subject)),'_',conditionType,'.csv']);
            data.data = data(2:end,:);
            
            temp.actionToneFoot.fuckUps = strcmp(data.data(:,16), 'True'); %single out trials marked as bad by subjects for later removal
            temp.actionToneFoot.nOut = sum(temp.actionToneFoot.fuckUps);
            temp.actionToneFoot.dotDelay = cell2mat(data.data(:,4));
            temp.actionToneFoot.toneOnset = cell2mat(data.data(:,5));
            temp.actionToneFoot.toneAngle = cell2mat(data.data(:,6));
            temp.actionToneFoot.pressOnset = cell2mat(data.data(:,7));
            temp.actionToneFoot.pressAngle = cell2mat(data.data(:,8));
            temp.actionToneFoot.ansAngle = cell2mat(data.data(:,9));
            temp.actionToneFoot.ansTime = cell2mat(data.data(:,10));
            
                %correct valuses for boarder angelses
            temp.actionToneFoot.Recalc.LH = 90 > temp.actionToneFoot.ansAngle & temp.actionToneFoot.toneAngle > 180; % +1.+H
            temp.actionToneFoot.ansAngle(temp.actionToneFoot.Recalc.LH) = temp.actionToneFoot.ansAngle(temp.actionToneFoot.Recalc.LH)+360;
            temp.actionToneFoot.Recalc.HL = 270 < temp.actionToneFoot.ansAngle & temp.actionToneFoot.toneAngle < 90; % +H,+1
            temp.actionToneFoot.toneAngle(temp.actionToneFoot.Recalc.HL) = temp.actionToneFoot.toneAngle(temp.actionToneFoot.Recalc.HL)+360;
          
            temp.actionToneFoot.errorAngle = temp.actionToneFoot.ansAngle-temp.actionToneFoot.toneAngle;%*2550/360;
            temp.actionToneFoot.errorTime = temp.actionToneFoot.errorAngle*2550/360; 
            temp.actionToneFoot.errorTime(temp.actionToneFoot.fuckUps) = NaN;
        end     
    end
    clear condition conditionType
        % Make general variables for each subject    
    temp.org_id = all_subjects(subject);
          
    %% subMatrix
     temp.subMatrix(:,1) = temp.actionPressHand.errorTime;
     temp.subMatrix(:,2) = temp.singlePressHand.errorTime;
     temp.subMatrix(:,3) = temp.actionToneHand.errorTime;
     temp.subMatrix(:,4) = temp.singleTone.errorTime;
     temp.subMatrix(:,5) = temp.actionPressFoot.errorTime;
     temp.subMatrix(:,6) = temp.singlePressFoot.errorTime;
     temp.subMatrix(:,7) = temp.actionToneFoot.errorTime;

     figure(subject)
     boxplot(temp.subMatrix(:,1:end),  'labels', conditionTypes); title(all_subjects(subject));
       
        %% Calculate means and other stuff...
    temp.meanError_actionPressHand = nanmean(temp.actionPressHand.errorTime);
    temp.meanError_singlePressHand = nanmean(temp.singlePressHand.errorTime);   
    temp.meanError_actionToneHand = nanmean(temp.actionToneHand.errorTime);   
    temp.meanError_singleTone = nanmean(temp.singleTone.errorTime); 
    temp.meanError_actionPressFoot = nanmean(temp.actionPressFoot.errorTime);
    temp.meanError_singlePressFoot = nanmean(temp.singlePressFoot.errorTime);
    temp.meanError_actionToneFoot = nanmean(temp.actionToneFoot.errorTime);
    
    errorMatrix(subject,1) = all_subjects(subject);
    errorMatrix(subject,2) = temp.meanError_actionPressHand;
    errorMatrix(subject,3) = temp.meanError_singlePressHand;
    errorMatrix(subject,4) = temp.meanError_actionToneHand;
    errorMatrix(subject,5) = temp.meanError_singleTone;
    errorMatrix(subject,6) = temp.meanError_actionPressFoot;
    errorMatrix(subject,7) = temp.meanError_singlePressFoot;
    errorMatrix(subject,8) = temp.meanError_actionToneFoot; 
    
    temp.std_actionPressHand = nanstd(temp.actionPressHand.errorTime);
    temp.std_singlePressHand = nanstd(temp.singlePressHand.errorTime);   
    temp.std_actionToneHand = nanstd(temp.actionToneHand.errorTime);   
    temp.std_singleTone = nanstd(temp.singleTone.errorTime); 
    temp.std_actionPressFoot = nanstd(temp.actionPressFoot.errorTime);
    temp.std_singlePressFoot = nanstd(temp.singlePressFoot.errorTime);
    temp.std_actionToneFoot = nanstd(temp.actionToneFoot.errorTime);
    
    temp.meanShift_Hand_press = temp.meanError_actionPressHand - temp.meanError_singlePressHand;
    temp.meanShift_Hand_tone = temp.meanError_actionToneHand - temp.meanError_singleTone;
    temp.meanShift_Foot_press = temp.meanError_actionPressFoot - temp.meanError_singlePressFoot;
    temp.meanShift_Foot_tone = temp.meanError_actionToneFoot - temp.meanError_singleTone;
 
    anovaMatrix(subject,1) = all_subjects(subject);
    anovaMatrix(subject,2) = temp.meanShift_Hand_press;
    anovaMatrix(subject,3) = temp.meanShift_Hand_tone;
    anovaMatrix(subject,4) = temp.meanShift_Foot_press;
    anovaMatrix(subject,5) = temp.meanShift_Foot_tone;
    
  %% Remove outliers...
    temp.actionPressHand.outliers = abs(mean(temp.actionPressHand.errorTime)-temp.actionPressHand.errorTime) > 500; %
    temp.actionPressHand.errorTimeC = temp.actionPressHand.errorTime;
    temp.actionPressHand.errorTimeC(temp.actionPressHand.outliers) = NaN;
    
    temp.singlePressHand.outliers = abs(mean(temp.singlePressHand.errorTime)-temp.singlePressHand.errorTime) > 500; %
    temp.singlePressHand.errorTimeC = temp.singlePressHand.errorTime;
    temp.singlePressHand.errorTimeC(temp.singlePressHand.outliers) = NaN;    

    temp.actionPressHand.outliers = abs(mean(temp.actionPressHand.errorTime)-temp.actionPressHand.errorTime) > 500; %
    temp.actionPressHand.errorTimeC = temp.actionPressHand.errorTime;
    temp.actionPressHand.errorTimeC(temp.actionPressHand.outliers) = NaN;
    
    temp.actionToneHand.outliers = abs(mean(temp.actionToneHand.errorTime)-temp.actionToneHand.errorTime) > 500; %
    temp.actionToneHand.errorTimeC = temp.actionToneHand.errorTime;
    temp.actionToneHand.errorTimeC(temp.actionToneHand.outliers) = NaN;
    
    temp.singleTone.outliers = abs(mean(temp.singleTone.errorTime)-temp.singleTone.errorTime) > 500; %
    temp.singleTone.errorTimeC = temp.singleTone.errorTime;
    temp.singleTone.errorTimeC(temp.singleTone.outliers) = NaN;
    
    temp.actionPressFoot.outliers = abs(mean(temp.actionPressFoot.errorTime)-temp.actionPressFoot.errorTime) > 500; %
    temp.actionPressFoot.errorTimeC = temp.actionPressFoot.errorTime;
    temp.actionPressFoot.errorTimeC(temp.actionPressFoot.outliers) = NaN;
    
    temp.singlePressFoot.outliers = abs(mean(temp.singlePressFoot.errorTime)-temp.singlePressFoot.errorTime) > 500; %
    temp.singlePressFoot.errorTimeC = temp.singlePressFoot.errorTime;
    temp.singlePressFoot.errorTimeC(temp.singlePressFoot.outliers) = NaN;
    
    temp.actionToneFoot.outliers = abs(mean(temp.actionToneFoot.errorTime)-temp.actionToneFoot.errorTime) > 500; %
    temp.actionToneFoot.errorTimeC = temp.actionToneFoot.errorTime;
    temp.actionToneFoot.errorTimeC(temp.actionToneFoot.outliers) = NaN;
    
    temp.meanErrorC_actionPressHand = nanmean(temp.actionPressHand.errorTimeC);
    temp.meanErrorC_singlePressHand = nanmean(temp.singlePressHand.errorTimeC);   
    temp.meanErrorC_actionToneHand = nanmean(temp.actionToneHand.errorTimeC);   
    temp.meanErrorC_singleTone = nanmean(temp.singleTone.errorTimeC); 
    temp.meanErrorC_actionPressFoot = nanmean(temp.actionPressFoot.errorTimeC);
    temp.meanErrorC_singlePressFoot = nanmean(temp.singlePressFoot.errorTimeC);
    temp.meanErrorC_actionToneFoot = nanmean(temp.actionToneFoot.errorTimeC);
    
    temp.stdC_actionPressHand = nanstd(temp.actionPressHand.errorTimeC);
    temp.stdC_singlePressHand = nanstd(temp.singlePressHand.errorTimeC);   
    temp.stdC_actionToneHand = nanstd(temp.actionToneHand.errorTimeC);   
    temp.stdC_singleTone = nanstd(temp.singleTone.errorTimeC); 
    temp.stdC_actionPressFoot = nanstd(temp.actionPressFoot.errorTimeC);
    temp.stdC_singlePressFoot = nanstd(temp.singlePressFoot.errorTimeC);
    temp.stdC_actionToneFoot = nanstd(temp.actionToneFoot.errorTimeC);
    
    errorMatrixC(subject,1) = all_subjects(subject);
    errorMatrixC(subject,2) = temp.meanErrorC_actionPressHand;
    errorMatrixC(subject,3) = temp.meanErrorC_singlePressHand;
    errorMatrixC(subject,4) = temp.meanErrorC_actionToneHand;
    errorMatrixC(subject,5) = temp.meanErrorC_singleTone;
    errorMatrixC(subject,6) = temp.meanErrorC_actionPressFoot;
    errorMatrixC(subject,7) = temp.meanErrorC_singlePressFoot;
    errorMatrixC(subject,8) = temp.meanErrorC_actionToneFoot; 
        
    temp.meanShiftC_Hand_press = temp.meanErrorC_actionPressHand - temp.meanErrorC_singlePressHand;
    temp.meanShiftC_Hand_tone = temp.meanErrorC_actionToneHand - temp.meanErrorC_singleTone;
    temp.meanShiftC_Foot_press = temp.meanErrorC_actionPressFoot - temp.meanErrorC_singlePressFoot;
    temp.meanShiftC_Foot_tone = temp.meanErrorC_actionToneFoot - temp.meanErrorC_singleTone;
 
    anovaMatrixC(subject,1) = all_subjects(subject);
    anovaMatrixC(subject,2) = temp.meanShiftC_Hand_press;
    anovaMatrixC(subject,3) = temp.meanShiftC_Hand_tone;
    anovaMatrixC(subject,4) = temp.meanShiftC_Foot_press;
    anovaMatrixC(subject,5) = temp.meanShiftC_Foot_tone;
       
    
    %% generate var for each subject
    for j = 1:length(all_subjects)
        eval([sprintf('sub_%d', all_subjects(j)) '= temp'])
    end
    
    
    
    %% Generate variables for each subject
    if subject == 1;
        sub01 = temp;
    end
    if subject == 2;
        sub02 = temp;
    end
    if subject == 3;
        sub03 = temp;
    end
    if subject == 4;
        sub04 = temp;
    end
    if subject == 5;
        sub05 = temp;
    end
    if subject == 5;
        sub05 = temp;
    end
    if subject == 6;
        sub06 = temp;
    end
    if subject == 7;
        sub07 = temp;
    end
    if subject == 8;
        sub08 = temp;
    end
    if subject == 9;
        sub09 = temp;
    end
    if subject == 10;
        sub10 = temp;
    end
    if subject == 11;
        sub11 = temp;
    end
    if subject == 12;
        sub12 = temp;
    end
    if subject == 13;
        sub13 = temp;
    end
    if subject == 14;
        sub14 = temp;
    end
    if subject == 15;
        sub15 = temp;
    end
    if subject == 16;
        sub16 = temp;
    end
    if subject == 17;
        sub17 = temp;
    end
    if subject == 18;
        sub18 = temp;
    end
    if subject == 19;
        sub19 = temp;
    end
    if subject == 20;
        sub20 = temp;
    end

    clear temp data
end

%% Kick-ass figures of all subjects
display(anovaMatrix(:,2:end));
figure; bar(mean(anovaMatrix(:,2:end))); hold on; errorbar(mean(anovaMatrix(:,2:end)),1.96*std(anovaMatrix(:,2:end))/sqrt(length(anovaMatrix)), 'x'); xlabel('Hand-press  Hand-tone  Foot-press  Foot-tone'); title(['Shift Mean+CI. (N=',num2str(length(anovaMatrix(:,1))),')']);
figure; bar(mean(errorMatrix(:,2:end))); hold on; errorbar(mean(errorMatrix(:,2:end)),1.96*std(errorMatrix(:,2:end))/sqrt(length(errorMatrix)), 'x'); title(['Error Mean+std. (N=',num2str(length(errorMatrix(:,1))),')']); ylabel('error/ms');

figure; bar(mean(anovaMatrixC(:,2:end))); hold on; errorbar(mean(anovaMatrixC(:,2:end)),1.96*std(anovaMatrixC(:,2:end))/sqrt(length(anovaMatrixC)), 'x'); xlabel('Hand-press  Hand-tone  Foot-press  Foot-tone'); title(['Shift (removed outliers) Mean+CI. (N=',num2str(length(anovaMatrixC(:,1))),')']);
figure; bar(mean(errorMatrixC(:,2:end))); hold on; errorbar(mean(errorMatrixC(:,2:end)),1.96*std(errorMatrixC(:,2:end))/sqrt(length(errorMatrixC)), 'x'); title(['Error Mean+std. (N=',num2str(length(errorMatrixC(:,1))),') (removed outliers)']); ylabel('error/ms');



clear subject  all_subjects 

save('All-IB')
save('IBmatrix.mat','anovaMatrix')
csvwrite('IBmatrix.csv',anovaMatrix)
save('IBmatrixC.mat','anovaMatrixC')
csvwrite('IBmatrixC.csv',anovaMatrixC)