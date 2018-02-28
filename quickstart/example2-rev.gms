Set commodities / corn, wheat /;
Set curvetype   / supply, demand/;

Table intercepts(curvetype,commodities)
                  corn   wheat
         demand    4       8
         supply    1       2;

Table slopes(curvetype,commodities,commodities)
                   corn  wheat
     demand.corn   -.3    -.1
     demand.wheat  -.07   -.4
     supply.corn    .5     .1
     supply.wheat   .1     .3  ;

Positive Variables  P(commodities)
                    Qd(commodities)
                    Qs(commodities);

Equations     PDemand(commodities)
              PSupply(commodities)
              Equilibrium(commodities);

Alias (cc,commodities);

Pdemand(commodities)..
    P(commodities) =g= intercepts("demand",commodities)
                       + sum(cc,slopes("demand",commodities,cc)*Qd(cc));
Psupply(commodities)..
    intercepts("supply",commodities) 
    + sum(cc,slopes("supply",commodities,cc)* Qs(cc)) =g= P(commodities);

Equilibrium(commodities)..
     Qs(commodities) =g=  Qd(commodities);

Model problem / Pdemand.Qd, Psupply.Qs,Equilibrium.P /;
solve problem using MCP;
