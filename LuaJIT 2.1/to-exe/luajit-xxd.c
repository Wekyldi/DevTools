#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc < 3) {
        printf("Usage: %s input.bin output.h\n", argv[0]);
        return 1;
    }
    FILE *fin = fopen(argv[1], "rb");
    if (!fin) { perror("fopen input"); return 1; }
    FILE *fout = fopen(argv[2], "w");
    if (!fout) { perror("fopen output"); return 1; }

    fprintf(fout, "unsigned char lua_code[] = {");
    int c, count = 0;
    while ((c = fgetc(fin)) != EOF) {
        if (count % 12 == 0) fprintf(fout, "\n ");
        fprintf(fout, "0x%02x,", c & 0xff);
        count++;
    }
    fprintf(fout, "\n};\nunsigned int lua_code_size = %d;\n", count);

    fclose(fin);
    fclose(fout);
    return 0;
}