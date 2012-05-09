NB. rational approximations of non-rational functions -------------------

NB. e f  x -- compute f x within error e
NB. n f0 x -- n terms of series for f x
NB. e nf x -- number of terms required for error e and f x

exp0 =: ] ([: +/ ^ % !@])       i.@[
ln0  =: 4 : '+: +/ i %~ (%/y+_1 1)^i=. 1+2*i.x'  NB. AS 4.1.27
sin0 =: ] ([: -/ ^ % !@]) >:@+:@i.@[  
cos0 =: ] ([: -/ ^ % !@])    +:@i.@[  

nexp=: 4 : '2x + (^.x) (> i. 1:) (i*^.y)-+/\^.i=.1+i.200'
nsin=: 4 : '1x + >. !@>:@+:^:_1 %x'
ncos=: 4 : '1x + >. !@   +:^:_1 %x'

nln =: 4 : 0
 r=. |%/(x:^:_1 y)+_1 1
 k=. 1+2*i.1+>.-:r^.-:x
 1x + (-:x) (> i. 1:) k%~r^k
)

sin=: nsin sin0 ]
cos=: ncos cos0 ]
exp=: nexp exp0 ]

NB. (ln x*y) = (ln x)+(ln y)
NB. (ln x^e) = e * ln x

ln=: 4 : 0
 assert. 0<y
 e=. <.2^.x:^:_1 y
 r=. (x: y) % 2x^e
 a=.b=.0
 if. 1~:r do. a=.   (x nln r) ln0 r  end.
 if. 0~:e do. b=. e*(x nln 2) ln0 2x end.
 a+b   
)

sqrt=: 4 : 0
 -:@(+(x:y)&%)^:x x:%:y
)

'2.7182818284590452353602874713526624977572' -: 0j40 ": 1e_40 exp 1x
'1.010050167084168058'      -: 0j18 ": 1e_18 exp 1r100
'1.105170918075647625'      -: 0j18 ": 1e_18 exp 1r10
'1.221402758160169834'      -: 0j18 ": 1e_18 exp 2r10
'1.349858807576003104'      -: 0j18 ": 1e_18 exp 3r10
'1.491824697641270318'      -: 0j18 ": 1e_18 exp 4r10
'1.648721270700128147'      -: 0j18 ": 1e_18 exp 5r10
'1.822118800390508975'      -: 0j18 ": 1e_18 exp 6r10
'2.013752707470476522'      -: 0j18 ": 1e_18 exp 7r10
'2.225540928492467605'      -: 0j18 ": 1e_18 exp 8r10
'2.459603111156949664'      -: 0j18 ": 1e_18 exp 9r10

'0.8414709848078965066525023216302989996226' -: 0j40 ": 1e_40 sin 1x
'0.09983341664682815230681' -: 0j23 ": 1e_23 sin 1r10
'0.19866933079506121545941' -: 0j23 ": 1e_23 sin 2r10
'0.29552020666133957510532' -: 0j23 ": 1e_23 sin 3r10
'0.38941834230865049166631' -: 0j23 ": 1e_23 sin 4r10
'0.47942553860420300027329' -: 0j23 ": 1e_23 sin 5r10
'0.56464247339503535720095' -: 0j23 ": 1e_23 sin 6r10
'0.64421768723769105367261' -: 0j23 ": 1e_23 sin 7r10
'0.71735609089952276162717' -: 0j23 ": 1e_23 sin 8r10
'0.78332690962748338846138' -: 0j23 ": 1e_23 sin 9r10

'0.5403023058681397174009366074429766037323' -: 0j40 ": 1e_40 cos 1x
'0.99500416527802576609556' -: 0j23 ": 1e_23 cos 1r10
'0.98006657784124163112420' -: 0j23 ": 1e_23 cos 2r10
'0.95533648912560601964231' -: 0j23 ": 1e_23 cos 3r10
'0.92106099400288508279853' -: 0j23 ": 1e_23 cos 4r10
'0.87758256189037271611628' -: 0j23 ": 1e_23 cos 5r10
'0.82533561490967829724095' -: 0j23 ": 1e_23 cos 6r10
'0.76484218728448842625586' -: 0j23 ": 1e_23 cos 7r10
'0.69670670934716542092075' -: 0j23 ": 1e_23 cos 8r10
'0.62160996827066445648472' -: 0j23 ": 1e_23 cos 9r10

'0.6931471805599453094172321214581765680755' -: 0j40 ": 1e_40 ln 2
'1.0986122886681096913952452369225257046475' -: 0j40 ": 1e_40 ln 3
'2.3025850929940456840179914546843642076011' -: 0j40 ": 1e_40 ln 10


NB. notes ---------------------------------------------------------------

sin0 =: ] ([: -/ ^ % !@]) >:@+:@i.@[  
nsin=: 4 : '1x + >. !@>:@+:^:_1 %x'
sin=: nsin sin0 ]

1: 0 : 0
 Identities to reduce sin(x) for any x to
 sin(y) or cos(y) where (0<:y)*.(y<:0.25p1)
 sin(x+2*n*1p1) = sin(x)
 sin(x)         = sin(1p1-x)
 sin(-x)        = -sin(x)
 sin(0.5p1+x)   = cos(x)
 sin(0.5p1-x)   = cos(x)
 
)


4!:55 ;:'cos cos0 exp exp0 ln ln0 ncos nexp nln nsin sin sin0 sqrt'


