#include <stdio.h>
#include <dirent.h>

const char *currdir = ".";

int main(int argc, char *argv[]){
    struct dirent *ent;
    DIR *dir;

    if (argc != 2)
        dir = opendir(currdir);
    else
        dir = opendir(argv[1]);

    if (dir) {
        printf(" Tipo\t\t\t| Nome\n");
        printf("------------------------------------------------------\n");
        while ((ent = readdir(dir)) != NULL) {

            switch (ent->d_type) {
                case DT_REG:
                    printf(" Arquivo regular\t| %s\n", ent->d_name);
                    break;
                case DT_DIR:
                    printf(" Diretório\t\t| %s\n", ent->d_name);
                    break;
                default:
                    printf(" Outro\t\t\t| %s\n", ent->d_name);
                    break;
            }
        }
        closedir(dir);
    } else {
        perror("Falha ao abrir o diretório");
        return 1;
    }

    return 0;
}




