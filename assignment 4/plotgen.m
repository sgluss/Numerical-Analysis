%   h = 0.1 from 0.0 to 1.2
eulers1Data = [-1.0,-1.0,-0.605215823956,0.184352528131,1.21285051061,2.16856903216,2.64547336423,2.26626095773,0.842657528898,-1.47562986484,-4.1265851168,-6.19498504843,-6.63427447485];
%   h = 0.05 from 0.0 to 1.2
eulers2Data = [-1.0,-1.0,-0.901303955989,-0.703911867967,-0.417564645038,-0.0617441054081,0.335288412806,0.738414829965,1.10844960718,1.40560576183,1.59336232527,1.64239116058,1.53416143771,1.26383420458,0.84209130666,0.295612972468,-0.333976442388,-0.992741688184,-1.61854478032,-2.14636819512,-2.51444764304,-2.67068904111,-2.57876440394,-2.22325332363,-1.61322839821];
%   h = 0.01 from 0.0 to 1.2 inclusive
eulers3Data = [-1.0,-1.0,-0.99605215824,-0.988156474719,-0.976328534892,-0.960599509668,-0.941016093883,-0.917640383238,-0.890549689961,-0.859836297657,-0.825607156098,-0.787983516896,-0.747100511285,-0.70310667144,-0.656163396997,-0.606444368674,-0.554134911091,-0.499431307104,-0.442540066174,-0.383677149474,-0.32306715462,-0.260942463092,-0.19754235356,-0.133112084475,-0.067901949437,-0.00216630895334,0.063837397682,0.129849656562,0.195609895498,0.260857508537,0.325332884662,0.388778436621,0.450939625832,0.511565979295,0.570412094472,0.627238628113,0.681813265067,0.733911663171,0.783318370394,0.829827710504,0.873244633641,0.913385528288,0.950078991303,0.983166552786,1.01250335275,1.03795876674,1.05941697772,1.07677749172,1.08995559514,1.09888275142,1.10350693547,1.10379290432,1.09972240239,1.09129430075,1.07852466908,1.0614467802,1.04011104659,1.01458488905,0.98495253769,0.951314765734,0.913788557018,0.872506708142,0.827617366641,0.779283506721,0.727682344399,0.673004694106,0.615454269066,0.55524692799,0.492609870848,0.427780786697,0.361006956726,0.292544315901,0.222656476736,0.151613718904,0.0796919485354,0.00717163119568,-0.0656632973465,-0.138526538354,-0.211130551054,-0.283187682901,-0.354411304741,-0.424516946421,-0.493223428352,-0.560253984553,-0.625337372707,-0.688208966784,-0.748611827867,-0.806297748851,-0.861028268799,-0.912575652822,-0.960723833489,-1.00526930988,-1.04602200061,-1.08280604717,-1.1154605644,-1.14384033469,-1.16781644319,-1.18727685105,-1.20212690438,-1.21228977658,-1.21770684198,-1.21833797918,-1.21416180246,-1.20517582018,-1.19139651924,-1.17285937487,-1.14961878556,-1.12174793303,-1.08933856746,-1.05250071854,-1.01136233335,-0.966068841856,-0.916782651913,-0.863682575053,-0.806963185354,-0.746834113517,-0.683519278719,-0.617256061018,-0.548294417365,-0.476895944458,-0.403332891953];
%   h = 0.1 from 0.0 to 1.2
rk4Data = [-1,-0.838753563016,-0.346725610649,0.30768688672,0.88377645842,1.1563041413,1.0026495657,0.455934688204,-0.298265086431,-0.983764556069,-1.33402472324,-1.19476078146,-0.589767360299];

%   create appropriate xVal vectors
tValsEulers1 = linspace(0,1.2,size(eulers1Data,2));
tValsEulers2 = linspace(0,1.2,size(eulers2Data,2));
tValsEulers3 = linspace(0,1.2,size(eulers3Data,2));
tValsRK4 = linspace(0,1.2,size(rk4Data,2));

%   define x(t) = -cos(2pi * t)
x1 = -cos(2 * pi * tValsEulers1);
x2 = -cos(2 * pi * tValsEulers2);
x3 = -cos(2 * pi * tValsEulers3);

%   generate figure for plots
figure('Position', [0, 0, 1280, 720]);
plot(tValsEulers3,x3);
hold on;
plot(tValsEulers1,eulers1Data);
plot(tValsEulers2,eulers2Data);
plot(tValsEulers3,eulers3Data);
plot(tValsRK4,rk4Data);
title('Comparing Solution to Eulers and RK4 approximations')
xlabel('t');
ylabel('x(t)');
legend('x(t) = -cos(2pi * t)','Eulers with h=0.1','Eulers with h=0.05','Eulers with h=0.01','RK4 with h=0.1',...
    'Location','southwest');

%   plot error data
figure('Position', [0, 0, 1280, 720]);
plot(tValsEulers1,abs(x1 - eulers1Data));
hold on;
plot(tValsEulers2,abs(x2 - eulers2Data));
plot(tValsEulers3,abs(x3 - eulers3Data));
plot(tValsRK4,abs(x1 - rk4Data));
title('Errors of Eulers and RK4 approximations')
xlabel('t');
ylabel('error from x(t) = -cos(2pi * t)');
legend('Eulers with h=0.1','Eulers with h=0.05','Eulers with h=0.01','RK4 with h=0.1',...
    'Location','northwest');