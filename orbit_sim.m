mu = 7.203600E+09;
r_enceladus = 252e3;
J2_enceladus = 5435.2e-6;

% classical orbital elements, moderately eccentric case
srs_a = 677000;
srs_ecc = 0.55391433;
srs_p = srs_a * (1-srs_ecc^2);

% south pole pe orbit
srs_Omega = 0;
srs_omega = -90;
srs_inc = 90;

% MEEs
srs_f = srs_ecc * cosd(srs_Omega + srs_omega);
srs_g = srs_ecc * sind(srs_Omega + srs_omega);
srs_h = tand(srs_inc/2) * cosd(srs_Omega);
srs_k = tand(srs_inc/2) * sind(srs_Omega);

y0 = [srs_p; srs_f; srs_g; srs_h; srs_k; 0];

num_days = 50;

[t, y] = ode89(@enceladus_orbit_ode, [0, 86400*num_days], y0);
[y_interp, t_interp] = interp_mee(y', t);

plot_orbit_mee(y_interp)
