%{
#include <stdio.h>
int yywrap(void){
return 1;
}
%}

%%

"//".*       {printf("COMMENT\n");}
"f"          {printf("floatdcl ");}
"i"          {printf("intdcl ");}
[a-z]+       {printf("id ");}
[0-9]+\.[0-9]+ {printf("fnum ");}
"+"          {printf("plus ");}
"="          {printf("assign ");}
[0-9]+       {printf("inum ");}

%%



int main(int argc, char **argv) {
    FILE    *fd;

    if (argc == 2)
    {
        if (!(fd = fopen(argv[1], "r")))
        {
            perror("Error: ");
            return (-1);
        }
        yyset_in(fd);
        yylex();
        fclose(fd);
    }
    else
        printf("Usage: a.out filename\n");
    return (0);
}

                                                                                                                                          3,1           All
