%% Initialization
clear ; close all; clc



% load image files in folder
files = glob('./../PIVlab/pngimages/*.png');
names = cell(numel(files),1);
for i=1:numel(files)
  [~, names(i)] = fileparts (files{i});
endfor


for i=1:numel(files)
	process_image(files{i}, strcat("../images/output/6_8_20_harris_v2/", names{i}, ".png") );

endfor

