function variable = set_to_range(variable, min_interval, max_interval)
%% PURPOSE: Set the variable to the specified range. 
% AMIR ALLAHVERDI ZADEH(Email: amir.allahvirdizadeh@curtin.edu.au)
% NOV 2011
%%
variable = variable - max_interval * floor(variable/max_interval);
if(variable<min_interval)
    variable = variable + max_interval;
end
