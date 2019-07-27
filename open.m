function open(nfiles)
%% Open
%Using Opening to remove Skull
f = waitbar(0,'Initializing','Name','Opening...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);
SE = strel('disk', 15);
for i=1:nfiles
    if getappdata(f,'canceling')
        break
    end
      waitbar(i/nfiles,f,sprintf('Percentage Done %0.1f%%',100*i/nfiles));
        
        imname = sprintf('ImagesMedian\\%d.png',i);
        data = imread(imname);
        data = mat2gray(data);
        img_seg = imopen(data, SE);
        imname = sprintf('ImagesOpen\\%d.png',i);
        imwrite(img_seg, imname);
         if(i==1)
            figure,
            subplot(1,2,1)
            imshow(data);
            title('Image after Median Filter');
            subplot(1,2,2);
            imshow(img_seg);
            title('Image after Opening');
        end
end
delete(f);
end