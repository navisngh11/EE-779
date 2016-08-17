% Using Biased estimate for finding Autocovariance sequence
function [r]= findAutocov (x)
r=zeros(1,size(x,2));
for i=1:size(x,2);
    for j=i:size(x,2);
        r(i)=r(i)+(x(j)*x(j-i+1));
    end
end
r= r/size(x,2);