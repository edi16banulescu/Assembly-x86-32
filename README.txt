Tema contine un singur fisier main.c cu functiile aferente.
In main.c se regasesc functiile cerute in cerinta + doua functii de parsare a elementelor primite ca input.
Mentionez faptul ca am lucrat cu lungimea vectorului ca fiind numarul de biti.

add_last: la finalul vectorului arr (arr + len) adaugam headerul si elementele propiu zise cu ajutorul memcpy.
add_at: parcurgem vectorul cu pasul sizeof(head) + lungime pana la indexul corect si mutam cu ajutorul memmove
        bitii si adaugam noul elementele.
find: parcurgem vectorul cu pasul sizeof(head) + lungime pana la indexul corect si parsam elementele pentru a
        le putea printa.
delete_at: parcurgem vectorul cu pasul sizeof(head) + lungime pana la indexul corect si mutam cu ajutorul memmove
        bitii de dupa element in locul elementului sters.
print: parcurgem vectorul pana la ajungem la len si il parsam pentru a il putea printa
iesire: eliberam memoria
