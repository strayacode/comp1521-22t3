#include <spawn.h>
#include <sys/types.h>
#include <sys/wait.h>

extern char **environ;

void spawn_and_wait(char *args[]) {
    pid_t pid;
    posix_spawn(&pid, args[0], NULL, NULL, args, environ);

    int status;
    waitpid(pid, &status, 0);
}

int main() {
    char *date_argv[] = {"/bin/date", "+%d-%m-%Y", NULL};
    spawn_and_wait(date_argv);

    char *datetime_argv[] = {"/bin/date", "+%T", NULL};
    spawn_and_wait(datetime_argv);

    char *whoami_argv[] = {"/usr/bin/whoami", NULL};
    spawn_and_wait(whoami_argv);

    char *hostname_argv[] = {"/bin/hostname", "-f", NULL};
    spawn_and_wait(hostname_argv);

    char *realpath_argv[] = {"/usr/bin/realpath", ".", NULL};
    spawn_and_wait(realpath_argv);
}