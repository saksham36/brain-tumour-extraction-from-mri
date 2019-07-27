function lpf(nfiles)
%% Low Pass Filter
%Using an Averaging filter
avg_3 = (1/9)*ones(3,3);
f = waitbar(0,'Initializing','Name','Low Pass Filter...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);
for i=1:nfiles
    if getappdata(f,'canceling')
        break
    end
      waitbar(i/nfiles,f,sprintf('Percentage Done %0.1f%%',100*i/nfiles));
      
        imname = sprintf('Images\\%d.png',i);
        data = imread(imname);
        data = mat2gray(data);
        img_lpf = imfilter(data, avg_3, 'conv');
        imname = sprintf('ImagesLPF\\%d.png',i);
        imwrite(img_lpf, imname);
        
        if(i==1)
            figure,
            subplot(1,2,1)
            imshow(data);
            title('Original Image');
            subplot(1,2,2);
            imshow(img_lpf);
            title('Image after applying Low Pass Filter');
        end
end

delete(f);
end