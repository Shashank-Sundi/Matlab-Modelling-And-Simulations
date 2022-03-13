function tardiness=tardiness(X)
 % total_tardiness= summation ( cumulative job processing time -
 % Corresponding Due date )
 
% Jobs --- 1 2 3 4 5
proc_time=[6,2,3,4,5];
due_date=[18,6,9,11,8];

time_taken=0;
tardiness=0;

 for i=1:length(X)
     time_taken = time_taken + proc_time(X(i));
     tardiness=tardiness+time_taken-due_date(i);
 end

end