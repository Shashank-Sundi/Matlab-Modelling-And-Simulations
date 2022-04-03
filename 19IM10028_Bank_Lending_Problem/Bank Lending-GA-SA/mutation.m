function  child=mutation(parent)
nmut=5;
for n=1:nmut
    
    C=randi([1 2]);
    
    switch C
        case 1
            % Swap Mutation
            a=randsample(10,1);
            b=randsample(10,1);
            copy=parent;
            parent(b)=copy(a);
            parent(a)=copy(b);
        case 2
             %Inversion Mutation
            a=randsample(10,1);
            b=randsample(10,1);
            if a<b
                parent=cat(2,parent(1:a-1),parent(b:-1:a),parent(b+1:10));
            else
                parent=cat(2,parent(1:b-1),parent(a:-1:b),parent(a+1:10));
            end
    end
child=parent;
end