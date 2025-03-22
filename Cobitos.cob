 IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOLITOS-QUANTUM.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CHOICE PIC X.
       01 QUBIT-1 PIC X.
       01 QUBIT-2 PIC X.
       01 CMD-LINE PIC X(100).
       01 RESULT  PIC X(200).

       PROCEDURE DIVISION.
       MAIN-MENU.
           DISPLAY "Bienvenue dans COBOLitos Quantum".
           DISPLAY "1. Produit Tensoriel".
           DISPLAY "2. Intrication Quantique".
           DISPLAY "3. Quitter".
           ACCEPT CHOICE.

           EVALUATE CHOICE
               WHEN "1"
                   PERFORM CALCULER-TENSOR
               WHEN "2"
                   PERFORM CALCULER-INTRICATION
               WHEN "3"
                   DISPLAY "Au revoir !"
                   STOP RUN
               WHEN OTHER
                   DISPLAY "Choix invalide, réessayez."
                   PERFORM MAIN-MENU
           END-EVALUATE.

       CALCULER-TENSOR.
           DISPLAY "Entrez le premier qubit (0 ou 1) : ".
           ACCEPT QUBIT-1.
           DISPLAY "Entrez le deuxième qubit (0 ou 1) : ".
           ACCEPT QUBIT-2.

           STRING "python3 quantum_tensor.py " QUBIT-1 " " QUBIT-2 
               INTO CMD-LINE.

           CALL "SYSTEM" USING CMD-LINE.

           PERFORM MAIN-MENU.

       CALCULER-INTRICATION.
           DISPLAY "Entrez le premier qubit (0 ou 1) : ".
           ACCEPT QUBIT-1.
           DISPLAY "Entrez le deuxième qubit (0 ou 1) : ".
           ACCEPT QUBIT-2.

           STRING "python3 quantum_intrication.py " QUBIT-1 " " QUBIT-2 
               INTO CMD-LINE.

           CALL "SYSTEM" USING CMD-LINE.

           PERFORM MAIN-MENU.