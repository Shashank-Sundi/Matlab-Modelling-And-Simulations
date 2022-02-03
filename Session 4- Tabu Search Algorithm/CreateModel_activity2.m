% Author : Shashank Sundi
% Roll No. : 19IM10028

function model=CreateModel_activity2()

    x=[20 34 74 37 77]; % arbitrary positioning
    
    y=[14 42 10 80 50 ];% arbitrary positioning
    
    n=numel(x);
    
    d=[ [0 132 217 164 158] 
        [132 0 290 201 79] 
        [217 290 0 113 303] 
        [164 201 113 0 196]
        [158 79	303	196	0]];


    xmin=0;
    xmax=100;
    
    ymin=0;
    ymax=100;
    
    model.n=n;
    model.x=x;
    model.y=y;
    model.d=d;
    model.xmin=xmin;
    model.xmax=xmax;
    model.ymin=ymin;
    model.ymax=ymax;
    
end