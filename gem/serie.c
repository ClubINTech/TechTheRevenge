#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>

int open_port(const char* argv){
    printf("Ouverture de : %s\n", argv);

    int fd = open(argv, O_RDWR| O_NOCTTY | O_NDELAY);
    if (fd == -1){
        perror(" open_port() : couldn't open the port ");
    } else {
        if (fcntl(fd, F_SETFL, 0) < 0) {
            perror("fcntl() failed !\n");
        }
    }
    return fd;
}

int main(int argc, char** argv){
    int fd;
    int data;
    struct termios options;

    if (argc != 2){
        printf("Usage : access_serial_port\n");
        exit(1);
    }

    fd = open_port(argv[1]);

    if (tcgetattr(fd, &options) < 0){
        perror("tcgetattr() failed !\n");
    }

    /* Set the baud rate : 9600 */
    cfsetispeed(&options, B9600);
    cfsetospeed (&options, B9600);

    /* Enable the receiver and set local mode */
    options.c_cflag |= (CLOCAL | CREAD);

    /* No parity (8,N,1) */
    options.c_cflag &= ~PARENB;  /* Disable parity bit */
    options.c_cflag &= ~CSTOPB;  /* 1 stop bit */
    options.c_cflag &= ~CSIZE;   /* No bit mask for data bits */
    options.c_cflag |= CS8;      /* Set 8 data bits */

    /* Set hardware flow control */
    // options.c_cflag |= CNEW_RTSCTS;

    /* Choose raw input */
    options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
    /* Disable canonical input */
    /* Disable echoing of input and erasing characters */
    /* Disable SIGINTR, SIGSUP, SIGDSUP, SIGQUIT signals */

    fcntl(fd, F_SETFL, FNDELAY);

    /* Set the new options for the port immediately */
    if (tcsetattr(fd, TCSANOW, &options) < 0){
        perror("tcsetattr() failed ! \n");
    }

    data = write(fd, "Bonjour le monde", 16);
    if (data < 0){
        perror("write() failed !\n");
    }

    close(fd);
    return 0;
}
