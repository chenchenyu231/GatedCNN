function [Model_Name]=Time_Record_Func(Time,Time_Record,Model_Name)

Time_Record_Type={'Year','Month','Day','Hour','Minute','Second'};

[Member,Record_Method] = ismember(Time_Record,Time_Record_Type);
if any(Member==1) % if member is not empty, start recording time
    Model_Name=[Model_Name,'_Date['];
    
    Record_Method=Record_Method(Member==1);
    for Record_index = 1:length(Record_Method)
        if Record_index==1
            Model_Name=[Model_Name,num2str(Time(Record_Method(Record_index)))];
        else
            Model_Name=[Model_Name,'_',num2str(Time(Record_Method(Record_index)))];
        end
    end
    Model_Name=[Model_Name,']'];
end

end
