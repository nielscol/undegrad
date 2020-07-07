% Cole Nielsen 2017
% niels538@umn.edu
global radius radius_eff separation array_size array_center;
radius = 0.1524; %coil radius (m)
separation = 0.00635; %coil separation (m)
wire = 3.175e-03; %conductor radius (m)
array_size = 128; %use even size
array_center = 1 + array_size/2; 
mu_r = 1; %relative permeability of space
mu_0 = 1.2566370614359e-06; %reduced permeability of free space
current = 1; %coil current
N1 = 1; %primary coil turns
N2 = 1; %secondary coil turns

integration_steps  = round(1.6*(array_size-1)); %steps in biot_savart integration
dtheta = (2*pi)/integration_steps;
radius_eff = radius-wire;
primary = zeros(array_size,array_size);
secondary = zeros(array_size,array_size);

axis = [-1*radius_eff ((array_size-1)/array_size)*radius_eff];

%find the max field at edge for min half step spacing from coil
%{
max_edge_field = 0;

for theta = 0:integration_steps - 1
    max_edge_field = max_edge_field + dtheta * biot_kernel(theta*dtheta, radius*(1-(1/(array_size - 1))), 0, 0);
end

max_edge_field = max_edge_field * mu_r * mu_0 * current * N1 * radius *(1/(4*pi));
%}

%primary calculation
for a = 1:array_size
    for b = 1:array_size
        if in_circle(a,b) == 1
            for theta = 0:integration_steps - 1
                primary(a,b) = primary(a,b) + dtheta * biot_kernel(theta*dtheta, index2pos(a), index2pos(b), 0);
            end
            primary(a,b) = primary(a,b) * mu_r * mu_0 * current * N1 * radius *(1/(4*pi));
        end
    end
end

%{
%reject overly high cell values
for a = 1:array_size
    for b = 1:array_size
        if primary(a,b) > (array_size - 1)*primary(array_center,array_center)
            primary(a,b) = 0;
        end
    end
end
%}

%secondary calculation
for a = 1:array_size
    for b = 1:array_size
        if in_circle(a,b) == 1
            for theta = 0:integration_steps - 1
                secondary(a,b) = secondary(a,b) + dtheta * biot_kernel(theta*dtheta, index2pos(a), index2pos(b), separation);
            end
            secondary(a,b) = secondary(a,b) * mu_r * mu_0 * current * radius *(1/(4*pi));
        end
    end
end

primary(isnan(primary)) = 0; 
secondary(isnan(secondary)) = 0;

cell_area = ((2*radius_eff)/(array_size-1))^2;

bsumpri = 0;
bsumsec = 0;

bsumpri = array_summation(primary);
bsumsec = array_summation(secondary);

L_pri = (bsumpri * cell_area * N1)/current;
L_sec = (bsumpri * cell_area * N2^2)/(N1*current);
mutual = (bsumsec * cell_area * N2)/current;

k = mutual / sqrt(L_pri*L_sec);

fprintf('L_pri = %d uH\n', L_pri*10^6);
fprintf('L_sec = %d uH\n', L_sec*10^6);
fprintf('L_mutual = %d uH\n', mutual*10^6);
fprintf('k = %d\n', k);

figure;
image(axis, axis, primary,'CDataMapping','scaled');
%colormap(gray);
title(['Primary Coil Field']);
xlabel('X - Position (cm)');
ylabel('Y - Position (cm)');
pbaspect([1 1 1]);
colorbar;

figure;
image(axis, axis, secondary,'CDataMapping','scaled');
%colormap(gray);
title(['Secondary Coil Field at ' num2str(100*separation) ' cm separation']);
xlabel('X - Position (cm)');
ylabel('Y - Position (cm)');
pbaspect([1 1 1]);
colorbar;

function result = in_circle(a,b)
%determines if point is in circule radius
    global array_center array_size;
    if sqrt((array_center - a)^2 + (array_center - b)^2) < array_size/2 -1
        result = 1;
    else
        result = 0;
    end
end


function x = index2pos(a)
%converts array index to position in meters
    global array_center array_size radius_eff;
    x = ((a - array_center)/((array_size/2) -1)) * radius_eff;
end

function result = biot_kernel(theta, x, y, zed)
    global radius;
    result = sqrt((x - radius * cos(theta))^2 + (y - radius * sin(theta))^2)/sqrt(zed^2 + (x - radius * cos(theta))^2 + (y - radius * sin(theta))^2)^3;
end
    
function sum = array_summation(array)
    global array_size;
    partial_sum = 0;
    for a = 1 : array_size
        for b = 1 : array_size
            partial_sum = partial_sum + array(a,b);
        end
    end
    sum = partial_sum;
end