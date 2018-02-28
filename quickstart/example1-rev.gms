Set       j        / corn, wheat, cotton /
          i        / land, labor /;

Parameter c(j)     / corn 109, wheat 90, cotton 115 /
          b(i)     / land 100 , labor 500 /;

Table     a(i,j)
            corn    wheat    cotton
land          1        1        1
labor         6        4        8      ;

Positive Variables x(j);
Variables          profit;

Equations          objective           
                   constraint(i) ;

objective..      profit =e= sum(j, (c(j))*x(j));
constraint(i)..  sum(j, a(i,j) *x(j))  =l=   b(i);

Model resalloc /all/;
solve resalloc using LP maximizing profit;
