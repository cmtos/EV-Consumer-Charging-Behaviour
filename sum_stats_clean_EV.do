insheet using "Q:\Economics Research\EV Code\final_ev_data.csv", clear

*Filtration process:

*Too low values

drop if energykwh <= 0.25
drop if fee <= 0.2

*Too high values

drop if energykwh >= 25
drop if fee >= 14
drop if weekday_n == 0 
* How many users left?

tab userid

*Drop users with less than 4 weeks of data

bysort userid: drop if _N<28

tab userid

edit

*Rough idea of the plot

graph twoway (scatter fee energykwh) /// 
			 (qfit fee energykwh) ///
			 , scheme(s2mono) title("{stSerif: {bf: Aggregate Charging Preferences}}") xtitle("{stSerif:{bf: Energy Delivered (kWh)}}") ytitle("{stSerif: {bf: Fee ($)}}") legend(off)

			 
graph twoway (histogram st)	///
			 , scheme(s2mono) title("{stSerif: {bf: Proportion of charge events beginning each hour}} ") xtitle("{stSerif: {bf: Time of Day}}") ytitle("{stSerif:{bf: Charge Events (%)}}")
			 
graph box fee, over(userid, sort(1)) box(1, color("51 102 204")) ///
		title("{stSerif: {bf: Boxplot}}")
			 
*Somewhat quadratic - not strong enough to corroborate many of the prior assumptions


*Calculating duration times and time of day bins for the histograms

*Generating a seconds variable from the charging time 

*rename totalduration chargetime

*gen str8 stime = chargetime
*gen shours = substr(stime, 1,2)
*gen hour = real(shours)

*gen smins = substr(stime,4, 2)
*gen min = real(smins)

*gen ssecs = substr(stime, 7,2)
*gen sec = real(ssecs)

*gen totTimeMin = 60*hour + min + sec/60

*gen totTimeSec = 3600*hour + 60*min + sec

*sum energykwh fee tottimemin

* Generating dates variables and time of day variables from startdate and enddate


*gen st2 = startdate 

*gen sdate1 = substr(sd, 1, 10)
*gen stime2= substr(st2,12, 2)
*gen st = real(stime2)



*histogram st 

*gen sdate = date(sdate1, "MDY")
*format sdate %td
*gen starttime = clock(stime2, "hm")
 
*tab st 

*gen weekDay_N = st;

*replace weekDay_N = 0 if st == 22;
*replace weekDay_N = 0 if st == 23;
*replace weekDay_N = 0 if st == 0;
*replace weekDay_N = 0 if st == 1;
*replace weekDay_N = 1 if st == 2;
*replace weekDay_N = 1 if st == 3;
*replace weekDay_N = 1 if st == 4;
*replace weekDay_N = 1 if st == 5;
*replace weekDay_N = 2 if st == 6;
*replace weekDay_N = 2 if st == 7;
*replace weekDay_N = 2 if st == 8;
*replace weekDay_N = 2 if st == 9;
*replace weekDay_N = 3 if st == 10;
*replace weekDay_N = 3 if st == 11;
*replace weekDay_N = 3 if st == 12;
*replace weekDay_N = 3 if st == 13;
*replace weekDay_N = 4 if st == 14;
*replace weekDay_N = 4 if st == 15;
*replace weekDay_N = 4 if st == 16;
*replace weekDay_N = 4 if st == 17;
*replace weekDay_N = 5 if st == 18;
*replace weekDay_N = 5 if st == 19;
*replace weekDay_N = 5 if st == 20;
*replace weekDay_N = 5 if st == 21;

ssc install outreg2 

sum energykwh tottimemin fee

outreg2 using "s209.doc", replace sum(log) keep(energykwh tottimemin fee) 

corr energykwh tottimemin fee 



