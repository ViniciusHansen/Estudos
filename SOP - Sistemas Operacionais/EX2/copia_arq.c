#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

#define BUFFER_SIZE 4096

int main(int argc, char *argv[]){
    if (argc != 3){
        printf("número errado de argumentos");
        return 1;
    }

    int src_file = open(argv[1], O_RDONLY);
    if(src_file == -1) {
        printf("Erro ao abrir o arquivo de origem");
        return 2;
    }

    struct stat buf;
    if(stat(argv[2], &buf) == 0) {
        printf("O arquivo de destino já existe.\n");
        close(src_file);
        return 3;
    }

    int dest_file = open(argv[2], O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR);
    if(dest_file == -1) {
        printf("Erro ao abrir/criar o arquivo de destino");
        close(src_file);
        return 4;
    }

    char buffer[BUFFER_SIZE];
    ssize_t bytes_read;

    // Loop que itera todos os bytes do arquivo
    while((bytes_read = read(src_file, buffer, sizeof(buffer))) > 0){
        // verifica se a quantidade de bytes escritos está correta
        if (write(dest_file, buffer, bytes_read) != bytes_read){
            perror("Erro ao escrever no arquivo de destino");
            close(src_file);
            close(dest_file);
            return 5;
        }
    }

    if(bytes_read == -1) {
        perror("Erro ao ler o arquivo de origem");
        close(src_file);
        close(dest_file);
        return 6;
    }

    close(src_file);
    close(dest_file);
    printf("Cópia concluída com sucesso.\n");
    return 0;
}


