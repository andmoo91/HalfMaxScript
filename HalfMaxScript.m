%This is just a for looped version of the FWHM https://www.mathworks.com/matlabcentral/answers/310113-how-to-find-out-full-width-at-half-maximum-from-this-graph



for k=1:2:size(A,2) %import a numeric matrix of linescans where column 1+2n = x position and column 2+2n = intensity. k will always be the x position
    l=k+1 % l will be the intensity
    xval=A(:,k); %take the x positions
    data=A(:,l); %take the intensity
    halfMax = (min(data) + max(data)) / 2; %calculate the half max of the intensity
    index1 = find(data >= halfMax, 1, 'first'); % Find where the data first drops below half the max.
    % Find where the data last rises above half the max.
    index2 = find(data >= halfMax, 1, 'last');
    fwhm = index2-index1 + 1; % FWHM in indexes.
    % OR, if you have an x vector
    fwhmx = xval(index2) - xval(index1); %grabs the x position of the half max intensities and gets the difference
    Outvec(:,k)=fwhmx; %outputs into a matrix
    figure
     hold on
   plot(xval,data);
   plot(xval(index1),data(index1),"r*")
   plot(xval(index2),data(index2),"r*")%this just graphs the fwhm on each plot. you can comment out hold on line 4 if you want to see it for only one graph
  hold off
end

FWHMFinal = Outvec(1:2:end)'; %just cleans up the matrix so there aren't blank columns
