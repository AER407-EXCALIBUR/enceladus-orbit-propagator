function circ = plot_circle(x, y, r, c)
% plot_circle(x,y,r,c) plots a filled circle
% x,y,r are the center and radius of the circle
% c is the color of the circle
% circ is the handle of the circle

[X,Y,Z] = sphere;

circ = surf(X*r-x, Y*r-y, Z*r, 0, "FaceColor", c, "EdgeColor", "none", "HandleVisibility", "off");

end
