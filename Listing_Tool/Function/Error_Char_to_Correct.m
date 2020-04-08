function [New_String,Error_Position]=Error_Char_to_Correct(Source,Replacer,Custom_Error_List)
New_String=Source;
if nargin<3
    Error_List={'+','-','*','\','[',']',' '};
else
    Error_List=Custom_Error_List;
end
if iscell(Replacer)
    Replacer=Replacer{:};
end

List_Num=length(Error_List);
Error_Position=cell(1,List_Num);
for index=1:List_Num
    Position = strfind(New_String,Error_List{index});
    if isempty(Position)
        Error_Position{index} = Position;
    else
        New_String = strrep(New_String,Error_List{index},Replacer);
        Error_Position{index} = Position;
    end
end

end