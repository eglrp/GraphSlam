
badscale = 1e-8;

% Create random Jacobian
% A = [
%     badscale.*(rand(3)-.5) zeros(3)   zeros(3,6)
%     zeros(3) badscale.*(rand(3)-.5)   zeros(3,6)
%     rand(3,6)-.5                      zeros(3,6)
%     zeros(2,6)                        badscale.*(rand(2,6)-.5)
%     eye(6)                            -eye(6)
%     ];
% b = [
%     repmat(badscale, 3,1)
%     repmat(badscale, 3,1)
%     repmat(1, 3,1)
%     repmat(badscale, 2,1)
%     repmat(1, 6,1)
%     ];

Acoeffs = [
    1 11 badscale
    (1:10)' (1:10)' -Matrix::Ones(10,1)
    (1:10)' (2:11)' Matrix::Ones(10,1)
    ]';
A = full(sparse(Acoeffs(1,:), Acoeffs(2,:), Acoeffs(3,:)));
b = zeros(size(A,1), 1);

% A = zeros(2*15, 2*10);
% for j = 2:10
%     A(j*2-3 : j*2-2, j*2-3:j*2) = rand(2,4) - 0.5;
% end
% A(19:20, 1:2) = badscale * (rand(2) - 0.5);
% A(21:22, [ 3 4 11 12 ]) = rand(2,4) - 0.5;
% A(23:24, [ 1 2 5 6 ]) = rand(2,4) - 0.5;
% A(25:26, [ 5 6 17 18 ]) = rand(2,4) - 0.5;
% A(27:28, [ 9 10 13 14 ]) = rand(2,4) - 0.5;
% A(29:30, [ 7 8 15 16 ]) = rand(2,4) - 0.5;
% b = zeros(2*15, 1);
% b(1:18) = rand(18,1) - 0.5;
% b(19:20) = badscale * (rand(2,1) - 0.5);
% b(21:30) = rand(10,1) - 0.5;

% Acoeffs = [
%            1            1            1            1            1            1            2            2            2            2            2            3            3            3            3            4            4            4            5            5            6            1            1            1            2            2            2            3            3            3            4            4            4            5            5            5            6            6            6            1            1            1            1            1            1            2            2            2            2            2            2            3            3            3            3            3            3            4            4            4            4            4            4            5            5            5            5            5            5            6            6            6            6            6            6            1            1            1            1            1            1            2            2            2            2            2            2            3            3            3            3            3            3            4            4            4            4            4            4            5            5            5            5            5            5            6            6            6            6            6            6            1            2            3            4            5            6            1            1            1            1            1            1            2            2            2            2            2            2            3            3            3            3            3            3            4            4            4            4            4            4            5            5            5            5            5            5            6            6            6            6            6            6            1            2            3            4            5            6            1            2            3            4            5            6            7            7            7            8            8            9            7            7            7            7            7            7            8            8            8            8            8            8            9            9            9            9            9            9            7            7            7            7            7            7            8            8            8            8            8            8            9            9            9            9            9            9            7            8            9            7            7            7            7            7            7            8            8            8            8            8            8            9            9            9            9            9            9            7            8            9            7            8            9           10           10           10           10           10           10           11           11           11           11           11           12           12           12           12           13           13           13           14           14           15           10           10           10           10           10           10           11           11           11           11           11           11           12           12           12           12           12           12           13           13           13           13           13           13           14           14           14           14           14           14           15           15           15           15           15           15           10           11           12           13           14           15           10           10           10           10           10           10           11           11           11           11           11           11           12           12           12           12           12           12           13           13           13           13           13           13           14           14           14           14           14           14           15           15           15           15           15           15           10           11           12           13           14           15           10           11           12           13           14           15           16           16           16           16           16           16           17           17           17           17           17           18           18           18           18           19           19           19           20           20           21           16           17           18           19           20           21           16           16           16           16           16           16           17           17           17           17           17           17           18           18           18           18           18           18           19           19           19           19           19           19           20           20           20           20           20           20           21           21           21           21           21           21           16           17           18           19           20           21           16           17           18           19           20           21           22           22           22           22           22           22           22           22           22           23           23           23           23           23           23           24           24           24           24           24           25           25           25           25           26           26           26           27           27           28           23           24           25           26           27           28           23           24           25           26           27           28           29           29           30           30           30           31           31           31           32           32           32           33           33           33           33           34           34           34           34           34           35           35           35           35           35           35           36           36           36           36           36           36           37           37           37           37           37           37           38           38           38           38           38           38           39           39           39           39           39           39           40           40           40           40           40           40           41           41           41           41           41           41           42           42           42           42           42           42           43           43           43           43           43           43           44           44           44           44           44           44           30           30           30           31           31           31           32           32           32           33           33           33           33           34           34           34           34           34           35           35           35           35           35           35           36           36           36           36           36           36           37           37           37           37           37           37           38           38           38           38           38           38           39           39           39           39           39           39           40           40           40           40           40           40           41           41           41           41           41           41           42           42           42           42           42           42           43           43           43           43           43           43           44           44           44           44           44           44           33           34           34           35           35           35           36           36           36           37           37           37           38           38           38           39           39           39           40           40           40           41           41           41           42           42           42           43           43           43           44           44           44           36           37           37           38           38           38           39           39           39           40           40           40           41           41           41           42           42           42           43           43           43           44           44           44           30           30           30           31           31           31           32           32           32           33           33           33           33           33           33           34           34           34           34           34           34           35           35           35           35           35           35           36           36           36           36           36           36           37           37           37           37           37           37           38           38           38           38           38           38           39           39           39           39           39           39           40           40           40           40           40           40           41           41           41           41           41           41           42           42           42           42           42           42           43           43           43           43           43           43           44           44           44           44           44           44           39           40           41           42           42           42           43           43           43           44           44           44           30           31           32           33           34           35           36           37           38           39           40           41           42           43           44           45           45           45           46           46           46           47           47           47           48           48           48           48           48           48           49           49           49           49           49           49           50           50           50           50           50           50           45           45           45           46           46           46           47           47           47           48           48           48           49           49           49           50           50           50           45           46           47           48           49           50
%           39           40           41           42           43           44           40           41           42           43           44           41           42           43           44           42           43           44           42           44           42            1            2            3            1            2            3            1            2            3            1            2            3            1            2            3            1            2            3           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15            4            5            6            7            8            9            4            5            6            7            8            9            4            5            6            7            8            9            4            5            6            7            8            9            4            5            6            7            8            9            4            5            6            7            8            9           38           38           38           38           38           38           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           31           31           31           31           31           31           45           45           45           45           45           45            1            2            3            1            3            1           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15            4            5            6            7            8            9            4            5            6            7            8            9            4            5            6            7            8            9           38           38           38           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           31           31           31           45           45           45           10           11           12           13           14           15           10           12           13           14           15           12           13           14           15           13           14           15           13           14           14            4            5            6            7            8            9            4            5            6            7            8            9            4            5            6            7            8            9            4            5            6            7            8            9            4            5            6            7            8            9            4            5            6            7            8            9           38           38           38           38           38           38           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           31           31           31           31           31           31           45           45           45           45           45           45            4            5            6            7            8            9            5            6            7            8            9            6            7            8            9            7            8            9            7            9            7           38           38           38           38           38           38           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           32           33           34           35           36           37           31           31           31           31           31           31           45           45           45           45           45           45           38           32           33           34           35           36           37           31           45           32           33           34           35           36           37           33           34           35           36           37           34           35           36           37           35           36           37           35           36           35           31           31           31           31           31           31           45           45           45           45           45           45           31           45           39           40           41           39           40           41           39           40           41           39           40           41           42           39           40           41           42           43           39           40           41           42           43           44           39           40           41           42           43           44           39           40           41           42           43           44           39           40           41           42           43           44           39           40           41           42           43           44           39           40           41           42           43           44           39           40           41           42           43           44           39           40           41           42           43           44           39           40           41           42           43           44           39           40           41           42           43           44           16           17           18           16           17           18           16           17           18           16           17           18           19           16           17           18           19           20           16           17           18           19           20           21           16           17           18           19           20           21           16           17           18           19           20           21           16           17           18           19           20           21           16           17           18           19           20           21           16           17           18           19           20           21           16           17           18           19           20           21           16           17           18           19           20           21           16           17           18           19           20           21           16           17           18           19           20           21            1            1            2            1            2            3            1            2            3            1            2            3            1            2            3            1            2            3            1            2            3            1            2            3            1            2            3            1            2            3            1            2            3           22           22           23           22           23           24           22           23           24           22           23           24           22           23           24           22           23           24           22           23           24           22           23           24           10           11           12           10           11           12           10           11           12           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           10           11           12           13           14           15           25           26           27           26           27           28           25           27           29           25           26           30           45           45           45           45           45           45           45           45           45           45           45           45           45           45           45            4            5            6            4            5            6            4            5            6            4            5            6            7            8            9            4            5            6            7            8            9            4            5            6            7            8            9           16           17           18           16           17           18           16           17           18           19           20           21           19           20           21           19           20           21           45           45           45           45           45           45
%      2287.81  -4.4988e-05   0.00396445  -0.00100866      6.88479    -0.382977      2287.81   -0.0282353     -6.88394 -0.000338518    -0.210359      2287.43     0.384701     0.211465 -0.000303552     0.409179      574.421     -0.33448    -0.086675      573.083      572.434  0.000175554     -1.36517      0.05849      1.36507  0.000112365    0.0189909    -0.058652   -0.0188071  3.14326e-05   -0.0247666     -71.2266    0.0198345   0.00567252   -0.0219283     -71.2443     -71.2327      0.02605  -0.00547148      42.1211      427.311     -13.0572    0.0738133   -0.0064156    0.0071859      425.771     -40.7137      40.8349  -0.00719115   -0.0660657    0.0058001     -39.2512      16.9899      430.388  -0.00195469  -0.00782391  3.41702e-05     0.532335     -0.69246     -1.01117     -0.51164    0.0871608  0.000338874   -0.0645723     -1.86503    0.0118343    -0.184545   0.00037516    -0.353041     -5.38585     0.256705      2.13342   -0.0527851    -0.910563   0.00685038     -2288.11    -0.319849      1.49778   0.00131762     -6.68744     0.436231     0.318124     -2288.11      1.17676      6.68538 -0.000179114     0.288793     -1.53826     -1.20334     -2289.06    -0.435568    -0.295666  0.000650458     -8.20257  -0.00495529     -1.40144     -1.19995     -721.834     0.999144    0.0115191      1.39146   0.00206421     0.241407     0.578931     -715.253  -0.00426102      8.23871    0.0319042     -712.673    -0.687971     0.134907  1.78921e-05 -0.000506192  -0.00661338   0.00136493  0.000168206  -0.00104316     0.819305    0.0028821   0.00347505 -0.000315376    -0.197366   -0.0521121   0.00209998     0.830532    0.0283978     0.198642  0.000553189   -0.0787171   0.00964912    0.0871257      1.43774    0.0514481    0.0844689 -0.000378355      -3.5015    -0.389049    -0.260307     0.791191      147.416    -0.664512      -5.2737     0.465659    -0.142763    -0.154666    -0.578578      142.184      0.51651      7.02367      3.46957      140.242     0.689716    -0.134755   0.00138855  -0.00029297 -4.60677e-07 -5.85457e-06   0.00341196 -1.84581e-07    -0.169162    -0.143293    -0.103757     0.971775     -9.55431     -17.9962    0.0254247      37.4517   -0.0209152  -0.00499967      37.3707      37.3282      1.62285       10.577     -1.26238     -10.5926      1.04948    -0.975285    -0.167226     -2.22364     0.016771     0.755791    -0.415351     -10.4962     -16.5666      1.33474      1.44369     -1.04654     -11.0613     0.329368     -101.978   -0.0119957     -0.19074    -0.671635     -143.392     0.564983      1.84747     0.281797   0.00213787      0.13017     0.483793     -138.977    0.0625116      102.371     -1.91922     -137.339    -0.576069     0.111915   0.00133071  0.000165007  -0.00101693     -3.36239    -0.383114    -0.255928     0.672042      143.394    -0.564846     -5.15865     0.455748    -0.139196    -0.130105    -0.483446      138.993     0.507372      6.83154       3.4007      137.342     0.577777    -0.111759  3.88677e-05   0.00503247   9.4483e-06      2.00827     0.481391     -16.6988      1.36255      2075.39     -21.4475      18.6028     0.118129     0.928177      2065.47      16.8895   -0.0624046     -21.3263     0.313145       1618.3    -0.696466      1.66511     -0.11786     -2.34839      1.47139      121.564      83.1783    -0.597982      73.8588      453.099     -43.4199      16.1018    -0.292859     -1.68581     0.851333      44.5456      454.444     -37.9494      4.16356    -0.404957    0.0926619     -10.0948      45.2476      595.572     -1.03824     0.501659   0.00710507     -3.69312    -0.816079      0.57251     0.184137    -0.868655     -11.6822      -105.54      10.8294      1.39689     -1.49873     -15.7957       2.6502      12.1566      136.446     -25.4427     -11.7228      1.02809    -0.247507    0.0527668   -0.0277195      2.42197   0.00384665       0.0175     -0.11796     -230.563      20.5743     -15.8678     0.290267      1.68717    -0.781925     -21.9179     -231.021      30.1778     -4.17005     0.402651    -0.090854      1.80197     -56.0322     -523.372     0.824811    -0.599641   0.00201121      9.98286      2.35013     -1.08981    -0.184251     0.869351      11.6984      241.842     -24.8713     -1.73038        1.499      15.7958     -3.17923     -25.6167     -278.632      43.9887      11.7484     -1.01758     0.256927 -0.000173169  2.83811e-05  9.31621e-06  0.000454237  7.52262e-06  2.70158e-05   -0.0648002     0.440784      0.41821    0.0812547     0.126035     -1.56364      1843.62    -0.355824     0.475767   -0.0805948    -0.858259     0.108379       1840.7     -3.01662   -0.0919503    0.0980639   -0.0266571      1805.55     0.218566    -0.130812  -0.00462006      5.98526       80.031     -4.44405     -1.46989      59.0592      41.4861   0.00282623   -0.0446192    -0.829691   -0.0244541  -0.00583518    0.0593599     -1893.05      3.19006      2.79399    0.0800716      0.85747    -0.153214     -2.60826     -1888.14     -1.83865    0.0969816   -0.0957967    0.0293474     -1.92619      10.3398     -1829.97    -0.145453     0.164351   0.00145373     -127.296      4.93098      2.88018     -5.98846     -80.0564       4.3375      85.9339     -8.44532      2.98893      1.46887  -0.00670723     -59.1236      8.97193      156.679     -79.0075     -41.5417   -0.0308801   -0.0062731   0.00357702 -0.000757383 -6.11439e-06 -0.000114653    0.0662806     0.002298    -0.722071    -0.400598      1.91164    -0.489896    -0.344824      5.17743      40.7839     0.532611      3.60743      25.5863    0.0328058    0.0141742   -0.0014014  4.48646e-06   -0.0900153      290.386      -9.1978     0.557336  -0.00363946   0.00815145     0.312402      235.477      10.5406   -0.0359198   -0.0205744   -0.0212263       58.598     -0.34321    -0.237419    0.0151755 -0.000827825  -0.00378382      2.31215    0.0865428     0.827867      0.20952    0.0112224  -0.00668525  0.000451993      1.89268   0.00939462   0.00482704     0.134508    0.0547661    -0.020441    0.0974203   0.00357506   -0.0250199     0.890056    0.0225332       985.69      9895.62     -941.069      9934.27     -947.837      438.528     -345.132      979.184      9934.92    0.0177665     -3278.68     -770.121  4.76668e+06      3278.67    -0.120885     -457.249 -2.58439e-08  4.76668e+06      770.408      457.656     0.061764  1.12683e-07  -1.7931e-07  4.76668e+06    -0.270455      50118.6      11772.3 -7.34779e+07 -3.98573e-07  1.73731e-06     -50118.6       1.8402      6989.65  9.42908e-05 -7.34779e+07 -2.76405e-06     -11776.6     -6995.85    -0.940215 -0.000410931  0.000654026 -7.34779e+07   0.00811404    0.0814525  -0.00774224   -0.0184803   0.00213952    0.0031555    0.0817713  -0.00780125   0.00360709   0.00162103    0.0188445   0.00408996  -0.00284278   0.00806293    0.0817643  -0.00621093  -0.00338433  0.000119026     0.419025   -0.0483669   -0.0697953        62.59      628.316     -59.4554   -0.0366686    -0.427595   -0.0953231      630.753     -60.2293       27.513     0.143285    0.0747974   -0.0024126     -21.6107      61.8457      630.826     -985.806     -9896.05      936.399     -9934.43      948.627     -433.306      340.347     -974.044     -9935.59 -2.78565e-08    -0.062348   -0.0143053 -4.76668e+06    0.0623481 -6.59641e-09  -0.00898977  2.58439e-08 -4.76668e+06    0.0143052   0.00898972 -1.46467e-09 -1.12683e-07   1.7931e-07 -4.76668e+06 -8.57766e-07    -0.961089    -0.220515  7.34779e+07  3.98573e-07 -1.73731e-06     0.961089  -2.0349e-07    -0.138577 -9.42908e-05  7.34779e+07  2.76405e-06     0.220513     0.138576 -4.46106e-08  0.000410931 -0.000654026  7.34779e+07  -0.00811302   -0.0814432   0.00770657    0.0184803  -0.00213952   -0.0031555    -0.081759   0.00780704  -0.00356616  -0.00162103   -0.0188445  -0.00408996   0.00280111  -0.00801639   -0.0817685   0.00621093   0.00338433 -0.000119026 -8.10789e-06  9.38675e-07  1.38443e-06       -62.59     -628.316      59.4554  7.11197e-07  8.26764e-06  1.79441e-06     -630.753      60.2293      -27.513 -2.72494e-06 -1.48482e-06  5.22212e-08      21.6107     -61.8457     -630.826      47771.6 -2.59008e-10      47771.6  1.12931e-09 -1.79705e-09      47771.6      -733309  -3.9945e-09  1.74113e-08  9.41006e-07      -733309 -2.77013e-08 -4.10102e-06  6.52706e-06      -733309 -0.000184427  2.13517e-05  3.14908e-05  1.61773e-05  0.000188061  4.08163e-05 -6.19829e-05 -3.37744e-05  1.18784e-06     0.624637      6.27048    -0.593354       6.2948    -0.601077     0.274575    -0.215671     0.617209      6.29553     -3086.07  3.97695e-09     -3086.07 -1.73321e-08  2.75852e-08     -3086.07 -7.82805e-07  9.06276e-08  1.33663e-07  6.86649e-08  7.98228e-07  1.73246e-07 -2.63088e-07 -1.43356e-07  5.04181e-09   0.00263989    0.0265008  -0.00250768    0.0266035  -0.00254032   0.00116043 -0.000911485   0.00260849    0.0266066      -100.11  -0.00525915    0.0104726   0.00525634      -100.11   -0.0198017    -0.010474    0.0198009      -100.11      10.6086    -0.926696      3.62993      23.5951      238.077     -8.18077     -1.22287     -10.8263      1.89393      237.153     -22.6991      23.4062     -1.76825     -2.41457   -0.0616879     -22.5028      10.4116      238.096     -161.492      14.1068     -55.2574     -360.667     -3639.18      125.049      18.6154      164.806     -28.8309     -3625.05      346.972      -357.78      26.9175      36.7563     0.939047      343.971     -159.148     -3639.47      50763.9 -4.58354e-08  7.43348e-08  7.10928e-11 -9.18489e-07  1.98151e-07  4.02735e-08      50763.9 -1.55537e-07   9.1844e-07  1.58394e-10   2.9156e-07 -1.00279e-07  1.72814e-07      50763.9 -1.97996e-07 -2.91353e-07 -1.33878e-11  1.60884e-07  -0.00139147  0.000294349      7445.41  4.16547e-06  7.97843e-06   0.00139139  2.30892e-07  0.000450336 -4.16447e-06      7445.41 -3.96088e-06 -0.000294243 -0.000450105  -4.7114e-08 -7.97896e-06  3.95983e-06      7445.41     -50763.9     -50763.9     -50763.9 -1.12348e-10  2.42225e-11     -7445.37  1.12348e-10  3.56335e-11     -7445.37 -2.42227e-11 -3.56336e-11     -7445.37  -0.00232162   -0.0203921   0.00249018      189.099      110.397      2413.45     -2914.92     -1701.78     -37202.7   0.00097994   0.00717406 -0.000488044    0.0246177    0.0377841     0.344154     -1.54581     -15.6714      1.35709     -15.7297      1.51248    -0.506767     0.181799     -1.37928     -12.9303     0.136706  -0.00229078     0.129264      1.93686      19.6358      -1.7004     -0.81197       2.8464      33.6954      21.0979     -2.04157     0.680863     -50.1689      4.57108     -2.05442     -1.10037      2.09288      31.5276      1.54581      15.6714     -1.35709      15.7297     -1.51248     0.506767    -0.181799      1.37928      12.9303     -1.93686     -19.6358       1.7004     -21.0979      2.04157    -0.680863      1.10037     -2.09288     -31.5276    -0.178415    -0.124054    0.0255782     -1.21786     0.101649      1.09042
% ];
% Ab = sparse(Acoeffs(1,:), Acoeffs(2,:), Acoeffs(3,:));
% A = full(Ab(:,1:end-1));
% b = full(Ab(:,end));

% Solve with MATLAB
x_true = A \ b;

% Form Hessian
L = A'*A;
l = A'*b;

% Eliminate badly-conditioned system.  Use this custom choleskyNaive function
% that does no internal pivoting or scaling to simulate the case where the
% bad conditioning occurs between fronts.
R = choleskyNaive(L);
if isempty(R)
    fprintf('Cholesky failed on badly-scaled system with a negative pivot\n');
else
    clear opts
    opts.LT = true;
    d = linsolve(R', l, opts);

    % Solve badly-conditioned system.
    clear opts
    opts.UT = true;
    x = linsolve(R, d, opts);
    
    % Compute error
    fprintf('Solution error with Cholesky on badly-scaled system: %g\n', ...
        max(abs(x - x_true)));
end

% Form scaled system from Jacobian
% Aqr = [
%     A(1:9, :)
%     -eye(6) eye(6) ];
% Si = full(qr(sparse(Aqr)));
% Si = Si(1:size(Si,2), :);
% S = eye(size(Si,1)) / Si;

S = eye(size(A,2));

% Aqr = [
%     A(19:20, :)
%     -eye(6) eye(6) ];

% Aqr = A(1:20, :);
% Si = full(qr(sparse(Aqr)));
% Si = Si(1:size(Si,2), :);
% S = eye(size(Si,1)) / Si;

% bandwidth = 6;
% Lchol = diag(diag(L));
% for i = 1:bandwidth
%     Lchol = Lchol + diag(diag(L,i),i) + diag(diag(L,-i),-i);
% end
% Si = chol(Lchol);
% S = inv(Si);

%Si = diag(sqrt(diag(L)));
% S = [
%    eye(6) zeros(6)
%    eye(6) eye(6) ];
Ap = A * S;
Lp = Ap'*Ap;
lp = Ap'*b;

% Eliminate scaled system
Rp = choleskyNaive(Lp);
if isempty(Rp)
    fprintf('Cholesky failed on scaled system with a negative pivot\n');
else
    clear opts
    opts.LT = true;
    dp = linsolve(Rp', lp, opts);

    % Solve rescaled system.
    clear opts
    opts.UT = true;
    xp = S * linsolve(Rp, dp, opts);
    
    % Compute error
    fprintf('Solution error with Cholesky from rescaled Jacobian: %g\n', ...
        max(abs(xp - x_true)));
end


% Form scaled system from Hessian
Lph = S' * (L * S);
lph = S' * l;

% Eliminate scaled system
Rph = choleskyNaive(Lph);
if isempty(Rph)
    fprintf('Cholesky failed on scaled system with a negative pivot\n');
else
    clear opts
    opts.LT = true;
    dph = linsolve(Rph', lph, opts);

    % Solve rescaled system.
    clear opts
    opts.UT = true;
    xph = S * linsolve(Rph, dph, opts);
    
    % Compute error
    fprintf('Solution error with Cholesky from rescaled Hessian: %g\n', ...
        max(abs(xph - x_true)));
end
