* This writes data to a file

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

* Execute-write everything to file
execute_unloaddi 'data.gdx'

