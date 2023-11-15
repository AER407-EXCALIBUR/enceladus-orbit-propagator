function yp = enceladus_orbit_ode(t, y)

[p, f, g, h, k, L] = unpack_mee(y);

r_enceladus = 252e3;
J2_enceladus = 5435.2e-6;

q = 1 + f .* cos(L) + g .* sin(L);

r = p./q;

% J2 perturbation
mu = 7.203600E+09;
r_enceladus = 252e3;
J2_enceladus = 5435.2e-6;

f_r = -3 * mu * J2_enceladus * r_enceladus.^2 / (2*r.^4) * (1- 12 * (h*sin(L) - k*cos(L)).^2 / (1+h^2 + k^2 )^2);
f_theta = -12 * mu * J2_enceladus * r_enceladus.^2 / (r^4) * ((h*sin(L) - k*cos(L))*(h*cos(L) + k*sin(L)) / (1+h^2 + k^2 )^2);
f_normal = -6*mu * J2_enceladus * r_enceladus.^2 / (r^4) * ((1-h^2-k^2)*(h*sin(L)-k*cos(L))/(1+h^2+k^2));

f_app = [f_r; f_theta; f_normal];

yp = gve_mee(t, y, f_app);


end