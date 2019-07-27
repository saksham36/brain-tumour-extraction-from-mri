function unsharp(nfiles)
%% Unsharp Filter
%Using an Averaging filter
avg_3 = (1/9)*ones(3,3);
f = waitbar(0,'Initializing','Name','Unsharp Filter...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);
for i=1:nfiles
    if getappdata(f,'canceling')
        break
    end
      waitbar(i/nfiles,f,sprintf('Percentage Done %0.1f%%',100*i/nfiles));
      
        imname = sprintf('ImagesLPF\\%d.png',i);
        data = imread(imname);
        data = mat2gray(data);
        data_blurred = imfilter(data, avg_3, 'conv');
        mask = data - data_blurred;
        img = data + mask;
        imname = sprintf('ImagesUnsharp\\%d.png',i);
        imwrite(img, imname);
         if(i==1)
            figure,
            subplot(1,2,1)
            imshow(data);
            title('Image after applying Low Pass Filter');
            subplot(1,2,2);
            imshow(img);
            title('Image after applying Unsharp Filter');
        end
end
delete(f);
end