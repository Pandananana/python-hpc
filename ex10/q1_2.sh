#!/bin/bash

nsys profile -o q1_1 python q1_1.py 4000000


#  Time (%)  Total Time (ns)  Num Calls   Avg (ns)     Med (ns)    Min (ns)  Max (ns)   StdDev (ns)           Name         
#  --------  ---------------  ---------  -----------  -----------  --------  ---------  -----------  ----------------------
#      39.0        768980697          2  384490348.5  384490348.5   3812865  765167832  538359260.1  sem_wait              
#      37.6        739743938         22   33624724.5    2785426.5      2895  138211494   47176187.2  poll                  
#      17.1        335985448        660     509068.9     284046.0      2708    2688978     634840.7  open64                
#       4.9         95680084        792     120808.2      13951.5      1034   44657774    1596918.0  ioctl                 
#       0.6         11380098        662      17190.5       4680.5      1002    2014069      81392.7  read                  
#       0.3          5555779        250      22223.1       2795.0      1983    3733650     236197.7  mmap64                
#       0.1          2736383         42      65152.0       5289.5      2419     644535     153791.2  fopen                 
#       0.1          2025043          8     253130.4       5473.0      4074    1773429     618472.0  fopen64               
#       0.1          2003542         37      54149.8       2438.0      1464    1899184     311750.3  fclose                
#       0.1          1137989         26      43768.8       1085.0      1001     558252     150582.4  fcntl                 
#       0.1          1042527        172       6061.2       5536.0      3676      19515       2304.8  munmap                
#       0.0           649174          4     162293.5      65785.5     56350     461253     199359.1  pthread_create        
#       0.0           592374         60       9872.9       8524.5      1099      75805       8958.5  fgets                 
#       0.0           445735         24      18572.3      10397.5      3096     127022      30161.3  mmap                  
#       0.0           404972          7      57853.1       5219.0      2315     362354     134379.9  fread                 
#       0.0           371950         14      26567.9      27970.0     12325      58674      11329.0  sem_timedwait         
#       0.0           259581          7      37083.0       5869.0      2534     226787      83669.2  open                  
#       0.0           139521          1     139521.0     139521.0    139521     139521          0.0  pthread_cond_wait     
#       0.0            75951         20       3797.6       3269.5      2409       6597       1330.6  write                 
#       0.0            27038          4       6759.5       6288.0      5422       9040       1600.7  pthread_cond_signal   
#       0.0            25608          3       8536.0       9749.0      4005      11854       4062.7  pipe2                 
#       0.0            18196          2       9098.0       9098.0      7136      11060       2774.7  socket                
#       0.0            10620          1      10620.0      10620.0     10620      10620          0.0  connect               
#       0.0             8710          2       4355.0       4355.0      2628       6082       2442.3  pthread_cond_broadcast
#       0.0             5344          3       1781.3       1694.0      1171       2479        658.4  sigaction             
#       0.0             4790          2       2395.0       2395.0      1793       2997        851.4  fwrite                
#       0.0             2657          1       2657.0       2657.0      2657       2657          0.0  bind                  
#       0.0             2239          1       2239.0       2239.0      2239       2239          0.0  mprotect              
#       0.0             1623          1       1623.0       1623.0      1623       1623          0.0  pthread_mutex_trylock 
#       0.0             1310          1       1310.0       1310.0      1310       1310          0.0  listen                

# Processing [q1_1.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/cudaapisum.py]... 

#  ** CUDA API Summary (cudaapisum):

#  Time (%)  Total Time (ns)  Num Calls  Avg (ns)   Med (ns)   Min (ns)  Max (ns)  StdDev (ns)           Name         
#  --------  ---------------  ---------  ---------  ---------  --------  --------  -----------  ----------------------
#      47.9         17388530          5  3477706.0  3468599.0   3447647   3550565      42045.9  cuMemcpyHtoD_v2       
#      46.5         16863433         10  1686343.3  1519163.0     23422   3894544    1709104.0  cuMemcpyDtoH_v2       
#       3.0          1091805          6   181967.5   173445.0    157579    222836      24157.2  cuMemAlloc_v2         
#       1.1           415435          1   415435.0   415435.0    415435    415435          0.0  cuModuleLoadDataEx    
#       0.4           162848          1   162848.0   162848.0    162848    162848          0.0  cuLinkComplete        
#       0.3           108193          5    21638.6    18720.0     16631     30606       5707.2  cuLaunchKernel        
#       0.3           102345        384      266.5      208.0       138      4660        251.7  cuGetProcAddress      
#       0.2            83783          1    83783.0    83783.0     83783     83783          0.0  cuLinkCreate_v2       
#       0.1            50266          1    50266.0    50266.0     50266     50266          0.0  cuMemGetInfo_v2       
#       0.0             4904          1     4904.0     4904.0      4904      4904          0.0  cuCtxSynchronize      
#       0.0             3870          1     3870.0     3870.0      3870      3870          0.0  cuInit                
#       0.0             1310          1     1310.0     1310.0      1310      1310          0.0  cuLinkDestroy         
#       0.0              328          1      328.0      328.0       328       328          0.0  cuDeviceGetUuid_v2    
#       0.0              226          1      226.0      226.0       226       226          0.0  cuModuleGetLoadingMode

# Processing [q1_1.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpukernsum.py]... 

#  ** CUDA GPU Kernel Summary (gpukernsum):

#  Time (%)  Total Time (ns)  Instances  Avg (ns)  Med (ns)  Min (ns)  Max (ns)  StdDev (ns)      GridXYZ          BlockXYZ                                                     Name                                                
#  --------  ---------------  ---------  --------  --------  --------  --------  -----------  ----------------  --------------  ----------------------------------------------------------------------------------------------------
#      87.5           202943          1  202943.0  202943.0    202943    202943          0.0  125000    1    1    32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       5.4            12576          1   12576.0   12576.0     12576     12576          0.0  3907    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       2.4             5472          1    5472.0    5472.0      5472      5472          0.0     4    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       2.4             5472          1    5472.0    5472.0      5472      5472          0.0   123    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       2.3             5344          1    5344.0    5344.0      5344      5344          0.0     1    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…

# Processing [q1_1.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpumemtimesum.py]... 

#  ** GPU MemOps Summary (by Time) (gpumemtimesum):

#  Time (%)  Total Time (ns)  Count  Avg (ns)   Med (ns)   Min (ns)  Max (ns)  StdDev (ns)      Operation     
#  --------  ---------------  -----  ---------  ---------  --------  --------  -----------  ------------------
#      54.2         16414010      5  3282802.0  3278885.0   3249221   3342757      35763.9  [CUDA memcpy HtoD]
#      45.8         13878733     10  1387873.3  1281525.0      2816   3072455    1450877.5  [CUDA memcpy DtoH]

# Processing [q1_1.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpumemsizesum.py]... 

#  ** GPU MemOps Summary (by Size) (gpumemsizesum):

#  Total (MB)  Count  Avg (MB)  Med (MB)  Min (MB)  Max (MB)  StdDev (MB)      Operation     
#  ----------  -----  --------  --------  --------  --------  -----------  ------------------
#      81.016     10     8.102     8.250     0.000    16.000        8.328  [CUDA memcpy DtoH]
#      80.000      5    16.000    16.000    16.000    16.000        0.000  [CUDA memcpy HtoD]