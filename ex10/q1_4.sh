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

nsys profile -o q1_4 python q1_4.py 4000000
nsys stats --timeunit ms q1_4.nsys-rep


#  ** OS Runtime Summary (osrtsum):

#  Time (%)  Total Time (ms)  Num Calls  Avg (ms)  Med (ms)  Min (ms)  Max (ms)  StdDev (ms)           Name         
#  --------  ---------------  ---------  --------  --------  --------  --------  -----------  ----------------------
#      43.8         914.5806          2  457.2903  457.2903    2.5757  912.0050     643.0636  sem_wait              
#      40.4         843.4978         23   36.6738    3.0107    0.0022  142.4231      48.4871  poll                  
#      10.0         209.9460        662    0.3171    0.2807    0.0031    2.7186       0.2352  open64                
#       4.5          94.6515        776    0.1220    0.0138    0.0010   44.1226       1.5938  ioctl                 
#       0.4           9.1721        682    0.0134    0.0039    0.0010    0.5908       0.0315  read                  
#       0.3           5.4815        251    0.0218    0.0029    0.0020    3.7117       0.2343  mmap64                
#       0.2           3.9431         44    0.0896    0.0060    0.0026    0.7230       0.1981  fopen                 
#       0.1           2.3626         28    0.0844    0.0011    0.0010    0.6202       0.2077  fcntl                 
#       0.0           1.0357        170    0.0061    0.0058    0.0037    0.0158       0.0020  munmap                
#       0.0           0.9096          4    0.2274    0.2061    0.0530    0.4445       0.2033  pthread_create        
#       0.0           0.7039         11    0.0640    0.0082    0.0030    0.3439       0.1250  fread                 
#       0.0           0.6615          8    0.0827    0.0049    0.0038    0.4491       0.1603  fopen64               
#       0.0           0.6061         14    0.0433    0.0496    0.0125    0.0856       0.0211  sem_timedwait         
#       0.0           0.5276         55    0.0096    0.0084    0.0011    0.0735       0.0091  fgets                 
#       0.0           0.3503         22    0.0159    0.0093    0.0026    0.1011       0.0218  mmap                  
#       0.0           0.2735          7    0.0391    0.0052    0.0025    0.2428       0.0899  open                  
#       0.0           0.2423         39    0.0062    0.0024    0.0014    0.1310       0.0206  fclose                
#       0.0           0.1165          1    0.1165    0.1165    0.1165    0.1165       0.0000  pthread_cond_wait     
#       0.0           0.0791         20    0.0040    0.0039    0.0010    0.0074       0.0014  write                 
#       0.0           0.0205          3    0.0068    0.0076    0.0047    0.0083       0.0019  pipe2                 
#       0.0           0.0169          2    0.0084    0.0084    0.0052    0.0117       0.0046  socket                
#       0.0           0.0092          1    0.0092    0.0092    0.0092    0.0092       0.0000  connect               
#       0.0           0.0056          2    0.0028    0.0028    0.0027    0.0029       0.0001  pthread_cond_broadcast
#       0.0           0.0047          1    0.0047    0.0047    0.0047    0.0047       0.0000  pthread_cond_signal   
#       0.0           0.0046          2    0.0023    0.0023    0.0016    0.0030       0.0010  fwrite                
#       0.0           0.0041          2    0.0020    0.0020    0.0019    0.0022       0.0002  sigaction             
#       0.0           0.0025          1    0.0025    0.0025    0.0025    0.0025       0.0000  mprotect              
#       0.0           0.0018          1    0.0018    0.0018    0.0018    0.0018       0.0000  bind                  
#       0.0           0.0012          1    0.0012    0.0012    0.0012    0.0012       0.0000  listen                
#       0.0           0.0011          1    0.0011    0.0011    0.0011    0.0011       0.0000  fflush                

# Processing [q1_4.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/cudaapisum.py]... 

#  ** CUDA API Summary (cudaapisum):

#  Time (%)  Total Time (ms)  Num Calls  Avg (ms)  Med (ms)  Min (ms)  Max (ms)  StdDev (ms)           Name         
#  --------  ---------------  ---------  --------  --------  --------  --------  -----------  ----------------------
#      55.8           3.5261          1    3.5261    3.5261    3.5261    3.5261       0.0000  cuMemcpyHtoD_v2       
#      14.3           0.9054          2    0.4527    0.4527    0.3314    0.5740       0.1716  cuModuleLoadDataEx    
#       9.8           0.6163          1    0.6163    0.6163    0.6163    0.6163       0.0000  cuMemcpyDtoH_v2       
#       5.4           0.3404          2    0.1702    0.1702    0.1633    0.1771       0.0097  cuLinkComplete        
#       5.1           0.3234          2    0.1617    0.1617    0.1429    0.1804       0.0265  cuMemAlloc_v2         
#       3.5           0.2192          9    0.0244    0.0164    0.0093    0.0780       0.0212  cuLaunchKernel        
#       2.9           0.1816          2    0.0908    0.0908    0.0874    0.0941       0.0047  cuLinkCreate_v2       
#       1.5           0.0968        384    0.0003    0.0002    0.0001    0.0031       0.0002  cuGetProcAddress      
#       0.7           0.0462          1    0.0462    0.0462    0.0462    0.0462       0.0000  cuMemGetInfo_v2       
#       0.5           0.0333          1    0.0333    0.0333    0.0333    0.0333       0.0000  cuCtxSynchronize      
#       0.4           0.0235          4    0.0059    0.0038    0.0030    0.0129       0.0047  cuStreamSynchronize   
#       0.0           0.0030          2    0.0015    0.0015    0.0013    0.0017       0.0003  cuLinkDestroy         
#       0.0           0.0029          1    0.0029    0.0029    0.0029    0.0029       0.0000  cuInit                
#       0.0           0.0005          1    0.0005    0.0005    0.0005    0.0005       0.0000  cuDeviceGetUuid_v2    
#       0.0           0.0002          1    0.0002    0.0002    0.0002    0.0002       0.0000  cuModuleGetLoadingMode

# Processing [q1_4.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpukernsum.py]... 

#  ** CUDA GPU Kernel Summary (gpukernsum):

#  Time (%)  Total Time (ms)  Instances  Avg (ms)  Med (ms)  Min (ms)  Max (ms)  StdDev (ms)      GridXYZ          BlockXYZ                                                     Name                                                
#  --------  ---------------  ---------  --------  --------  --------  --------  -----------  ----------------  --------------  ----------------------------------------------------------------------------------------------------
#      84.2           0.2009          1    0.2009    0.2009    0.2009    0.2009       0.0000  125000    1    1    32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       4.9           0.0117          1    0.0117    0.0117    0.0117    0.0117       0.0000  3907    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       2.4           0.0056          2    0.0028    0.0028    0.0028    0.0028       0.0000     1    1    1    1024    1    1  cudapy::numba::cuda::cudadrv::devicearray::_assign_kernel::_3clocals_3e::kernel[abi:v2,cw51cXTLSUwv…
#       1.9           0.0045          1    0.0045    0.0045    0.0045    0.0045       0.0000   123    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       1.8           0.0044          1    0.0044    0.0044    0.0044    0.0044       0.0000   123    1    1    1024    1    1  cudapy::numba::cuda::cudadrv::devicearray::_assign_kernel::_3clocals_3e::kernel[abi:v2,cw51cXTLSUwv…
#       1.7           0.0042          1    0.0042    0.0042    0.0042    0.0042       0.0000     1    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       1.7           0.0042          1    0.0042    0.0042    0.0042    0.0042       0.0000     4    1    1      32    1    1  cudapy::__main__::reduce_kernel[abi:v1,cw51cXTLSUwv1sCUt9Uw11Ew0NRRQPKzLTg4gaGKFsG2oMQGEYakJSQB1PQB…
#       1.4           0.0032          1    0.0032    0.0032    0.0032    0.0032       0.0000     4    1    1    1024    1    1  cudapy::numba::cuda::cudadrv::devicearray::_assign_kernel::_3clocals_3e::kernel[abi:v2,cw51cXTLSUwv…

# Processing [q1_4.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpumemtimesum.py]... 

#  ** GPU MemOps Summary (by Time) (gpumemtimesum):

#  Time (%)  Total Time (ms)  Count  Avg (ms)  Med (ms)  Min (ms)  Max (ms)  StdDev (ms)      Operation     
#  --------  ---------------  -----  --------  --------  --------  --------  -----------  ------------------
#      98.8           3.3234      1    3.3234    3.3234    3.3234    3.3234       0.0000  [CUDA memcpy HtoD]
#       1.2           0.0393      1    0.0393    0.0393    0.0393    0.0393       0.0000  [CUDA memcpy DtoH]

# Processing [q1_4.sqlite] with [/appl/cuda/11.8.0/nsight-systems-2022.4.2/host-linux-x64/reports/gpumemsizesum.py]... 

#  ** GPU MemOps Summary (by Size) (gpumemsizesum):

#  Total (MB)  Count  Avg (MB)  Med (MB)  Min (MB)  Max (MB)  StdDev (MB)      Operation     
#  ----------  -----  --------  --------  --------  --------  -----------  ------------------
#      16.000      1    16.000    16.000    16.000    16.000        0.000  [CUDA memcpy HtoD]
#       0.500      1     0.500     0.500     0.500     0.500        0.000  [CUDA memcpy DtoH]