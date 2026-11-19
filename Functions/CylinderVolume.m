function [V] = CylinderVolume(Ca,Cyl)
% This function provides the cylinder volume as function of 
% Ca : Crankangle [degrees]
% Cyl :  a struct containing
%   Cyl.S : Stroke
%   Cyl.B                   : Bore
%   Cyl.ConRod              : Connecting Rod length
%   Cyl.CompressionRatio    : Compession Ratio
%   Cyl.TDCangle            : Angle associated with the Top Dead Center
%----------------------------------------------------------------------
fprintf('WARNING------------------------------------------------------------------\n');
fprintf(' Modify this function to yours. Now it is just a sinusoidal expression\n');
fprintf(' This function is %s\n',mfilename('fullpath'));
fprintf('END OF WARNING ----------------------------------------------------------\n');
B   = Cyl.Bore;
S   = Cyl.Stroke;
cr  = Cyl.CompressionRatio;
r   = S/2;
l   = Cyl.ConRod;
%-------------------------------------------------------------------------------------------------------
CAl     = Ca-Cyl.TDCangle;
Vd      = pi*(B/2)^2*S;
Vc      = Vd/(cr-1);
Vold   = Vc + Vd*(sind(CAl+90)+1)/2; % 'sind' is the sine function taking arguments in degrees instead of radians NOT USED!!!
V    = Vc + 0.25*pi*B^2 .* (r + l - (r*cosd(Ca) + (l^2 - r^2 * sind(Ca).^2).^0.5) ); %The new implemented volume function



