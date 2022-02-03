% Author : Shashank Sundi
% Roll No. : 19IM10028

function q=DoReversion(p,i1,i2)
    q=p;
    if i1<i2
        q=p([1:i1-1 i2:-1:i1 i2+1:end]);
        % if index1 is greater than index 2 , or 
         % else it gives empty vector
    else
        q=p([1:i2-1 i1:-1:i2 i1+1:end]);
    end
end