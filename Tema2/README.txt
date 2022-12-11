simple.asm :
La acest task extrag pe rand cate o litera din plain si ii adaug pasul corespunzator, iar
daca, dupa adaugare, litera sau simbolul este mai mare decat 'Z', ii scad 90 (codul ASCII al
lui Z).

points-distance.asm : 
La acest task extrag perechi sub forma de (x1, x2) si (y1, y2) si compar x1 cu x2, respectiv
y1 cu y2. Apoi avem 4 cazuri : cand x1 = x2 si y1 > y2, respectiv y2 > y1 si cand y1 = y2
si x1 > x2, respectiv x2 > x1 si le scadem, iar rezultatul este distanta.

road.asm :
Asemanator cu points-distance extrag perechi (x1, x2) si (y1, y2) si le compar apoi le scad
in functie de caz, insa acum iterez prin tot sirul de puncte, cu pasul 1, pana la len.

is_square.asm :
In aceasta functie iau pe rand distantele create la exercitiul anterior si verific daca sunt
patrate perfecte. Pornesc de la un registru care este egal cu 0 si il inmultesc cu el insusi
cu ajutorul instructiunii mul, iar daca va ajunge la o valoare egala cu distanta respectiva,
inseamna ca este patrat perfect si scriu '1' in output, iar contrar daca inmultirea depaseste
valoarea distantei, scriu '0'.