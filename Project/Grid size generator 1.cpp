#include <iostream>
#include <stdio.h>

using namespace std;

int main(){
	int gridSize = 24;
	int gridNum = (gridSize * gridSize) - 1;
	int i = 0, j;
	int yes;
	while(i <= gridNum){
		if(i < gridSize){
			if(i % gridSize == 0){	//top left corner
				printf("evolve3 e%i (grid_evolve[%i], grid[%i], grid[%i], grid[%i], grid[%i]);\n", i, i, i+1, i+gridSize, i+1+gridSize, i);
			}
			else if((i + 1) % gridSize == 0){	//top right corner
				printf("evolve3 e%i (grid_evolve[%i], grid[%i], grid[%i], grid[%i], grid[%i]);\n", i, i, i-1, i-1+gridSize, i+gridSize, i);
			}
			else{	//top row
				printf("evolve5 e%i (grid_evolve[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i]);\n", i, i, i-1, i+1, i-1+gridSize, i+gridSize, i+1+gridSize, i);
			}
		}
		else if(i > gridNum - gridSize){
			if(i % gridSize == 0){	//bottom left corner
				printf("evolve3 e%i (grid_evolve[%i], grid[%i], grid[%i], grid[%i], grid[%i]);\n", i, i, i-gridSize, i+1-gridSize, i+1, i);
			}
			else if((i + 1) % gridSize == 0){	//bottom right corner
				printf("evolve3 e%i (grid_evolve[%i], grid[%i], grid[%i], grid[%i], grid[%i]);\n", i, i, i-1-gridSize, i-gridSize, i-1, i);
			}
			else{	//bottom row
				printf("evolve5 e%i (grid_evolve[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i]);\n", i, i, i-1-gridSize, i-gridSize, i+1-gridSize, i-1, i+1, i);
			}
		}
		else{
			if(i % gridSize == 0){	//left column
				printf("evolve5 e%i (grid_evolve[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i]);\n", i, i, i-gridSize, i+1-gridSize, i+1, i+gridSize, i+1+gridSize, i);
			}
			else if((i + 1) % gridSize == 0){	//right column
				printf("evolve5 e%i (grid_evolve[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i]);\n", i, i, i-1-gridSize, i-gridSize, i-1, i-1+gridSize, i+gridSize, i);
			}
			else{	//middle
				printf("evolve8 e%i (grid_evolve[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i], grid[%i]);\n", i, i, i-1-gridSize, i-gridSize, i+1-gridSize, i-1, i+1, i-1+gridSize, i+gridSize, i+1+gridSize, i);
			}
		}
		if(((i + 1) % gridSize) == 0){	//print empty line after every row
			cout << endl;
		}
		++i;	
		}
		cin >> yes;
}
