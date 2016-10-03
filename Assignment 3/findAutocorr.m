% Using Biased estimate for finding Autocovariance sequence
function [r]= findAutocov (x)
r=zeros(1,size(x,2));
for i=1:size(x,2)
    for j=i:size(x,2);
        r(i)=r(i)+(x(j)*conj(x(j-i+1)));
    end
    %r(i) = r(i)/(size(x,2)-i-1);
end
r= r/size(x,2);