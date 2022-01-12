function f = fSSR(D, S, Q)
yp = a(1)*D.^a(2)*S.^a(3);
f = sum((ym-yp).^2);

