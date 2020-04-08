function [Path,List_Content,Total_Data,Subdirnum]=Data_Tracking_v2(Path,List_Content,Total_Data,Subdirnum)

Data=dir(Path);
if length(Data)==1
    Data_index_Start=1;
else
    Data_index_Start=3;
end
Subdirnum=Subdirnum+1;

% Sub Dir & File Tracking
for Data_index=Data_index_Start:length(Data)
    
    if Data(Data_index).isdir==1
        
        folder_name=[Data(Data_index).name];
        SubPath=[Path,'/',folder_name];
        CurrentData=Total_Data+1;
        [~,List_Content,Total_Data,Subdirnum]=Data_Tracking_v2(SubPath,List_Content,Total_Data,Subdirnum);
        List_Content(CurrentData:Total_Data,Subdirnum)={folder_name};
      
    else
        
        Total_Data=Total_Data+1;
        file_name=[Data(Data_index).name];
        List_Content{Total_Data,Subdirnum}=[file_name];
        
    end
    
end
Subdirnum=Subdirnum-1;

return