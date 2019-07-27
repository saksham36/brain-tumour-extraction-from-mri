function img_load(imagefiles, nfiles)
f = waitbar(0,'Initializing','Name','Loading Images...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);
%Images have been stretched linearly to enhance contrast
for i=1:nfiles
    if getappdata(f,'canceling')
        break
    end
      waitbar(i/nfiles,f,sprintf('Percentage Done %0.1f%%',100*i/nfiles));
      
        currentNo = imagefiles(i).name;
        currentfilename = sprintf('Images\\%s',currentNo);
        img = imread(currentfilename);
        img = mat2gray(img);
        imname = sprintf('Images\\%d.png', i);
        imwrite(img, imname);
end
delete(f);
end