clear;
clc;
addpath(genpath('.\Function'));

% Data_Path='D:\WORK\WORKING\D\SPECIAL_CODE\Voice_Converter_CycleGAN-wayne\data\Training\TrainA';
% Data_Path='D:\WORK\WORKING\D\SPECIAL_CODE\Voice_Converter_CycleGAN-wayne\data\Training\TrainB';
% Data_Path='D:\WORK\WORKING\D\SPECIAL_CODE\Voice_Converter_CycleGAN-wayne\data\Testing\TestA';
Data_Path='C:\Users\chenyu\Desktop\Voice_Converter_CycleGAN-stable\data\Training\TEST';
% Data_Path='D:\WORK\WORKING\D\Add_Noise_v6\Clean_data\For_Testing_22K';

Time_Record={'Year','Month','Day'};

% List_Save_Path='D:\WORK\WORKING\D\SPECIAL_CODE\Voice_Converter_CycleGAN-wayne\data\Training\';
% List_Save_Path='D:\WORK\WORKING\D\SPECIAL_CODE\Voice_Converter_CycleGAN-wayne\data\Testing\';
List_Save_Path='C:\Users\chenyu\Desktop\Voice_Converter_CycleGAN-stable';
List_Name='Evalu_List_A_1223';% 'Train_List_A' 'Train_List_B' 'Evalu_List_A' 'Evalu_List_B' 'Test_List_A' 'Test_List_B'
List_ext=['.mat'];%'.mat' '.list'
Other_Arg=[];

%% List Processing
Data_Dir=Error_Char_to_Correct(Data_Path,'/',{'\'});
if Data_Dir(end)~='/'
    Data_Dir=sprintf('%s%s',Data_Dir,'/');
end

List_Dir=Error_Char_to_Correct(List_Save_Path,'/',{'\'});
if List_Dir(end)~='/'
    List_Dir=sprintf('%s%s',List_Dir,'/');
end

[Data_info,Field_info]=Dir_Track_List(Data_Dir,'Sub');
D_Field=fieldnames(Data_info);
Layer=D_Field{Field_info.Layer};
Total=Field_info.Total;

[File_Name,File_Ext,Ext_Final_pos]=Detect_ext({Data_info(:).(Layer)});

% file path concat
File_Path=strcat({Data_info(:).Final_Path},'/');
Data_list=strcat(Data_Dir,File_Path,File_Name,File_Ext);
Data_list = sort_nat(Data_list);

Data_list_path=[List_Dir,List_Name,List_ext];
switch List_ext
    case {'.mat'}
        if isempty(Other_Arg)
            save(Data_list_path,'Data_list');
        else
            save(Data_list_path,'Data_list',Other_Arg);
        end
    case {'.list'}
        listpath=sprintf('%s%s',Data_list_path);
        listid=fopen(listpath,'w');
        for list_index=1:Total
            fprintf(listid,'%s\n',Data_list{list_index});
        end
        fclose('all');
        
end
