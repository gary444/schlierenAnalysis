function process_image(path, out_path)

addpath ("peterkovesi/")

pkg load image


img_in = rgb2gray(imread(path));  


% [gx, gy] = derivative5(img_in, 'x', 'y');
% figure('Name', 'Xg')
% imshow(gx)
% figure('Name', 'Yg')
% imshow(gy)

sigma = 1;
k = 0.04;
[cim, r , c] = harris(img_in, sigma, k, 'radius', 3);
% figure('Name', 'cornerness')
% imshow(cim)

% auto visualise points
% [r,c] = nonmaxsuppts(cim, 'im', img_in);


% [r,c] = nonmaxsuppts(cim);








% negX = (Xg == 0);
% imshow(negX)

% % r = harris_corner_points(Xg, Yg);



% foerstner_corners(Xg,Yg)

img_out = img_in;

for i = 1:length(r)
	img_out(r(i),c(i)) = 255.0;
endfor


if (length(out_path))       % write overlaid image to file

	imwrite(img_out, out_path)
else 
	figure('Name', 'Dot Image')
	imshow(img_out)
end



end


% %---------------------------------------------------------------
% function [img_out] = checkargs(v)
    
%     p = inputParser;
%     p.CaseSensitive = true;
    
%     % Define optional parameter-value pairs and their defaults    
%     addParameter(p, 'img_out',"", @isstring);  


%     parse(p, v{:});

%     img_out       = p.Results.img_out;    
    
% end  