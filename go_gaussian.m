%accepts: image to process, k = kernel radius (not including centre), SD = std dev
function [x_gradient, y_gradient] = go_gaussian (image, k, SD)
  
  kernel_size = k*2 + 1;
  gog_kernel_x = ones(kernel_size, kernel_size);
  
  for x = -k:k
    for y = -k:k
      %gog formula
      gog_kernel_x(y+k+1, x+k+1) = -x/(2.0*pi*(SD**4))*exp(-(x**2+y**2)/(2*SD**2));
    endfor
  endfor
  
  %transpose to get y kernel
  gog_kernel_y = gog_kernel_x.';
  
  x_gradient = conv2(image, gog_kernel_x, "same");
  y_gradient = conv2(image, gog_kernel_y, "same");
  
  x2 = x_gradient.^2;
  y2 = y_gradient.^2;
  gradient_magnitude = x2+y2;
  gradient_magnitude = gradient_magnitude.^0.5;
  
  % figure('Name', 'Magnitude')
  % imshow(gradient_magnitude.*255.0)
  % imwrite(gradient_magnitude, "images/gradient_magnitude.bmp")
 
  
endfunction
 