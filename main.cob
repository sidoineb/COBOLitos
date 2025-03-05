       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADDITION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       *> Déclaration des variables
       01 NUM1 PIC 9(5).
       01 NUM2 PIC 9(5).
       01 RESULT PIC 9(6).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Entrez le premier nombre : ".
           ACCEPT NUM1.
           
           DISPLAY "Entrez le deuxième nombre : ".
           ACCEPT NUM2.
           
           COMPUTE RESULT = NUM1 + NUM2. *> Effectue l'addition
           
           DISPLAY "Le résultat de l'addition est : " RESULT.
           
           STOP RUN. *> Fin du programme
