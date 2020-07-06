%% Initialization
clear ; close all; clc
addpath ("peterkovesi/")

pkg load image


% load image files in folder
files = glob('./../PIVlab/pngimages/*.png');
names = cell(numel(files),1);
for i=1:numel(files)
  [~, names(i)] = fileparts (files{i});
endfor


for i=1:numel(files)
	process_image(files{i}, strcat("../images/output/6_8_20_harris_v1/", names{i}, ".png") );

endfor

