%Setting folder


%IDEA1: Keep this as a little example of what the code can do, I essentially
%ceated three separate excel sheets for three of the ev consumers in our
%dataset. I imported these into Matlab, cleaned them into just price and
%kWh data, and then concatenated them. I made the MAJOR assumption that
%they can represent the same individual. As there are some NaNs and zero
%values I only tested the first 5 obs for each. To me it also looks like
%each quantity of charge chosen will take its form as a separate good. NOT
%IDEAL either. 


%IDEA2: Below, choosing consumers with more than 7 obs of 7 day purchase
%decisions and assessing their rationality. 

%IDEA3: I've generated pricepergallon data but below rather than comparing
%charge against gas I've combined them into one bundle and compared againts
%other potential bundles of the two. NEED TO CHANGE


cd 'Q:\Economics Research\EV Code'

%Importing table
d1 = readtable('bro_Test.csv');
%d2 = readtable('book2.csv')
%d3 = readtable('book3.csv')

%Selecting relevant data
energyBundle = d1(:, ["energykwh","fee"]);
%gasBundle = d1(:, ["gasGallons","gasPerGallon"]);

%y2 = d2(:, ["Var7","Var22"])
%y3 = d3(:, ["Var7","Var22"])
%Single columns from table
chargeKwh1 = energyBundle(:,"energykwh");
feeCharge1 = energyBundle(:, "fee");

%gasAlt1 = gasBundle(:, "gasGallons");
%feeGas1 = gasBundle(:, "gasPerGallon");

chargeKwhCol = table2array(chargeKwh1);
feeChargeCol = table2array(feeCharge1);

%gasAltCol = table2array(gasAlt1);
%feeGasCol = table2array(feeGas1);

q = transpose(chargeKwhCol);
p = transpose(feeChargeCol);

%gasAlt = transpose(gasAltCol);
%feeGas = transpose(feeGasCol);


%user 200169 = user a
p_a = [p(1:7); p(8:14); p(15:21); p(22:28)];
q_a = [q(1:7); q(8:14); q(15:21); q(22:28)];
checkpq(p_a,q_a)
garp(p_a,q_a)
ngarpviol(p_a, q_a)
emax(p_a, q_a)
bronars(p_a, q_a, 100)
%user 206089 = user b 

p_b = [p(70:76); p(77:83); p(84:90); p(91:97)];
q_b = [q(70:76); q(77:83); q(84:90); q(91:97)];
checkpq(p_b,q_b)
garp(p_b,q_b)
ngarpviol(p_b, q_b)
emax(p_b, q_b)
bronars(p_b, q_b, 100)

%user 209813 = user c 

p_c = [p(116:122); p(123:129); p(130:136); p(137:143)];
q_c = [q(116:122); q(123:129); q(130:136); q(137:143)];
checkpq(p_c,q_c)
garp(p_c,q_c)
ngarpviol(p_c, q_c)
emax(p_c, q_c)
bronars(p_c, q_c, 100)
%user 211289 = user d 

p_d = [p(166:172); p(173:179); p(180:186); p(187:193)];
q_d = [q(166:172); p(173:179); p(180:186); p(187:193)];
checkpq(p_d,q_d)
garp(p_d,q_d)
ngarpviol(p_d, q_d)
emax(p_d, q_d)
bronars(p_d, q_d, 100)
%user 217113 = user e 

p_e = [p(196:202); p(203:209); p(210:216); p(217:223)];
q_e = [q(196:202); p(203:209); p(210:216); p(217:223)];
checkpq(p_e,q_e)
garp(p_e,q_e)
ngarpviol(p_e, q_e)
emax(p_e, q_e)
bronars(p_e, q_e, 100)

% user 223923 = user f

p_f = [p(296:302); p(303:309); p(310:316); p(317:323)];
q_f = [q(296:302); p(303:309); p(310:316); p(317:323)];
checkpq(p_f,q_f)
garp(p_f,q_f)
ngarpviol(p_f, q_f)
emax(p_f, q_f)
bronars(p_f, q_f, 100)

%user 235945 = user g 

p_g = [p(335:341); p(342:348); p(349:355); p(356:362)];
q_g = [q(335:341); p(342:348); p(349:355); p(356:362)];
checkpq(p_g,q_g)
garp(p_g,q_g)
ngarpviol(p_g, q_g)
emax(p_g, q_g)
bronars(p_g, q_g, 100)

%user 250315 = user h

p_h= [p(425:431); p(432:438); p(439:445); p(446:452)];
q_h = [q(425:431); p(432:438); p(439:445); p(446:452)];
checkpq(p_h,q_h)
garp(p_h,q_h)
ngarpviol(p_h, q_h)
emax(p_h, q_h)
bronars(p_h, q_h, 100)

% Combined vector 

p_comb = [p_a; p_b; p_c; p_d; p_e; p_f; p_g; p_h];
q_comb = [q_a; q_b; q_c; q_d; q_e; q_f; q_g; q_h];

checkpq(p_comb, q_comb)
garp(p_comb, q_comb)
ngarpviol(p_comb, q_comb)
emax(p_comb, q_comb)
bronars(p_comb, q_comb,100)

%Messing around trying to get some actual p and q vectors
%{
checkpq(p,q)
warp(p,q)
nwarpviol(p,q)
garp(p,q)
ngarpviol(p,q)
emax(p,q)

bronars(p,q,300)
%}

%Consumer 217113

%pr1 = price1(337:344);
%qr1 = kWh1(337:344);

%{
p1 = [feeCharge(26:30); feeCharge(31:35); feeCharge(36:40); feeCharge(41:45); feeCharge(46:50)]
q1 = [chargekwh(26:30); chargekwh(31:35); chargekwh(36:40); chargekwh(41:45); chargekwh(46:50)]

checkpq(p1,q1)
warp(p1,q1)
nwarpviol(p1,q1)
garp(p1,q1)
ngarpviol(p1,q1)
emax(p1,q1)

bronars(p1,q1,300)
%}
%{
pr2 = price1(345:352);
qr2 = kWh1(345:352);

pr3 = price1(353:360);
qr3 = kWh1(353:360);

pr4 = price1(361:368);
qr4 = kWh1(361:368);

pr5 = price1(369:376);
qr5 = kWh1(369:376);

pr6 = price1(377:384);
qr6 = kWh1(377:384);

pr7 = price1(385:392);
qr7 = kWh1(385:392);

pr8 = price1(393:400);
qr8 = kWh1(393:400);

p_2 = [pr1; pr2; pr3; pr4; pr5; pr6; pr7; pr8];
q_2 = [qr1; qr2; qr3; qr4; qr5; qr6; qr7; qr8];

checkpq(p_2,q_2)
warp(p_2,q_2)
garp(p_2,q_2)
ngarpviol(p_2,q_2)
emax(p_2,q_2)


bronars(p_2,q_2,8)
%}
%{
p2 = [feeCharge(450:454); feeCharge(455:459); feeCharge(460:464); feeCharge(465:469); feeCharge(470:474)]
q2 = [chargekwh(450:454); chargekwh(455:459); chargekwh(460:464); chargekwh(465:469); chargekwh(470:474)]

checkpq(p2,q2)
warp(p2,q2)
nwarpviol(p2,q2)
garp(p2,q2)
ngarpviol(p2,q2)
emax(p2,q2)

bronars(p2,q2,300)
%}
