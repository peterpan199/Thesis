clear all
cd "C:\Users\panag\OneDrive..."
**********************************

*2009
*inidvidual
import excel "2009_ICT_ind file_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2009.dta", replace 
*household
import excel "2009_ΙCT_hh file_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_ID
save "household2009.dta", replace 
*merge inidvidual with household file
use "individual2009.dta", replace 
merge 1:1 hid using "household2009.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "03lessfr" 	if IFU==4
replace freqiuse = "04never" 	if IFU==9

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection = 0 if IACC==0

*residence_area variable 
gen residence_area="."
replace residence_area="01North" if GEO_NUTS1=="GR1 "
replace residence_area="02Central" if GEO_NUTS1=="GR2 "
replace residence_area="03Attica" if GEO_NUTS1=="GR3 "
replace residence_area="04Islands" if GEO_NUTS1=="GR4 "

**household members variable
gen householdmembers = HH_POP

**Number of children in household variable 
gen childreninhoushold = HH_CHILD

**income
gen income  = .
replace income = 667 if HH_IQ==1
replace income = 958 if HH_IQ==2
replace income = 1385 if HH_IQ==3
replace income = 2004 if HH_IQ==4

*survey year
gen syear = 2009

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU


**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown" if BFUNK == 1 


**age
gen age = "."
replace age= "16-24" if AGECLS == 2
replace age= "25-34" if AGECLS == 3
replace age= "35-44" if AGECLS == 4
replace age= "45-54" if AGECLS == 5
replace age= "55-64" if AGECLS == 6
replace age= "65-74" if AGECLS == 7

**individuals sex
generate sex= "."
replace sex=  "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4

*education level
*low=Primary or lower secondary education, no formal education (ISCED 0, 1 or 2)
*medium=Upper secondary education (ISCED 3 or 4)
*high=Tertiary education (ISCED 5 or 6)
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5


**individual weighting
gen indweighting = IND_WGHT

*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices freqiuse


save "individual_household_2009.dta", replace 
***************************

***************************
*2010
*inidvidual
import excel "2010_ICT_IND file_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2010.dta", replace 
*household
import excel "2010_ICT_HH file_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_ID
save "household2010.dta", replace 
*merge inidvidual with household file
use "individual2010.dta", replace 
merge 1:1 hid using "household2010.dta"


*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "03lessfr" 	if IFU==4
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection =0 if IACC==0


*residence_area variable 
gen residence_area="."
replace residence_area="01North" if GEO_NUTS1=="GR1 "
replace residence_area="02Central" if GEO_NUTS1=="GR2 "
replace residence_area="03Attica" if GEO_NUTS1=="GR3 "
replace residence_area= "04Islands" if GEO_NUTS1=="GR4 "


*household members variable
gen householdmembers =.
replace householdmembers =  HH_POP


**Number of children in household variable 
gen childreninhoushold = HH_CHILD


**income
gen income  = .
replace income = 665 if HH_IQ==1
replace income = 997 if HH_IQ==2
replace income = 1417 if HH_IQ==3
replace income = 2013 if HH_IQ==4


*survey year
gen syear = 2010

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown" if BFUNK == 1 

**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74


**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4


*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5


**individual weighting
gen indweighting = IND_WGHT


**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices freqiuse 

save "individual_household_2010.dta", replace 
*************************

*************************
*2011
*inidvidual
import excel "2011_ICT_IND file_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2011.dta", replace 
*household
import excel "2011_ICT_HH file_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_ID
save "household2011.dta", replace 
*merge inidvidual with household file
use "individual2011.dta", replace 
merge 1:1 hid using "household2011.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "03lessfr" 	if IFU==4
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection = 0 if IACC==0


*residence_area variable 
gen residence_area="."
replace residence_area="01North" if GEO_NUTS1=="GR1 "
replace residence_area="02Central" if GEO_NUTS1=="GR2 "
replace residence_area="03Attica" if GEO_NUTS1=="GR3 "
replace residence_area= "04Islands" if GEO_NUTS1=="GR4 "


*household members variable
gen householdmembers = HH_POP
tab householdmembers


****Number of children in household variable 
gen childreninhoushold = HH_CHILD


**income
gen income  = .
replace income = 598 if HH_IQ==1
replace income = 915 if HH_IQ==2
replace income = 1317 if HH_IQ==3
replace income = 1896 if HH_IQ==4


*survey year
gen syear = 2011

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown" if BFUNK == 1 


**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74

**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4


*education level
gen educlevel = "."
replace educlevel = "01low" if ISCEDW ==0
replace educlevel = "02medium" if ISCEDW ==3
replace educlevel = "03high" if ISCEDW ==5

**individual weighting
gen indweighting = IND_WGHT


**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices freqiuse

save "individual_household_2011.dta", replace 
****************************

*****************************
*2012
*inidvidual
import excel "2012_ICT_INDfile_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2012.dta", replace 
*household
import excel "ΑΡΧΕΙΟ 2012_hh_URBANIZATION_ANONYMIZED.xlsx", sheet("Ερώτημα3") firstrow clear
gen hid = HH_ID
save "household2012.dta", replace 
*merge inidvidual with household file
use "individual2012.dta", replace 
merge 1:1 hid using "household2012.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "03lessfr" 	if IFU==4
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection = 0 if IACC==0

*residence_area variable 
gen residence_area="."
replace residence_area="01North" if GEO_NUTS1=="GR1"
replace residence_area="02Central" if GEO_NUTS1=="GR2"
replace residence_area="03Attica" if GEO_NUTS1=="GR3"
replace residence_area="04Islands" if GEO_NUTS1=="GR4"


*household members variable
gen householdmembers = HH_POP


****Number of children in household variable 
gen childreninhoushold = HH_CHILD


**income
gen income  = .
replace income = 495 if HH_IQ==1
replace income = 793 if HH_IQ==2
replace income = 1124 if HH_IQ==3
replace income = 1594 if HH_IQ==4


*survey year
gen syear = 2012

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1


*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown" if BFUNK == 1 


**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"


**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74

**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2


**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4


*job position
gen jobposition = "."
replace jobposition = "01salaried"	if EMPST_DET==1
replace jobposition = "02selfempl" 	if EMPST_DET==2
replace jobposition = "03notinuse"	if EMPST_DET==9
 
*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5

**individual weighting
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices jobposition freqiuse


save "individual_household_2012.dta", replace 
*******************************************

*******************************************
*2013
*inidvidual
import excel "2013_ICT_IND file_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2013.dta", replace 
*household
import excel "2013_ICT_HH file_URBANIZATION_ANONYMIZED.xlsx", sheet("Ερώτημα2")firstrow clear
gen hid = HH_ID
save "household2013.dta", replace 
*merge inidvidual with household file
use "individual2013.dta", replace 
merge 1:1 hid using "household2013.dta"


*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "03lessfr" 	if IFU==4
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection = 0 if IACC==0

*residence_area variable 

gen residence_area="."
replace residence_area="01North" if GEO_NUTS1=="EL1"
replace residence_area="02Central" if GEO_NUTS1=="EL2"
replace residence_area="03Attica" if GEO_NUTS1=="EL3"
replace residence_area="04Islands" if GEO_NUTS1=="EL4"


*household members variable
gen householdmembers = HH_POP


*members aged 16 to 24 variable 
gen members_aged_16_to_24= HH_POP_16_24


*Number of pupils/students aged 16 to 24 variable
gen pupilsorstudentsaged16to24= HH_POP_16_24S


**members aged 25 to 64 variable 
gen members_aged_25_to_64= HH_POP_25_64


**members aged 65 and over variable
gen members_aged_65andover= HH_POP_65_MAX

**Number of children in household variable 
gen childreninhoushold = HH_CHILD

**Number of children aged 14 to 15 variable
gen childrenaged14to15= HH_CHILD_14_15


**Number of children aged 5 to 13
gen childrenaged5to13 = HH_CHILD_5_13


**Number of children aged 4 or under variable
gen childrenaged4orunder = HH_CHILD_LE_4


**income
gen income  = .
replace income = 438 if HH_IQ==1
replace income = 698 if HH_IQ==2
replace income = 974 if HH_IQ==3
replace income = 1361 if HH_IQ==4


*survey year
gen syear = 2013

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL


**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown" if BFUNK == 1 

**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"
tab urbanization

**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74


**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4


*job position
gen jobposition = "."
replace jobposition = "01salaried"	if EMPST_DET==1
replace jobposition = "02selfempl" 	if EMPST_DET==2
replace jobposition = "03notinuse"	if EMPST_DET==9


*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5

**individual weighting
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices members_aged_16_to_24 pupilsorstudentsaged16to24 members_aged_25_to_64 members_aged_65andover childrenaged14to15 childrenaged5to13 childrenaged4orunder jobposition freqiuse

save "individual_household_2013.dta", replace 
************************************

************************************
*2014
*inidvidual
import excel "2014_ICT_IND file_ANONYMIZED.xls", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2014.dta", replace 
*household
import excel "2014_ICT_HH file with URBANIZATION.xls", sheet("Ερώτημα21") firstrow clear
gen hid = HH_ID
save "household2014.dta", replace 
*merge inidvidual with household file
use "individual2014.dta", replace 
merge 1:1 hid using "household2014.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection = 0 if IACC==0


*residence_area variable 
gen residence_area="."
replace residence_area="01North" if GEO_NUTS1=="EL1"
replace residence_area="02Central" if GEO_NUTS1=="EL2"
replace residence_area="03Attica" if GEO_NUTS1=="EL3"
replace residence_area="04Islands" if GEO_NUTS1=="EL4"

*household members variable
gen householdmembers = HH_POP


*members aged 16 to 24 variable 
gen members_aged_16_to_24= HH_POP_16_24


*Number of pupils/students aged 16 to 24 variable
gen pupilsorstudentsaged16to24 = HH_POP_16_24S


**members aged 25 to 64 variable
gen members_aged_25_to_64= HH_POP_25_64


**members aged 65 and over variable
gen members_aged_65andover= HH_POP_65_MAX


****Number of children in household variable 
gen childreninhoushold = HH_CHILD


**Number of children aged 14 to 15 variable
gen childrenaged14to15= HH_CHILD_14_15


**Number of children aged 5 to 13
gen childrenaged5to13 = HH_CHILD_5_13

**Number of children aged 4 or under variable
gen childrenaged4orunder = HH_CHILD_LE_4


**income
gen income  = .
replace income = 416 if HH_IQ==1
replace income = 640 if HH_IQ==2
replace income = 917 if HH_IQ==3
replace income = 1313 if HH_IQ==4


*survey year
gen syear = 2014

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown" if BFUNK == 1 


**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"

**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74


**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4

*job position
gen jobposition = "."
replace jobposition = "01salaried"	if EMPST_DET==1
replace jobposition = "02selfempl" 	if EMPST_DET==2
replace jobposition = "03notinuse"	if EMPST_DET==9

*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5


**individual weighting
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices members_aged_16_to_24 pupilsorstudentsaged16to24 members_aged_25_to_64 members_aged_65andover childrenaged14to15 childrenaged5to13 childrenaged4orunder jobposition freqiuse


save "individual_household_2014.dta", replace 
*****************************************

*****************************************
*2015
*inidvidual
import excel "2015_ICT_ΙΝD file_ANONYMIZED.xls", sheet("IND_anonymized") firstrow clear
gen hid = HH_REF_ID
save "individual2015.dta", replace 
*household
import excel "2015_ICT_HH file with URBANIZATION_ANONYMIZED.xls", sheet("ΗΗ anonymized") firstrow clear
gen hid = HH_ID
save "household2015.dta", replace 
*merge inidvidual with household file
use "individual2015.dta", replace 
merge 1:1 hid using "household2015.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection =0 if IACC==0

*residence_area variable 
gen residence_area="."
replace residence_area="01North" 		if GEO_NUTS1=="EL6"
replace residence_area="02Central" 	if GEO_NUTS1=="EL5"
replace residence_area="03Attica" 	if GEO_NUTS1=="EL3"
replace residence_area="04Islands" 	if GEO_NUTS1=="EL4"


*household members variable
gen householdmembers = HH_POP

*members aged 16 to 24 variable 
gen members_aged_16_to_24= HH_POP_16_24


*Number of pupils/students aged 16 to 24 variable
gen pupilsorstudentsaged16to24= HH_POP_16_24S

**members aged 25 to 64 variable 
gen members_aged_25_to_64= HH_POP_25_64


**members aged 65 and over variable
gen members_aged_65andover= HH_POP_65_MAX

****Number of children in household variable 
gen childreninhoushold = HH_CHILD


**Number of children aged 14 to 15 variable
gen childrenaged14to15= HH_CHILD_14_15

**Number of children aged 5 to 13
gen childrenaged5to13 = HH_CHILD_5_13

**Number of children aged 4 or under variable
gen childrenaged4orunder = HH_CHILD_LE_4


**income
gen income  = .
replace income = 410 if HH_IQ==1
replace income = 627 if HH_IQ==2
replace income = 905 if HH_IQ==3
replace income = 1307 if HH_IQ==4


*survey year
gen syear = 2015

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown" if BFUNK == 1 


**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"


**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74
tab age

**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4

*job position
gen jobposition = "."
replace jobposition = "01salaried"	if EMPST_DET==1
replace jobposition = "02selfempl" 	if EMPST_DET==2
replace jobposition = "03notinuse"	if EMPST_DET==9


*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5


**individual weighting
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices members_aged_16_to_24 pupilsorstudentsaged16to24 members_aged_25_to_64 members_aged_65andover childrenaged14to15 childrenaged5to13 childrenaged4orunder jobposition freqiuse

save "individual_household_2015.dta", replace 
*****************************************

*****************************************
*2016
*inidvidual
import excel "2016 _ICT_IND file_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2016.dta", replace 
*household
import excel "2016_ICT_HH file with URBANIZATION_ANONYMIZED.xlsx", sheet("Ερώτημα21") firstrow clear
gen hid = HH_ID
save "household2016.dta", replace 
*merge inidvidual with household file
use "individual2016.dta", replace 
merge 1:1 hid using "household2016.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection =0 if IACC==0

*residence_area variable 
gen residence_area="."
replace residence_area="01North" 		if GEO_NUTS1=="EL6"
replace residence_area="02Central" 	if GEO_NUTS1=="EL5"
replace residence_area="03Attica" 	if GEO_NUTS1=="EL3"
replace residence_area="04Islands" 	if GEO_NUTS1=="EL4"

*household members variable
gen householdmembers = HH_POP

*members aged 16 to 24 variable 
gen members_aged_16_to_24= HH_POP_16_24


*Number of pupils/students aged 16 to 24 variable
gen pupilsorstudentsaged16to24= HH_POP_16_24S

**members aged 25 to 64 variable 
gen members_aged_25_to_64= HH_POP_25_64


**members aged 65 and over variable
gen members_aged_65andover= HH_POP_65_MAX

****Number of children in household variable 
gen childreninhoushold = HH_CHILD

**Number of children aged 14 to 15 variable
gen childrenaged14to15= HH_CHILD_14_15

**Number of children aged 5 to 13
gen childrenaged5to13 = HH_CHILD_5_13

**Number of children aged 4 or under variable
gen childrenaged4orunder = HH_CHILD_LE_4


**income
gen income  = .
replace income = 411 if HH_IQ==1
replace income = 625 if HH_IQ==2
replace income = 917 if HH_IQ==3
replace income = 1344 if HH_IQ==4


*survey year
gen syear = 2016

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics"    if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown"      if BFUNK == 1 

**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"

**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74


**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4

*job position
gen jobposition = "."
replace jobposition = "01salaried"	if EMPST_DET==1
replace jobposition = "02selfempl" 	if EMPST_DET==2
replace jobposition = "03notinuse"	if EMPST_DET==9

*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5

**individual weighting
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices members_aged_16_to_24 pupilsorstudentsaged16to24 members_aged_25_to_64 members_aged_65andover childrenaged14to15 childrenaged5to13 childrenaged4orunder jobposition freqiuse

save "individual_household_2016.dta", replace 
*****************************************

*****************************************
*2017
*inidvidual
import excel "2017_ind_ANONYMIZED.xlsx", sheet("2017_αρχειο IND 2ης ΑΠΟΣΤΟΛΗΣ") firstrow clear
gen hid = HH_REF_ID
save "individual2017.dta", replace 
*household
import excel "2017_hh_URBANIZATION_ANONYMIZED.xlsx", sheet("Ερώτημα26") firstrow clear
gen hid = HH_ID
save "household2017.dta", replace 
*merge inidvidual with household file
use "individual2017.dta", replace 
merge 1:1 hid using "household2017.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection =0 if IACC==0

*residence_area variable 
gen residence_area="."
replace residence_area="01North" 		if GEO_NUTS1=="EL6"
replace residence_area="02Central" 	if GEO_NUTS1=="EL5"
replace residence_area="03Attica" 	if GEO_NUTS1=="EL3"
replace residence_area="04Islands" 	if GEO_NUTS1=="EL4"


*household members variable
gen householdmembers = HH_POP

*members aged 16 to 24 variable 
gen members_aged_16_to_24= HH_POP_16_24

*Number of pupils/students aged 16 to 24 variable
gen pupilsorstudentsaged16to24= HH_POP_16_24S

**members aged 25 to 64 variable 
gen members_aged_25_to_64= HH_POP_25_64


**members aged 65 and over variable
gen members_aged_65andover= HH_POP_65_MAX

****Number of children in household variable 
gen childreninhoushold = HH_CHILD

**Number of children aged 14 to 15 variable
gen childrenaged14to15= HH_CHILD_14_15

**Number of children aged 5 to 13
gen childrenaged5to13 = HH_CHILD_5_13

**Number of children aged 4 or under variable
gen childrenaged4orunder = HH_CHILD_LE_4


**income
gen income  = .
replace income = 432 if HH_IQ==1
replace income = 633 if HH_IQ==2
replace income = 911 if HH_IQ==3
replace income = 1311 if HH_IQ==4


*survey year
gen syear = 2017

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK


*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL


**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown" if BFUNK == 1 


**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"

**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74


**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4

*job position
gen jobposition = "."
replace jobposition = "01salaried"	if EMPST_DET==1
replace jobposition = "02selfempl" 	if EMPST_DET==2
replace jobposition = "03notinuse"	if EMPST_DET==9

*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5


**individual weighting
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices members_aged_16_to_24 pupilsorstudentsaged16to24 members_aged_25_to_64 members_aged_65andover childrenaged14to15 childrenaged5to13 childrenaged4orunder jobposition freqiuse


save "individual_household_2017.dta", replace 
**************************************

***************************************
*2018
*inidvidual
import excel "2018_ICT_INDfile_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2018.dta", replace 
*household
import excel "2018_ICT_HH file with URBANIZATION_ANONYMIZED.xlsx", sheet("2018_HH 2ης ΑΠΟΣΤΟΛΗΣ_ΜΕ ΑΣΤΙΚΟ") firstrow clear 
gen hid = HH_ID
save "household2018.dta", replace 
*merge inidvidual with household file
use "individual2018.dta", replace 
merge 1:1 hid using "household2018.dta"


*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection =0 if IACC==0

*residence_area variable 
gen residence_area="."
replace residence_area="01North" 		if GEO_NUTS1=="EL6"
replace residence_area="02Central" 	if GEO_NUTS1=="EL5"
replace residence_area="03Attica" 	if GEO_NUTS1=="EL3"
replace residence_area="04Islands" 	if GEO_NUTS1=="EL4"


*household members variable
gen householdmembers = HH_POP

*members aged 16 to 24 variable 
gen members_aged_16_to_24= HH_POP_16_24


*Number of pupils/students aged 16 to 24 variable
gen pupilsorstudentsaged16to24= HH_POP_16_24S


**members aged 25 to 64 variable 
gen members_aged_25_to_64= HH_POP_25_64


**members aged 65 and over variable
gen members_aged_65andover= HH_POP_65_MAX


****Number of children in household variable 
gen childreninhoushold = HH_CHILD


**Number of children aged 14 to 15 variable
gen childrenaged14to15= HH_CHILD_14_15


**Number of children aged 5 to 13
gen childrenaged5to13 = HH_CHILD_5_13


**Number of children aged 4 or under variable
gen childrenaged4orunder = HH_CHILD_LE_4


**income
gen income  = .
replace income = 448 if HH_IQ==1
replace income = 655 if HH_IQ==2
replace income = 933 if HH_IQ==3
replace income = 1329 if HH_IQ==4


*survey year
gen syear = 2018

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL


**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown" if BFUNK == 1 

**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"

**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74


**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2


**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4

*job position
gen jobposition = "."
replace jobposition = "01salaried"	if EMPST_DET==1
replace jobposition = "02selfempl" 	if EMPST_DET==2
replace jobposition = "03notinuse"	if EMPST_DET==9

*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5

**individual weighting
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices members_aged_16_to_24 pupilsorstudentsaged16to24 members_aged_25_to_64 members_aged_65andover childrenaged14to15 childrenaged5to13 childrenaged4orunder jobposition freqiuse


save "individual_household_2018.dta", replace 
********************************

********************************
*2019
*inidvidual
import excel "2019 ICT_IND FILE_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2019.dta", replace 
*household
import excel "2019 ICT_HH FILE with URBANIZATION_ANONYMIZED.xlsx", sheet("2019_hh_urbanization") firstrow clear
gen hid = HH_ID
save "household2019.dta", replace 
*merge inidvidual with household file
use "individual2019.dta", replace 
merge 1:1 hid using "household2019.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection =0 if IACC==0

*residence_area variable 
gen residence_area="."
replace residence_area="01North" 		if GEO_NUTS1=="EL6"
replace residence_area="02Central" 	if GEO_NUTS1=="EL5"
replace residence_area="03Attica" 	if GEO_NUTS1=="EL3"
replace residence_area="04Islands" 	if GEO_NUTS1=="EL4"

*household members variable
gen householdmembers = HH_POP


*members aged 16 to 24 variable 
gen members_aged_16_to_24= HH_POP_16_24


*Number of pupils/students aged 16 to 24 variable
gen pupilsorstudentsaged16to24= HH_POP_16_24S

**members aged 25 to 64 variable 
gen members_aged_25_to_64= HH_POP_25_64


**members aged 65 and over variable
gen members_aged_65andover= HH_POP_65_MAX


****Number of children in household variable 
gen childreninhoushold = HH_CHILD


**Number of children aged 14 to 15 variable
gen childrenaged14to15= HH_CHILD_14_15


**Number of children aged 5 to 13
gen childrenaged5to13 = HH_CHILD_5_13

**Number of children aged 4 or under variable
gen childrenaged4orunder = HH_CHILD_LE_4


**income
gen income  = .
replace income = 475 if HH_IQ==1
replace income = 683 if HH_IQ==2
replace income = 969 if HH_IQ==3
replace income = 1374 if HH_IQ==4


*survey year
gen syear = 2019

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
replace HH_WGHT = subinstr(HH_WGHT, ",", ".",.) 
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BFDOM == 1 
replace online_seller_origin = "02E.U sellers" if BFEU ==1
replace online_seller_origin = "03outside E.U sellers" if BFWRLD ==1
replace online_seller_origin = "04unkown" if BFUNK == 1 

**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"


**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74


**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4

*job position
gen jobposition = "."
replace jobposition = "01salaried"	if EMPST_DET==1
replace jobposition = "02selfempl" 	if EMPST_DET==2
replace jobposition = "03notinuse"	if EMPST_DET==9

*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5

**individual weighting
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices members_aged_16_to_24 pupilsorstudentsaged16to24 members_aged_25_to_64 members_aged_65andover childrenaged14to15 childrenaged5to13 childrenaged4orunder jobposition freqiuse


save "individual_household_2019.dta", replace 
********************************

********************************
*2020
*inidvidual
import excel "2020 ICT_IND FILE_ANONYMIZED f.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2020.dta", replace 
*household
import excel "2020 ICT_HH FILE with urbanization_ANONYMIZED_f.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_ID
save "household2020.dta", replace 
*merge inidvidual with household file
use "individual2020.dta", replace 
merge 1:1 hid using "household2020.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection =0 if IACC==0

*residence_area variable 
gen residence_area="."
replace residence_area="01North" 		if GEO_NUTS1=="EL6"
replace residence_area="02Central" 	if GEO_NUTS1=="EL5"
replace residence_area="03Attica" 	if GEO_NUTS1=="EL3"
replace residence_area="04Islands" 	if GEO_NUTS1=="EL4"


*household members variable
gen householdmembers = HH_POP

*members aged 16 to 24 variable 
gen members_aged_16_to_24= HH_POP_16_24


*Number of pupils/students aged 16 to 24 variable
gen pupilsorstudentsaged16to24= HH_POP_16_24S

**members aged 25 to 64 variable 
gen members_aged_25_to_64= HH_POP_25_64


**members aged 65 and over variable
gen members_aged_65andover= HH_POP_65_MAX

****Number of children in household variable 
gen childreninhoushold = HH_CHILD

**Number of children aged 14 to 15 variable
gen childrenaged14to15= HH_CHILD_14_15

**Number of children aged 5 to 13
gen childrenaged5to13 = HH_CHILD_5_13

**Number of children aged 4 or under variable
gen childrenaged4orunder = HH_CHILD_LE_4


**income
gen income  = .
replace income = 507 if HH_IQ==1
replace income = 732 if HH_IQ==2
replace income = 1031 if HH_IQ==3
replace income = 1451 if HH_IQ==4


*survey year
gen syear = 2020

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BPG_DOM  == 1 
replace online_seller_origin = "02E.U sellers" if BPG_EU ==1
replace online_seller_origin = "03outside E.U sellers" if BPG_WRLD ==1
replace online_seller_origin = "04unkown" if BPG_UNK == 1 

**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"

**age
gen age="."
replace age= "16-24" if AGE >=16 & AGE <=24
replace age= "25-34" if AGE >=25 & AGE <=34
replace age= "35-44" if AGE >=35 & AGE <=44
replace age= "45-54" if AGE >=45 & AGE <=54
replace age= "55-64" if AGE >=55 & AGE <=64
replace age= "65-74" if AGE >=65 & AGE <=74


**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2


**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if EMPST==1
replace emplstatus = "02unemployed" if EMPST==2
replace emplstatus = "03student" if EMPST==3
replace emplstatus = "04econinactive" if EMPST==4

*job position
gen jobposition = "."
replace jobposition = "01salaried"	if EMPST_DET==1
replace jobposition = "02selfempl" 	if EMPST_DET==2
replace jobposition = "03notinuse"	if EMPST_DET==9

*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5



**individual weighting
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices members_aged_16_to_24 pupilsorstudentsaged16to24 members_aged_25_to_64 members_aged_65andover childrenaged14to15 childrenaged5to13 childrenaged4orunder jobposition freqiuse


save "individual_household_2020.dta", replace 
********************************

********************************
*2021
*inidvidual
import excel "2021 ICT_IND FILE_ANONYMIZED.xlsx", sheet("Φύλλο1") firstrow clear 
gen hid = HH_REF_ID
save "individual2021.dta", replace 
*household
import excel "2021 ICT_HH FILE with urbanization_ANONYMIZED.xlsx", sheet("Ερώτημα12") firstrow clear
gen hid = HH_ID
save "household2021.dta", replace 
*merge inidvidual with household file
use "individual2021.dta", replace 
merge 1:1 hid using "household2021.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFU==1
replace freqiuse = "02weekly" 	if IFU==2 
replace freqiuse = "03lessfr" 	if IFU==3
replace freqiuse = "04never" 	if IFU==9

*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection =0 if IACC==0

*residence_area variable 
gen residence_area="."
replace residence_area="01North" 		if GEO_NUTS1=="EL6"
replace residence_area="02Central" 	if GEO_NUTS1=="EL5"
replace residence_area="03Attica" 	if GEO_NUTS1=="EL3"
replace residence_area="04Islands" 	if GEO_NUTS1=="EL4"


*household members variable
gen householdmembers = HH_POP

*members aged 16 to 24 variable 
gen members_aged_16_to_24= HH_POP_16_24

*Number of pupils/students aged 16 to 24 variable
gen pupilsorstudentsaged16to24= HH_POP_16_24S

**members aged 25 to 64 variable 
gen members_aged_25_to_64= HH_POP_25_64


**members aged 65 and over variable
gen members_aged_65andover= HH_POP_65_MAX

****Number of children in household variable 
gen childreninhoushold = HH_CHILD


**Number of children aged 14 to 15 variable
gen childrenaged14to15= HH_CHILD_14_15


**Number of children aged 5 to 13
gen childrenaged5to13 = HH_CHILD_5_13

**Number of children aged 4 or under variable
gen childrenaged4orunder = HH_CHILD_LE_4


**income
gen income  = .
replace income = 496 if HH_IQ==1
replace income = 496 if HH_IQ==2
replace income = 729 if HH_IQ==3
replace income = 1026 if HH_IQ==4
replace income = 1442 if HH_IQ==5


*survey year
gen syear = 2021

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BPG_DOM  == 1 
replace online_seller_origin = "02E.U sellers" if BPG_EU ==1
replace online_seller_origin = "03outside E.U sellers" if BPG_WRLD ==1
replace online_seller_origin = "04unkown" if BPG_UNK == 1 


**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"

*individualsage 
gen indage = .
replace indage = 2021- YEARBIR if PASSBIR==1
replace indage = 2021- YEARBIR -1 if PASSBIR==2


**variable age categorization
gen age="."
replace age= "16-24" if indage >=16 & indage <=24
replace age= "25-34" if indage >=25 & indage <=34
replace age= "35-44" if indage >=35 & indage <=44
replace age= "45-54" if indage >=45 & indage <=54
replace age= "55-64" if indage >=55 & indage <=64
replace age= "65-74" if indage >=65 & indage <=74


**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if MAINSTAT ==1
replace emplstatus = "02unemployed" if MAINSTAT ==2
replace emplstatus = "03student" if MAINSTAT ==3
replace emplstatus = "04econinactive" if MAINSTAT ==4

*job position
gen jobposition = "."
replace jobposition = "02selfempl"	if STAPRO==1
replace jobposition = "02selfempl" 	if STAPRO==2
replace jobposition = "01salaried" 	if STAPRO==3
replace jobposition = "02selfempl" 	if STAPRO==4
replace jobposition = "03notinuse"	if STAPRO==9

*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5


**individual weighting
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 

*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization age sex emplstatus educlevel indweighting householdgoods medicines apparelandfootwear computerhardware techdevices members_aged_16_to_24 pupilsorstudentsaged16to24 members_aged_25_to_64 members_aged_65andover childrenaged14to15 childrenaged5to13 childrenaged4orunder jobposition freqiuse

save "individual_household_2021.dta", replace 
***********************************

***********************************
*2022
*inidvidual
import excel "2022_ICT_INDFILE_ANONYMIZED.xlsx.xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_REF_ID
save "individual2022.dta", replace 
*household
import excel "2022_ICT_HHFILE with urbanization_ANONYMIZED.xlsx..xlsx", sheet("Φύλλο1") firstrow clear
gen hid = HH_ID
save "household2022.dta", replace 
*merge inidvidual with household file
use "individual2022.dta", replace 
merge 1:1 hid using "household2022.dta"

*frequency of internet use
cap drop freqiuse
gen freqiuse = ""
replace freqiuse = "01daily" 	if IFUS==1
replace freqiuse = "01daily" 	if IFUS==2 
replace freqiuse = "02weekly" 	if IFUS==3
replace freqiuse = "03lessfr" 	if IFUS==4
replace freqiuse = "04never" 	if IFUS==9


*internetconnection variable
gen internetconnection = .
replace internetconnection = 1 if IACC==1
replace internetconnection = 0 if IACC==0

*residence_area variable 
gen residence_area="."
replace residence_area="01North" 		if GEO_NUTS1=="EL6"
replace residence_area="02Central" 	if GEO_NUTS1=="EL5"
replace residence_area="03Attica" 	if GEO_NUTS1=="EL3"
replace residence_area="04Islands" 	if GEO_NUTS1=="EL4"


*household members variable
gen householdmembers = HH_POP

*members aged 16 to 24 variable 
gen members_aged_16_to_24= HH_POP_16_24


*Number of pupils/students aged 16 to 24 variable
gen pupilsorstudentsaged16to24= HH_POP_16_24S

**members aged 25 to 64 variable 
gen members_aged_25_to_64= HH_POP_25_64


**members aged 65 and over variable
gen members_aged_65andover= HH_POP_65_MAX


****Number of children in household variable 
gen childreninhoushold = HH_CHILD

**Number of children aged 14 to 15 variable
gen childrenaged14to15= HH_CHILD_14_15

**Number of children aged 5 to 13
gen childrenaged5to13 = HH_CHILD_5_13

**Number of children aged 4 or under variable
gen childrenaged4orunder = HH_CHILD_LE_4


**income
gen income  = .
replace income = 525 if HH_IQ5==1
replace income = 525 if HH_IQ5==2
replace income = 773 if HH_IQ5==3
replace income = 1087 if HH_IQ5==4
replace income = 1529 if HH_IQ5==5


*survey year
gen syear = 2022

**e-commerce (IBUY) 
gen ecommerce = IBUY

**e-banking (IUBK) 
gen ebanking = IUBK

*Household weight
destring HH_WGHT, replace

**most recent internet use
gen recentnetuse = IU

**phoneorvideocall (IUPH1)
gen phoneorvideocall = IUPH1

*e-seller (IUSELL)
gen eseller = IUSELL

**supplier location
gen online_seller_origin = "."
replace online_seller_origin = "01domestics" if BPG_DOM  == 1 
replace online_seller_origin = "02E.U sellers" if BPG_EU ==1
replace online_seller_origin = "03outside E.U sellers" if BPG_WRLD ==1
replace online_seller_origin = "04unkown" if BPG_UNK == 1 

**urbanization
gen urbanization= "."
replace urbanization="01urban" if URBANIZATION == "1"
replace urbanization="02semiurban" if URBANIZATION == "2"
replace urbanization="03rural" if URBANIZATION == "3"


*individualsage 
gen indage = .
replace indage = 2022- YEARBIR if PASSBIR==1
replace indage = 2022- YEARBIR -1 if PASSBIR==2

**variable age categorization
gen age="."
replace age= "16-24" if indage >=16 & indage <=24
replace age= "25-34" if indage >=25 & indage <=34
replace age= "35-44" if indage >=35 & indage <=44
replace age= "45-54" if indage >=45 & indage <=54
replace age= "55-64" if indage >=55 & indage <=64
replace age= "65-74" if indage >=65 & indage <=74

**individuals sex
generate sex= "."
replace sex= "01man" if SEX == 1
replace sex = "02woman" if SEX ==2

**employment status
gen emplstatus = "."
replace emplstatus = "01employed" if MAINSTAT ==1
replace emplstatus = "02unemployed" if MAINSTAT ==2
replace emplstatus = "03student" if MAINSTAT ==3
replace emplstatus = "04econinactive" if MAINSTAT ==4

*job position
gen jobposition = "."
replace jobposition = "02selfempl"	if STAPRO==1
replace jobposition = "02selfempl" 	if STAPRO==2
replace jobposition = "01salaried" 	if STAPRO==3
replace jobposition = "02selfempl" 	if STAPRO==4
replace jobposition = "03notinuse"	if STAPRO==9

*education level
gen educlevel = "."
replace educlevel = "01low" if ISCED ==0
replace educlevel = "02medium" if ISCED ==3
replace educlevel = "03high" if ISCED ==5

**individual weighting
destring IND_WGHT , replace 
gen indweighting = IND_WGHT

**householdgoods
gen householdgoods = BFURN 

**medicines
gen medicines = BMED 

**apparelandfootwear 
gen apparelandfootwear = BCLOT 

**computerhardware
gen computerhardware = BHARD 

**techdevices
gen techdevices = BEEQU 


*keep variables
keep syear hid internetconnection residence_area HH_WGHT householdmembers childreninhoushold income ecommerce ebanking recentnetuse phoneorvideocall eseller online_seller_origin urbanization sex emplstatus educlevel indweighting age householdgoods medicines apparelandfootwear computerhardware techdevices members_aged_16_to_24 pupilsorstudentsaged16to24 members_aged_25_to_64 members_aged_65andover childrenaged14to15 childrenaged5to13 childrenaged4orunder jobposition freqiuse

save "individual_household_2022.dta", replace 


********************************************************************************
********************************************************************************
********************************************************************************
***Append data 
use 			"individual_household_2009.dta", clear 
append  using 	"individual_household_2010.dta" 
append  using 	"individual_household_2011.dta" 
append  using 	"individual_household_2012.dta" 
append  using 	"individual_household_2013.dta" 
append  using 	"individual_household_2014.dta" 
append  using 	"individual_household_2015.dta" 
append  using 	"individual_household_2016.dta" 
append  using 	"individual_household_2017.dta" 
append  using 	"individual_household_2018.dta" 
append  using 	"individual_household_2019.dta" 
append  using 	"individual_household_2020.dta" 
append  using 	"individual_household_2021.dta" 
append  using 	"individual_household_2022.dta" 
drop if hid==""

********************************************************************************
**Create vars
* frequency if internet use
encode freqiuse, gen(freqiuser)
tab freqiuser, gen(freqiuser_)


**internet use yes/no
gen internetuseD = .
replace internetuseD = 1 if recentnetuse==1
replace internetuseD = 1 if recentnetuse==2
replace internetuseD = 1 if recentnetuse==3
replace internetuseD = 0 if recentnetuse==4

**ecommerce yes/no
tab ecommerce
**ecommerce yes/no
tab ecommerce
gen ecommerceD = .
replace ecommerceD = 1 if ecommerce>=1 & ecommerce<=3
replace ecommerceD = 0 if ecommerce==4
replace ecommerceD = 0 if ecommerce==9

**ebanking yes/no
tab ebanking
gen ebankingD = .
replace ebankingD = 1 if ebanking==1
replace ebankingD = 0 if ebanking==0
replace ebankingD = 0 if ebanking==9


*video calls
gen phoneorvideocallD = phoneorvideocall if phoneorvideocall>=0 & phoneorvideocall<=1


*selling
tab eseller
gen esellerD = .
replace esellerD = 0 if eseller==0
replace esellerD = 1 if eseller==1
replace esellerD = 0 if eseller==9


*supplier location
encode online_seller_origin, gen(online_seller_originN)
tab online_seller_originN, gen(online_seller_originN_)

***products yes\no
*Buy household goods
gen householdgoodsD = .
replace householdgoodsD = 1 if householdgoods==1
replace householdgoodsD = 0 if householdgoods==0
replace householdgoodsD = 0 if householdgoods==9
 

*Buy medical products
gen medicinesD = .
replace medicinesD = 1 if medicines==1
replace medicinesD = 0 if medicines==0 
replace medicinesD = 0 if medicines==9


*Buy apparel and footwear 
gen apparelandfootwearD = .
replace apparelandfootwearD = 1 if apparelandfootwear==1
replace apparelandfootwearD = 0 if apparelandfootwear==0
replace apparelandfootwearD = 0 if apparelandfootwear==9
 


*Buy technical devices
cap drop techdevicesD
gen techdevicesD = .
replace techdevicesD = 1 if computerhardware==1|techdevices==1
replace techdevicesD = 0 if techdevicesD==.


*Age
tab age, gen(age_)
encode age, gen(ageN)

*Gender
tab sex, gen(sex_)
gen female = .
replace female = 0 if sex=="01man"
replace female = 1 if sex=="02woman"

*Education
tab educlevel, gen(educlevel_)
encode educlevel, gen(educlevelN)

*Employment status
tab emplstatus, gen(emplstatus_)
encode emplstatus, gen(emplstatusN)

cap drop emplstatusnew
gen emplstatusnew = ""
replace emplstatusnew = "01employedsala" 	if syear>=2012 & emplstatus=="01employed" & jobposition=="01salaried"
replace emplstatusnew = "02employedself" 	if syear>=2012 & emplstatus=="01employed" & jobposition=="02selfempl"
replace emplstatusnew = "03unemployed" 		if syear>=2012 & emplstatus=="02unemployed" 
replace emplstatusnew = "04student" 		if syear>=2012 & emplstatus=="03student"
replace emplstatusnew = "05econinactive" 	if syear>=2012 & emplstatus=="04econinactive"
tab emplstatusnew, gen(emplstatusnew_)
encode emplstatusnew, gen(emplstatusnewN)

*Presence of children in household
gen presencekids = .
replace presencekids = 0 if childreninhoushold==0
replace presencekids = 1 if childreninhoushold>0 & childreninhoushold<=1000

*Residence area
tab residence_area, gen(residence_area_)
encode residence_area, gen(residence_areaN)


*make logincome
gen logI = log(income)

********************************************************************************
**Summary statistics
***unweighted frequency table 
tab syear

* Table 1 Summary statistics
sum internetuseD freqiuser_1 freqiuser_2 freqiuser_3 freqiuser_4 ///
ecommerceD householdgoodsD apparelandfootwearD medicinesD techdevicesD ///
online_seller_originN_2 online_seller_originN_3 online_seller_originN_4 online_seller_originN_5 ///
esellerD ///
ebankingD age_1 age_2 age_3 age_4 age_5 age_6 sex_1 sex_2 educlevel_1 educlevel_2 educlevel_3 residence_area_1 residence_area_2 residence_area_3 residence_area_4 emplstatus_1 emplstatus_2 emplstatus_3 emplstatus_4 householdmembers presencekids income phoneorvideocallD



** Section 1 Internet Use
* Figure 1 
preserve
collapse (mean) internetuseD freqiuser_1 freqiuser_2 freqiuser_3 freqiuser_4, by(syear)
tw (connected internetuseD syear, sort) (connected freqiuser_1 syear, sort) (connected freqiuser_2 syear, sort) (connected freqiuser_3 syear, sort) , xlab(2009(1)2022, labsize(small)) ylab(0(.1)1, labsize(small) angle(0) format(%4.1f)) yti("Share of inidviduals", size(small)) xti("") legend(order(1 "Internet use" 2 "Daily" 3 "Weekly" 4 "Less frequently") row(1) size(small)) scheme(s1color)
restore


** Section 2 Activities on the Internet (e-commerce)
* A) ebuy eselling
* Figure 2 
preserve
collapse (mean) ecommerceD esellerD, by(syear)
tw (connected ecommerceD syear, sort) (connected esellerD syear, sort), xlab(2009(1)2022, labsize(small)) ylab(0(.1)1, labsize(small) angle(0) format(%4.1f)) yti("Share of inidviduals", size(small)) xti("") legend(order(1 "e-buyer" 2 "e-seller") row(1) size(small)) scheme(s1color)
restore




* B) ebuy by type of goods and services
* Figure 3
preserve
collapse (mean) householdgoodsD apparelandfootwearD medicinesD techdevicesD, by(syear)
tw (connected householdgoodsD syear, sort) (connected apparelandfootwearD syear, sort) (connected medicinesD syear, sort) (connected techdevicesD syear, sort), xlab(2009(1)2022, labsize(small)) ylab(0(.1)1, labsize(small) angle(0) format(%4.1f)) yti("Share of inidviduals", size(small)) xti("") legend(order(1 "Goods" 2 "Clothes" 3 "Medicine" 4 "Electronic") row(1) size(small)) scheme(s1color)
restore

* C) ebuy by origin
* Figure 4
preserve
collapse (mean) online_seller_originN_2 online_seller_originN_3 online_seller_originN_4 online_seller_originN_5 , by(syear)
tw (connected online_seller_originN_2 syear, sort) (connected online_seller_originN_3 syear, sort) (connected online_seller_originN_4 syear, sort) (connected online_seller_originN_5 syear, sort), xlab(2009(1)2022, labsize(small)) ylab(0(.1)1, labsize(small) angle(0) format(%4.1f)) yti("Share of inidviduals", size(small)) xti("") legend(order(1 "Domestic" 2 "EU" 3 "Non-EU" 4 "Unknown") row(1) size(small)) scheme(s1color)
restore


*Section 3 ebanking and evolution (comparison with other activities)

*Table 2 
**the mean of internetuseD for different age groups
tabstat internetuseD ecommerceD ebankingD, by(syear) stats(mean)


****** figure 5. 
preserve
collapse (mean) internetuseD ecommerceD esellerD ebankingD, by(syear)
gen z1 = internetuseD 	if syear==2009
gen z2 = ecommerceD 	if syear==2009
gen z3 = ebankingD 		if syear==2009
egen z1_base = max(z1)
egen z2_base = max(z2)
egen z3_base = max(z3)
gen norm1 = (internetuseD/z1_base)-1
gen norm2 = (ecommerceD/z2_base)-1
gen norm3 = (ebankingD/z3_base)-1
tw (connected norm1 syear, sort) (connected norm2 syear, sort) (connected norm3 syear, sort) , xlab(2009(1)2022, labsize(small)) ylab(-1(0.5)12, labsize(small) angle(0) format(%4.1f)) yti("Relative change (base, 2009)") xti("") yline(0, lcol(black) lpat(dot)) legend(order(1 "Internet use" 2 "e-commerce" 3 "e-banking") row(1)) scheme(s1color)
restore


*figure 6
preserve
collapse (mean) internetuseD ecommerceD esellerD ebankingD, by(syear)
gen z1 = internetuseD 	if syear==2009
gen z2 = ecommerceD 	if syear==2009
gen z3 = esellerD 		if syear==2009
gen z4 = ebankingD 		if syear==2009
egen z1_base = max(z1)
egen z2_base = max(z2)
egen z3_base = max(z3)
egen z4_base = max(z4)
gen norm1 = (internetuseD/z1_base)-1
gen norm2 = (ecommerceD/z2_base)-1
gen norm3 = (esellerD/z3_base)-1
gen norm4 = (ebankingD/z4_base)-1
tw (connected norm1 syear, sort) (connected norm2 syear, sort) (connected norm3 syear, sort)  (connected norm4 syear, sort), xlab(2009(1)2022, labsize(small)) ylab(-1(0.5)12, labsize(small) angle(0) format(%4.1f)) yti("Relative change (base, 2009)") xti("") yline(0, lcol(black) lpat(dot)) legend(order(1 "Internet use" 2 "e-buyer" 3 "e-seller" 4 "e-banking") row(1)) scheme(s1color)
restore








********************************************************************************
**ANALYSIS-ESTIMATION RESULTS

**Regression table 3.

*Model 1 (Internet Use)
probit internetuseD i.ageN i.female i.educlevelN i.emplstatusN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear, rob
margins, dydx(*)


*Model 2 (e-commerce)
probit ecommerceD i.ageN i.female i.educlevelN i.emplstatusN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear, rob
margins, dydx(*)


*Model 3 (e-banking)
probit ebankingD i.ageN i.female i.educlevelN i.emplstatusN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear, rob
margins, dydx(*)

***********************************************************

**Regression table 4.
*Model phoneorvideocall and internet use 
probit phoneorvideocallD i.ageN i.female i.educlevelN i.emplstatusN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear if internetuseD==1, rob
margins, dydx(*)


*Model eseller and internetuse
probit esellerD i.ageN i.female i.educlevelN i.emplstatusN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear if internetuseD==1, rob
margins, dydx(*)

*****************************************************************

**Regression table 5.


*Model householdgoods 
probit householdgoodsD i.ageN i.female i.educlevelN i.emplstatusN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear if ecommerceD==1, rob
margins, dydx(*)


*Model medicines
probit medicinesD i.ageN i.female i.educlevelN i.emplstatusN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear if ecommerceD==1, rob
margins, dydx(*)


*Model apparelandfootwear
probit apparelandfootwearD i.ageN i.female i.educlevelN i.emplstatusN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear if ecommerceD==1, rob
margins, dydx(*)


*Model techdevices
probit techdevicesD i.ageN i.female i.educlevelN i.emplstatusN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear if ecommerceD==1, rob
margins, dydx(*)

****************************************************************

**Regression table 6.

*Model mlogit online_seller_origin
**table 6
mlogit online_seller_originN i.ageN i.female i.educlevelN i.emplstatusN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear if ecommerceD==1 & online_seller_originN>=2 & online_seller_originN<=4, rob
margins, dydx(*) 

mlogit online_seller_originN i.ageN i.female i.educlevelN i.emplstatusnewN c.logI c.householdmembers i.presencekids i.residence_areaN i.syear if syear>=2012 & ecommerceD==1 & online_seller_originN>=2 & online_seller_originN<=4, rob
margins, dydx(*)

