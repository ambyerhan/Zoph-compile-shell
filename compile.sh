#Written by Barret Zoph, for questions email barretzoph@gmail.com

#Compilation script for compiling ZOPH_RNN
#The following 7 environmental variables must be set in order for compilation
#The default arguements are examples of what the paths should look like
#For the dependencies the following are required:
#-----------------------------------------------
#cuda version >= 7.0
#One of the following gcc versions >=  4.8.1
#CuDNN version = 4 
#Boost version = 1.51.0 or 1.55.0 
#Any version of Eigen

#source /usr/usc/cuda/7.5/setup.sh
#source /usr/usc/gnu/gcc/4.9.3/setup.sh

PATH_TO_CUDA_INCLUDE="/home/ambyer/cuda/include/"
PATH_TO_BOOST_INCLUDE="/home/ambyer/boost/include/"
PATH_TO_CUDA_LIB_64="/home/ambyer/cuda/lib64/"
PATH_TO_BOOST_LIB="/home/ambyer/boost/lib/"
PATH_TO_CUDNN_V4_64="/home/ambyer/cuda/lib64/"
PATH_TO_EIGEN="/home/ambyer/eigen/eigen-eigen-67e894c6cd8f/"
PATH_TO_CUDNN_INCLUDE="/home/ambyer/cuda/include/"

nvcc -DCUDNN_STATIC -O3 \
     -g -Xcompiler -fopenmp \
	 -I $PATH_TO_CUDA_INCLUDE \
	 -I $PATH_TO_BOOST_INCLUDE  \
   	 -I $PATH_TO_CUDNN_INCLUDE \
         -I $PATH_TO_EIGEN \
     -std=c++11 \
         ${PATH_TO_BOOST_LIB}libboost_program_options.a \
         ${PATH_TO_BOOST_LIB}libboost_filesystem.a \
         ${PATH_TO_BOOST_LIB}libboost_system.a \
	 ${PATH_TO_CUDA_LIB_64}libcublas_static.a \
	 ${PATH_TO_CUDA_LIB_64}libcudadevrt.a \
	 ${PATH_TO_CUDA_LIB_64}libcudart_static.a \
	 ${PATH_TO_CUDA_LIB_64}libculibos.a \
	 ${PATH_TO_CUDA_LIB_64}libcurand_static.a \
	 ${PATH_TO_CUDA_LIB_64}libcusolver_static.a \
	 ${PATH_TO_CUDA_LIB_64}libcusparse_static.a \
	 ${PATH_TO_CUDA_LIB_64}libnppc_static.a \
	 ${PATH_TO_CUDA_LIB_64}libnppi_static.a \
	 ${PATH_TO_CUDA_LIB_64}libnpps_static.a \
         ${PATH_TO_CUDNN_V4_64}libcudnn_static.a \
     src/main.cu -o debugZoph -lboost_regex -lboost_system -lboost_system-mt -lboost_thread -lboost_iostreams -lm -lpthread -lcrypt -ldl -L ~/boost/lib/
