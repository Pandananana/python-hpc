#!/bin/sh
#BSUB -q c02613
#BSUB -J gpujob
#BSUB -n 4
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=5GB]"
#BSUB -gpu "num=1:mode=exclusive_process"
#BSUB -W 00:05
#BSUB -o logs/gpujob_%J.out
#BSUB -e logs/gpujob_%J.err

source /dtu/projects/02613_2025/conda/conda_init.sh
conda activate 02613

nsys profile -o q1_5 python q1_5.py 4000000
nsys stats --timeunit ms q1_5.nsys-rep


#  ** OS Runtime Summary (osrtsum):

#  Time (%)  Total Time (ms)  Num Calls  Avg (ms)  Med (ms)  Min (ms)  Max (ms)  StdDev (ms)           Name         
#  --------  ---------------  ---------  --------  --------  --------  --------  -----------  ----------------------
#      44.1         910.8378          2  455.4189  455.4189    2.5419  908.2960     640.4649  sem_wait              
#      40.8         842.7307         23   36.6405    3.1828    0.0019  141.1508      47.7054  poll                  
#       9.0         185.8949        662    0.2808    0.2700    0.0028    1.2408       0.1560  open64                
#       4.7          98.1252        776    0.1265    0.0141    0.0010   46.1252       1.6654  ioctl                 
#       0.5          10.0358        723    0.0139    0.0039    0.0010    0.4573       0.0298  read                  
#       0.3           5.8754        252    0.0233    0.0028    0.0020    4.0816       0.2571  mmap64                
#       0.2           5.0264         44    0.1142    0.0058    0.0025    1.3188       0.2683  fopen                 
#       0.1           2.7773         29    0.0958    0.0012    0.0010    0.8549       0.2437  fcntl                 
#       0.1           1.1053        170    0.0065    0.0054    0.0037    0.1194       0.0089  munmap                
#       0.0           0.9999          4    0.2500    0.2506    0.0534    0.4453       0.2220  pthread_create        
#       0.0           0.8729         11    0.0794    0.0052    0.0018    0.5414       0.1741  fread                 
#       0.0           0.6969          8    0.0871    0.0051    0.0039    0.3599       0.1519  fopen64               
#       0.0           0.5791         56    0.0103    0.0083    0.0012    0.0740       0.0100  fgets                 
#       0.0           0.4606         22    0.0209    0.0080    0.0039    0.1873       0.0402  mmap                  
#       0.0           0.3054         14    0.0218    0.0217    0.0097    0.0555       0.0110  sem_timedwait         
#       0.0           0.2600         39    0.0067    0.0024    0.0014    0.1566       0.0247  fclose                
#       0.0           0.2478          7    0.0354    0.0052    0.0023    0.2171       0.0801  open                  
#       0.0           0.1122          1    0.1122    0.1122    0.1122    0.1122       0.0000  pthread_cond_wait     
#       0.0           0.0626         20    0.0031    0.0027    0.0011    0.0078       0.0017  write                 
#       0.0           0.0225          3    0.0075    0.0089    0.0046    0.0090       0.0025  pipe2                 
#       0.0           0.0164          2    0.0082    0.0082    0.0059    0.0105       0.0033  socket                
#       0.0           0.0104          1    0.0104    0.0104    0.0104    0.0104       0.0000  connect               
#       0.0           0.0089          2    0.0045    0.0045    0.0032    0.0058       0.0018  pthread_cond_signal   
#       0.0           0.0061          2    0.0031    0.0031    0.0030    0.0031       0.0001  pthread_cond_broadcast
#       0.0           0.0047          2    0.0023    0.0023    0.0019    0.0027       0.0006  fwrite                
#       0.0           0.0040          2    0.0020    0.0020    0.0019    0.0021       0.0001  sigaction             
#       0.0           0.0032          1    0.0032    0.0032    0.0032    0.0032       0.0000  bind                  
#       0.0           0.0022          1    0.0022    0.0022    0.0022    0.0022       0.0000  mprotect              
#       0.0           0.0014          1    0.0014    0.0014    0.0014    0.0014       0.0000  listen                

# Processing [q1_5.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/cudaapisum.py]... 

#  ** CUDA API Summary (cudaapisum):

#  Time (%)  Total Time (ms)  Num Calls  Avg (ms)  Med (ms)  Min (ms)  Max (ms)  StdDev (ms)           Name         
#  --------  ---------------  ---------  --------  --------  --------  --------  -----------  ----------------------
#      42.5           3.8261          1    3.8261    3.8261    3.8261    3.8261       0.0000  cuMemcpyHtoD_v2       
#      36.7           3.3031          2    1.6516    1.6516    0.4274    2.8758       1.7313  cuModuleLoadDataEx    
#       5.8           0.5260          1    0.5260    0.5260    0.5260    0.5260       0.0000  cuMemcpyDtoH_v2       
#       4.2           0.3762          2    0.1881    0.1881    0.1701    0.2061       0.0255  cuMemAlloc_v2         
#       3.4           0.3058          2    0.1529    0.1529    0.1510    0.1548       0.0027  cuLinkComplete        
#       2.2           0.1960          9    0.0218    0.0131    0.0094    0.0650       0.0179  cuLaunchKernel        
#       1.9           0.1683          2    0.0841    0.0841    0.0821    0.0862       0.0029  cuLinkCreate_v2       
#       1.3           0.1125          4    0.0281    0.0037    0.0026    0.1025       0.0496  cuStreamSynchronize   
#       1.2           0.1035        384    0.0003    0.0002    0.0001    0.0043       0.0002  cuGetProcAddress      
#       0.7           0.0646          1    0.0646    0.0646    0.0646    0.0646       0.0000  cuMemGetInfo_v2       
#       0.1           0.0059          1    0.0059    0.0059    0.0059    0.0059       0.0000  cuCtxSynchronize      
#       0.0           0.0034          1    0.0034    0.0034    0.0034    0.0034       0.0000  cuInit                
#       0.0           0.0030          2    0.0015    0.0015    0.0013    0.0017       0.0003  cuLinkDestroy         
#       0.0           0.0003          1    0.0003    0.0003    0.0003    0.0003       0.0000  cuDeviceGetUuid_v2    
#       0.0           0.0003          1    0.0003    0.0003    0.0003    0.0003       0.0000  cuModuleGetLoadingMode

# Processing [q1_5.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpukernsum.py]... 

#  ** CUDA GPU Kernel Summary (gpukernsum):

#  Time (%)  Total Time (ms)  Instances  Avg (ms)  Med (ms)  Min (ms)  Max (ms)  StdDev (ms)      GridXYZ          BlockXYZ                                                     Name                                                
#  --------  ---------------  ---------  --------  --------  --------  --------  -----------  ----------------  --------------  ----------------------------------------------------------------------------------------------------
#      85.3           0.1992          1    0.1992    0.1992    0.1992    0.1992       0.0000  125000    1    1    32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       4.4           0.0103          1    0.0103    0.0103    0.0103    0.0103       0.0000  3907    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       2.4           0.0056          2    0.0028    0.0028    0.0028    0.0028       0.0000     1    1    1    1024    1    1  cudapy::numba::cuda::cudadrv::devicearray::_assign_kernel::_3clocals_3e::kernel[abi:v2,cw51cXTLSUwv…
#       1.9           0.0045          1    0.0045    0.0045    0.0045    0.0045       0.0000   123    1    1    1024    1    1  cudapy::numba::cuda::cudadrv::devicearray::_assign_kernel::_3clocals_3e::kernel[abi:v2,cw51cXTLSUwv…
#       1.7           0.0040          1    0.0040    0.0040    0.0040    0.0040       0.0000     4    1    1    1024    1    1  cudapy::numba::cuda::cudadrv::devicearray::_assign_kernel::_3clocals_3e::kernel[abi:v2,cw51cXTLSUwv…
#       1.4           0.0034          1    0.0034    0.0034    0.0034    0.0034       0.0000     1    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       1.4           0.0034          1    0.0034    0.0034    0.0034    0.0034       0.0000     4    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       1.4           0.0033          1    0.0033    0.0033    0.0033    0.0033       0.0000   123    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…

# Processing [q1_5.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpumemtimesum.py]... 

#  ** GPU MemOps Summary (by Time) (gpumemtimesum):

#  Time (%)  Total Time (ms)  Count  Avg (ms)  Med (ms)  Min (ms)  Max (ms)  StdDev (ms)      Operation     
#  --------  ---------------  -----  --------  --------  --------  --------  -----------  ------------------
#      98.9           3.5891      1    3.5891    3.5891    3.5891    3.5891       0.0000  [CUDA memcpy HtoD]
#       1.1           0.0394      1    0.0394    0.0394    0.0394    0.0394       0.0000  [CUDA memcpy DtoH]

# Processing [q1_5.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpumemsizesum.py]... 

#  ** GPU MemOps Summary (by Size) (gpumemsizesum):

#  Total (MB)  Count  Avg (MB)  Med (MB)  Min (MB)  Max (MB)  StdDev (MB)      Operation     
#  ----------  -----  --------  --------  --------  --------  -----------  ------------------
#      16.000      1    16.000    16.000    16.000    16.000        0.000  [CUDA memcpy HtoD]
#       0.500      1     0.500     0.500     0.500     0.500        0.000  [CUDA memcpy DtoH]