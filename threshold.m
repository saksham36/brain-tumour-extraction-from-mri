function threshold(nfiles)
%% Thresholding
f = waitbar(0,'Initializing','Name','Thresholding...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);
%Images have been stretched linearly to enhance contrast

for i=1:nfiles
    if getappdata(f,'canceling')
        break
    end
      waitbar(i/nfiles,f,sprintf('Percentage Done %0.1f%%',100*i/nfiles));
        
        imname = sprintf('ImagesOpen\\%d.png',i);
        data = imread(imname);
        data = mat2gray(data);
        d = unique(data);
        count = length(d);
        s = sum(d);

        T = s / count;
        img = data;
        img(img<=T) = 0;
        img(img>T) = 1;
        imname = sprintf('ImagesThresh\\%d.png',i);
        imwrite(img, imname);
        
         if(i==1)
            figure,
            subplot(1,2,1)
            imshow(data);
            title('Opened Image');
            subplot(1,2,2);
            imshow(img);
            title('Image after Thresholding');
        end
end
delete(f);
end