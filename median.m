function median(nfiles)
%% Median Filter
%Using a 3x3 Median filter
f = waitbar(0,'Initializing','Name','Median Filter...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);
%Images have been stretched linearly to enhance contrast
for i=1:nfiles
    if getappdata(f,'canceling')
        break
    end
      waitbar(i/nfiles,f,sprintf('Percentage Done %0.1f%%',100*i/nfiles));
      
        imname = sprintf('ImagesUnsharp\\%d.png',i);
        data = imread(imname);
        data = mat2gray(data);
        img_med3 = medfilt2(data, [3,3], 'symmetric');
        imname = sprintf('ImagesMedian\\%d.png',i);
        imwrite(img_med3, imname);
         if(i==1)
            figure,
            subplot(1,2,1)
            imshow(data);
            title('Image after Unsharp Filtering');
            subplot(1,2,2);
            imshow(img_med3);
            title('Image after applying a Median Filter');
        end
end
delete(f);
end
