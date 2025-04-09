#!/bin/bash

nsys profile -o q1_3 python q1_3.py 4000000


#  ** OS Runtime Summary (osrtsum):

#  Time (%)  Total Time (ns)  Num Calls   Avg (ns)     Med (ns)    Min (ns)  Max (ns)   StdDev (ns)           Name         
#  --------  ---------------  ---------  -----------  -----------  --------  ---------  -----------  ----------------------
#      43.0        946795010          2  473397505.0  473397505.0   3736597  943058413  664200825.8  sem_wait              
#      42.7        939775444         24   39157310.2    3530555.0      2833  138022094   48227862.7  poll                  
#       8.3        183404233        662     277045.7     273898.0      2859    2434591     163340.6  open64                
#       4.5         98499773        776     126932.7      14538.0      1037   43143984    1560184.9  ioctl                 
#       0.4          9335165        670      13933.1       4452.5      1000     454719      28546.2  read                  
#       0.4          7839296         46     170419.5       7482.0      2463    2349712     430737.9  fopen                 
#       0.3          5896469        252      23398.7       2412.5      1971    3936534     248086.9  mmap64                
#       0.1          3204572         32     100142.9       1350.5      1007     593832     209542.0  fcntl                 
#       0.1          2249685         40      56242.1       2387.5      1436    1202272     225240.1  fclose                
#       0.1          1148204         14      82014.6      24422.0     13546     853963     222247.9  sem_timedwait         
#       0.0           977811        172       5684.9       3846.5      3602     138679      12229.7  munmap                
#       0.0           873189          9      97021.0      10566.0      3403     322296     135415.7  fread                 
#       0.0           614669          4     153667.3      62440.0     57456     432333     185823.7  pthread_create        
#       0.0           606971         61       9950.3       8789.0      1097      74122       8697.3  fgets                 
#       0.0           501675          8      62709.4       7856.5      3870     278607     106344.1  fopen64               
#       0.0           376012         22      17091.5      10329.0      2645     105842      21807.6  mmap                  
#       0.0           246871          7      35267.3       5309.0      2451     214728      79156.9  open                  
#       0.0           141730          1     141730.0     141730.0    141730     141730          0.0  pthread_cond_wait     
#       0.0            81342         19       4281.2       4039.0      2461       8038       1364.7  write                 
#       0.0            42452          5       8490.4       4164.0      2568      18575       7512.5  fwrite                
#       0.0            22377          3       7459.0       8944.0      4398       9035       2651.3  pipe2                 
#       0.0            22334          2      11167.0      11167.0      9931      12403       1748.0  socket                
#       0.0            12795          1      12795.0      12795.0     12795      12795          0.0  connect               
#       0.0             7058          1       7058.0       7058.0      7058       7058          0.0  pthread_cond_broadcast
#       0.0             6929          1       6929.0       6929.0      6929       6929          0.0  pthread_cond_signal   
#       0.0             6824          1       6824.0       6824.0      6824       6824          0.0  mprotect              
#       0.0             5912          1       5912.0       5912.0      5912       5912          0.0  fflush                
#       0.0             4900          2       2450.0       2450.0      1982       2918        661.9  sigaction             
#       0.0             3308          3       1102.7       1064.0      1010       1234        116.9  dup                   
#       0.0             2931          1       2931.0       2931.0      2931       2931          0.0  bind                  
#       0.0             1394          1       1394.0       1394.0      1394       1394          0.0  listen                

# Processing [q1_3.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/cudaapisum.py]... 

#  ** CUDA API Summary (cudaapisum):

#  Time (%)  Total Time (ns)  Num Calls  Avg (ns)   Med (ns)   Min (ns)  Max (ns)  StdDev (ns)           Name         
#  --------  ---------------  ---------  ---------  ---------  --------  --------  -----------  ----------------------
#      60.8          6942857          1  6942857.0  6942857.0   6942857   6942857          0.0  cuMemcpyHtoD_v2       
#      21.0          2395946          2  1197973.0  1197973.0    320289   2075657    1241232.6  cuModuleLoadDataEx    
#       4.7           540062          2   270031.0   270031.0    266711    273351       4695.2  cuMemAlloc_v2         
#       3.4           392985          1   392985.0   392985.0    392985    392985          0.0  cuMemcpyDtoH_v2       
#       3.0           344373          2   172186.5   172186.5    166620    177753       7872.2  cuLinkComplete        
#       2.4           276206          4    69051.5    65178.5      3262    142587      59875.6  cuStreamSynchronize   
#       1.5           166273          2    83136.5    83136.5     82107     84166       1455.9  cuLinkCreate_v2       
#       1.4           161125          9    17902.8    13641.0      8281     50301      13071.0  cuLaunchKernel        
#       0.8            95145        384      247.8      200.5       134      3724        202.1  cuGetProcAddress      
#       0.7            83564          1    83564.0    83564.0     83564     83564          0.0  cuMemGetInfo_v2       
#       0.1            13341          1    13341.0    13341.0     13341     13341          0.0  cuCtxSynchronize      
#       0.0             3780          2     1890.0     1890.0      1475      2305        586.9  cuLinkDestroy         
#       0.0             3599          1     3599.0     3599.0      3599      3599          0.0  cuInit                
#       0.0              331          1      331.0      331.0       331       331          0.0  cuDeviceGetUuid_v2    
#       0.0              301          1      301.0      301.0       301       301          0.0  cuModuleGetLoadingMode

# Processing [q1_3.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpukernsum.py]... 

#  ** CUDA GPU Kernel Summary (gpukernsum):

#  Time (%)  Total Time (ns)  Instances  Avg (ns)  Med (ns)  Min (ns)  Max (ns)  StdDev (ns)      GridXYZ          BlockXYZ                                                     Name                                                
#  --------  ---------------  ---------  --------  --------  --------  --------  -----------  ----------------  --------------  ----------------------------------------------------------------------------------------------------
#      82.9           201886          1  201886.0  201886.0    201886    201886          0.0  125000    1    1    32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       5.0            12064          1   12064.0   12064.0     12064     12064          0.0  3907    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       2.7             6656          2    3328.0    3328.0      2976      3680        497.8     1    1    1    1024    1    1  cudapy::numba::cuda::cudadrv::devicearray::_assign_kernel::_3clocals_3e::kernel[abi:v2,cw51cXTLSUwv…
#       2.2             5376          1    5376.0    5376.0      5376      5376          0.0   123    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       2.0             4767          1    4767.0    4767.0      4767      4767          0.0   123    1    1    1024    1    1  cudapy::numba::cuda::cudadrv::devicearray::_assign_kernel::_3clocals_3e::kernel[abi:v2,cw51cXTLSUwv…
#       1.8             4385          1    4385.0    4385.0      4385      4385          0.0     1    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       1.7             4224          1    4224.0    4224.0      4224      4224          0.0     4    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       1.7             4032          1    4032.0    4032.0      4032      4032          0.0     4    1    1    1024    1    1  cudapy::numba::cuda::cudadrv::devicearray::_assign_kernel::_3clocals_3e::kernel[abi:v2,cw51cXTLSUwv…

# Processing [q1_3.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpumemtimesum.py]... 

#  ** GPU MemOps Summary (by Time) (gpumemtimesum):

#  Time (%)  Total Time (ns)  Count  Avg (ns)   Med (ns)   Min (ns)  Max (ns)  StdDev (ns)      Operation     
#  --------  ---------------  -----  ---------  ---------  --------  --------  -----------  ------------------
#      99.4          6157388      1  6157388.0  6157388.0   6157388   6157388          0.0  [CUDA memcpy HtoD]
#       0.6            39808      1    39808.0    39808.0     39808     39808          0.0  [CUDA memcpy DtoH]

# Processing [q1_3.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpumemsizesum.py]... 

#  ** GPU MemOps Summary (by Size) (gpumemsizesum):

#  Total (MB)  Count  Avg (MB)  Med (MB)  Min (MB)  Max (MB)  StdDev (MB)      Operation     
#  ----------  -----  --------  --------  --------  --------  -----------  ------------------
#      16.000      1    16.000    16.000    16.000    16.000        0.000  [CUDA memcpy HtoD]
#       0.500      1     0.500     0.500     0.500     0.500        0.000  [CUDA memcpy DtoH]