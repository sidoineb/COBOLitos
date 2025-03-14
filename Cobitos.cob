             IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOLITOS-QUANTUM.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 QUBIT-1 PIC X.
       01 QUBIT-2 PIC X.
       01 CMD-LINE PIC X(100).
       01 RESULT  PIC X(200).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Bienvenue dans COBOLitos Quantum".
           DISPLAY "Entrez le premier qubit (0 ou 1) : ".
           ACCEPT QUBIT-1.
           
           DISPLAY "Entrez le deuxième qubit (0 ou 1) : ".
           ACCEPT QUBIT-2.

           *> Création de la commande à exécuter
           STRING "python3 Quantum_tensor.py " QUBIT-1 " " QUBIT-2 
               INTO CMD-LINE.

           *> Exécution du script Python et récupération du résultat
           CALL "SYSTEM" USING CMD-LINE.

           DISPLAY "Calcul terminé ! Vérifiez la sortie Python.".
           STOP RUN.
