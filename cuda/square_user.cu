//Yuxuan Huang
#include <stdio.h>

__global__ void square(float * d_out, float * d_in){
    int idx = threadIdx.x + blockIdx.x*(2048/4);
    float f = d_in[idx];
    d_out[idx] = f * f;
}

int main(int argc, char ** argv) {
	const int ARRAY_SIZE;
	const int ARRAY_BYTES = ARRAY_SIZE * sizeof(float);
	const int BLOCK_NUM;
	const int BLOCK_SIZE=1024;
	const int BLOCK_SIZE_R;

	// taking user input
	printf("Please input an integer value: ");
	scanf("%d", &ARRAY_SIZE);

	// calculate parameters
	BLOCK_NUM = (int)ARRAY_SIZE/1024;
	BLOCK_SIZE_R = (int)ARRAY_SIZE % 1024;



	// generate the input array on the host
	float h_in[ARRAY_SIZE];
	for (int i = 0; i < ARRAY_SIZE; i++) {
		h_in[i] = float(i);
	}
	float h_out[ARRAY_SIZE];

	// declare GPU memory pointers
	float * d_in;
	float * d_out;

	// allocate GPU memory
	cudaMalloc((void**) &d_in, ARRAY_BYTES);
	cudaMalloc((void**) &d_out, ARRAY_BYTES);

	// transfer the array to the GPU
	cudaMemcpy(d_in, h_in, ARRAY_BYTES, cudaMemcpyHostToDevice);

	// launch the kernel
	square<<<BLOCK_NUM, BLOCK_SIZE>>>(d_out, d_in);

	if 

	// copy back the result array to the CPU
	cudaMemcpy(h_out, d_out, ARRAY_BYTES, cudaMemcpyDeviceToHost);

	// print out the resulting array
	for (int i =0; i < ARRAY_SIZE; i++) {
		printf("%f", h_out[i]);
		printf(((i % 4) != 3) ? "\t" : "\n");
	}

	cudaFree(d_in);
	cudaFree(d_out);

	cudaError err;
   	if ( cudaSuccess != (err = cudaGetLastError()) ){
         fprintf(stderr, "CUDA error: %s\n", cudaGetErrorString( err ) );
       	  exit(-2);
   	 }

	return 0;
}