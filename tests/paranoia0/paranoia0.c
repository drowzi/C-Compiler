#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

void usage(const char *arg0)
{
    fprintf(stderr, "Usage: %s [INTEGER]\n", arg0);
    fprintf(stderr, "Dummy program\n");
    exit(EXIT_FAILURE);
}

int g_a;

void init()
{
    g_a = 3;
}

int return_4()
{
    return 4;
}

void uninit()
{
}

int main(int argc, char **argv)
{
    if (argc <= 1) {
        usage(argv[0]);
    }

    if (argc > 2) {
        printf("You only need to pass one argument.\n");
    }
    else {
        init();
    }

    const int i = atoi(argv[1]);
    int j;
before_switch: j = 0;
switch_i: switch (i) {
        case 3:
            for(; j < 3; ++j)
                printf(".");
        case 17:
            for(; j < 17; ++j)
                printf(".");
            if (i == 3 || i == 17)
                printf("\n");
        case -4:
            printf("You picked one of my favorite numbers (17, 3, and -4)!\n");
            break;

        case -1:
            printf("Cleaning up\n");
            goto cleanup;

        default:
            printf("I don't like that number.\n");
    }

    j = 0;
do_loop_1: do {
        if (j++ % 2 == 0)
            continue;
        if (j == 10)
            break;

        printf("j is %d.\n", j);
    } while(j < 30);

    j = 10;
    while (j > 0) {
        if (4 == return_4())
            break;
        --j;
    }

    void (*voidFn)() = &uninit;
    voidFn();
    init();

cleanup:
    uninit();
    return EXIT_SUCCESS;
}