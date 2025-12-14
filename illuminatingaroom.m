%% Room and Bulb Setup
L = 10; W = 4; H = 3;       % Room dimensions
P_total = 300;              % Total watts
floorStep = 0.05;           % Grid step for floor

[x, y] = meshgrid(0:floorStep:L, 0:floorStep:W);  % Floor grid
floorPoints = [0 0; 0 W; L 0; L W; L/2 W/2];     % Corners + center

%% Number of bulbs to simulate
bulbCounts = 1:6;

figure;
for n = bulbCounts
    P = P_total / n;  % Power per bulb
    
    % Determine bulb positions (evenly spaced)
    nx = ceil(sqrt(n));      % number of bulbs along length
    ny = ceil(n / nx);       % number along width
    x_bulbs = linspace(L/(2*nx), L-L/(2*nx), nx);
    y_bulbs = linspace(W/(2*ny), W-W/(2*ny), ny);
    
    % Create bulb coordinates
    bulb_coords = [];
    for i = 1:nx
        for j = 1:ny
            if size(bulb_coords,1) < n
                bulb_coords = [bulb_coords; x_bulbs(i) y_bulbs(j)];
            end
        end
    end
    
    % Compute total intensity at each floor point
    I_total = zeros(size(x));
    for b = 1:n
        r2 = (x - bulb_coords(b,1)).^2 + (y - bulb_coords(b,2)).^2 + H^2;
        I_total = I_total + P ./ (4 * r2);
    end
    
    % Plot heatmap using subplot
    subplot(2,3,n)
    imagesc([0 L], [0 W], I_total)
    set(gca,'YDir','normal')
    colorbar
    colormap(jet)
    title(sprintf('%d bulb(s)', n))
    xlabel('x (m)')
    ylabel('y (m)')
    
    % Print intensity at corners + center
    fprintf('--- %d bulb(s) ---\n', n);
    for k = 1:size(floorPoints,1)
        xp = floorPoints(k,1);
        yp = floorPoints(k,2);
        I_point = 0;
        for b = 1:n
            r2 = (xp - bulb_coords(b,1))^2 + (yp - bulb_coords(b,2))^2 + H^2;
            I_point = I_point + P / (4 * r2);
        end
        fprintf('Intensity at (%.1f, %.1f): %.2f W/m^2\n', xp, yp, I_point);
    end
    fprintf('\n');
end
