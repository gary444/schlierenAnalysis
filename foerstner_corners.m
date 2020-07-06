function [output_image] = foerstner_corners (x_gradient_in, y_gradient_in)
   
   Ix2 = x_gradient_in.**2;
   Iy2 = y_gradient_in.**2;
   IxIy = x_gradient_in.*y_gradient_in;
   window = ones(5,5);
   Ix2 = conv2(Ix2, window,"same");
   Iy2 = conv2(Iy2, window,"same");
   IxIy = conv2(IxIy, window,"same");
   
   %trace matrix
   trace = Ix2.+Iy2;
   trace2 = trace.**2;
   %determinant matrix
   det = (Ix2.*Iy2) - (IxIy.**2);

   %create cornerness and roundness matrices
   W = trace./2 - ((trace./2).^2.-det).^0.5; %add eps here?
   Q = (det.*4)./(trace2); % add eps here?
   Q(Q<0) = 0;
   Q(Q>1) = 1;
   
   W = (W>0.0004);
   Q = (Q>0.5);
   
   figure('Name', 'Cornerness')
   imshow(W)
   imwrite(W, "images/cornerness.bmp")
   colormap(jet);
  
   figure('Name', 'Roundness')
   imshow(Q)
   imwrite(Q, "images/roundness.bmp")
   colormap(jet);
   
   output_image = W & Q;
   
 endfunction