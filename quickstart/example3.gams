Variables ba, so4, baoh, oh, hso4, h ;

Equations r1, r2, r3, r4, b1, b2 ;

r1..  ba * so4 =e= 1 ;
r2..  baoh / ba / oh =e= 4.8 ;
r3..  hso4 / so4 / h =e= .98 ;
r4..  h * oh =e= 1 ;
b1..  ba + 1e-7*baoh =e= so4 + 1e-5*hso4 ;
b2..  2 * ba + 1e-7*baoh + 1e-2*h =e= 2 * so4 + 1e-5*hso4 + 1e-2*oh ;

Model wall / all / ;

ba.l=1; so4.l=1; baoh.l=1; oh.l=1; hso4.l=1; h.l=1;

solve wall using nlp minimizing ba;
