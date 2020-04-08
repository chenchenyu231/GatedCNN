function [List,Dir_Num_info]=Dir_Track_List(Path,Final_Output)

if nargin==1
    Final_Output=0;
end

Subdirnum=0;
Total_Data=0;
Data_Dir_info={};


[~,Data_Dir_info,Total_Data,~]=Data_Tracking_v2(Path,Data_Dir_info,Total_Data,Subdirnum);
Dir_num=size(Data_Dir_info,2);

for Dir_index=1:Dir_num
    eval(['[List(1:Total_Data).Sub_Dir' num2str(Dir_index) ']=Data_Dir_info{:,Dir_index};']);
end


switch Final_Output
    
    case{'Full','full',1}
        
        Final_num=Dir_num+1;
        
        Data_Dir_info(:,Final_num)=Data_Dir_info(:,1);
        
        for Dir_index=2:Dir_num
            %             Data_Dir_info(Final_num,:)=strcat(Data_Dir_info(Final_num,:),{'/'},Data_Dir_info(Dir_index,:));
            for Data_index=1:Total_Data
                if isempty(Data_Dir_info{Data_index,Dir_index})
                    Data_Dir_info(Data_index,Final_num)=Data_Dir_info(Data_index,Final_num);
                else
                    Data_Dir_info(Data_index,Final_num)=strcat(Data_Dir_info(Data_index,Final_num),{'/'},Data_Dir_info(Data_index,Dir_index));
                end
            end
            
        end
        
        [List(1:Total_Data).Final_Path]=Data_Dir_info{:,Final_num};
        
        Dir_Num_info.Layer=Dir_num;
        Dir_Num_info.Full_Path=Final_num;
        Dir_Num_info.Total=Total_Data;
        
    case{'Sub','sub',2}
        
        Final_num=Dir_num+1;
        if Dir_num<2
            Data_Dir_info(:,Final_num)={[]};
        else
            Data_Dir_info(:,Final_num)=Data_Dir_info(:,1);
        end
        
        for Dir_index=3:Dir_num

            for Data_index=1:Total_Data
                if isempty(Data_Dir_info{Data_index,Dir_index})
                    Data_Dir_info(Data_index,Final_num)=Data_Dir_info(Data_index,Final_num);
                else
                    Data_Dir_info(Data_index,Final_num)=strcat(Data_Dir_info(Data_index,Final_num),{'/'},Data_Dir_info(Data_index,Dir_index-1));
                end
            end
            
        end
        
        [List(1:Total_Data).Final_Path]=Data_Dir_info{:,Final_num};
        
        Dir_Num_info.Layer=Dir_num;
        Dir_Num_info.Full_Path=Final_num;
        Dir_Num_info.Total=Total_Data;
        
    case{'Info','info',0}
        
        Dir_num=size(Data_Dir_info,1);
        Final_num=Dir_num;
        Dir_Num_info.Layer=Dir_num;
        Dir_Num_info.Total=Total_Data;
end

end

