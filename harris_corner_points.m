function r = harris_corner_points(x_gradient_in, y_gradient_in)

	alpha = 0.05;
   Ix2 = x_gradient_in.**2;
   Iy2 = y_gradient_in.**2;
   IxIy = x_gradient_in.*y_gradient_in;
   window = ones(5,5);
   Ix2 = conv2(Ix2, window,"same");
   Iy2 = conv2(Iy2, window,"same");
   IxIy = conv2(IxIy, window,"same");
   
   %trace matrix
   traceA = Ix2+Iy2;
   %determinant matrix
   detA = (Ix2.*Iy2) - (IxIy.**2);

   r = detA - alpha.*(traceA.^2);

   figure('Name', 'R')
   
   
   maxr = max(max(r))

	imshow(r)
   colormap(jet)
   % window = ones(5,5);

end