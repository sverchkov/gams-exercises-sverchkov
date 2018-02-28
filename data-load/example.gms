* GAMS example with data loading from file

* Declare symbols to read
Set resources, products;

Parameter netreturns(products);
Parameter endowments(resources);
Parameter resourceusage(resources,products);

* open the file
$gdxin data.gdx

* load data (and throw an effor if there is a domain violation)
$loaddc products resources netreturns endowments resourceusage

* close the file
$gdxin

* A simple LP problem (based on quickstart example 1)

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
