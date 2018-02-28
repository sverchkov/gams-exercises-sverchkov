$ontext
  well formatted algebraic version of the first example model
$offtext
Set       products  'Items produced by farm'
              / corn   'in acres'
                wheat  'in acres'
                cotton 'in acres' /
          resources  'Resources limiting farm production'
              / land   'in acres'
                labor  'in hours' /;
       
Parameter netreturns(products)  'Net returns per unit produced'
              / corn 109 , wheat 90, cotton 115 /
          endowments(resources) 'Amount of each resource available'
              / land 100, labor 500 /;
      
Table     resourceusage(resources,products) 'Resource usage per unit produced'
                          corn    wheat  cotton
               land          1       1       1
               labor         6       4       8      ;
       
Positive Variables   production(products) 'Number of units produced';
Variables            profit               'Total sum of net returns';

Equations            profitAcct           'Profit accounting equation' 
                     available(resources) 'Resource availability limit';

$ontext
      Specify definition of profit
$offtext

profitAcct..
      profit
      =e= sum(products, netreturns(products)*production(products));

$ontext
      Limit available resources
      Fix at exogenous levels
$offtext

available(resources)..
      sum(products,
          resourceusage(resources,products) *production(products))
      =l= endowments(resources);

Model resalloc /all/;

solve resalloc using LP maximizing profit; 
