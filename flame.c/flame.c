#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#define BUFFER_SIZE 800
#define PAUSE 0.03
#define PAUSER 10000000
void christopher_nolan (char level) {
        //printf("%d",level);
	if (level != 0) {
		christopher_nolan(level - 1);
		return;
	} else {
                //printf("\n");
		//for (int i = 0; i < PAUSER; i++ ) {}
		sleep(PAUSE);
		return;
	}
}

int main () {
	char buffer[BUFFER_SIZE];
	ssize_t read_bytes = 0;
	do {
		read_bytes = read(STDIN_FILENO, buffer, BUFFER_SIZE);
		for (int i = 0; i < read_bytes; i++) {
			// printf("%d %d\n",(int)read_bytes,i);
			christopher_nolan(buffer[i]);
		}
	} while (read_bytes);

	return EXIT_SUCCESS;
}
