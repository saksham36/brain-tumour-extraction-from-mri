function ws(nfiles)
%% Watershed Algorithm
%Using Opening to remove Skull
f = waitbar(0,'Initializing','Name','Applying Watershed Algorithm...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);

for i=1:nfiles
    if getappdata(f,'canceling')
        break
    end
      waitbar(i/nfiles,f,sprintf('Percentage Done %0.1f%%',100*i/nfiles));
        
        imname = sprintf('ImagesThresh\\%d.png',i);
        imgws = sprintf('Images\\%d.png',i);
        data = imread(imname);
        img_ws = imread(imgws);
        %Complement image to make object (foreground) black so as to be
        %treated as catchments. Similarly the background will become white
        C = ~data;
        %bwdist computes the distance transform. For each pixel in BW, the 
        %distance transform assigns a number that is the distance between that 
        %pixel and the nearest nonzero pixel of BW.
        D = -bwdist(C);
        %Modify the image so that background pixel is and extended maxima pixel are forced
        % the only local minima in the image (All the background distance
        % is infinite so no false catchments)
        D(C) = -Inf;
        %Watershed returns 0 for watershed ridge lines and catchment is non
        %zero
        L = watershed(D);
        img_ws(L==0) = 0;
        imname = sprintf('ImagesWatershed\\%d.png',i);
        imwrite(img_ws, imname);
         if(i==1)
            figure,
            subplot(1,2,1)
            imshow(data);
            title('Thresholded Image');
            subplot(1,2,2);
            imshow(img_ws);
            title('Image after applying Watershed Algorithm');
        end
end
delete(f);
end