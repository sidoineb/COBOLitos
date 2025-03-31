       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOLITOS-QUANTUM.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CHOICE PIC X.
       01 QUBIT-1 PIC X.
       01 QUBIT-2 PIC X.
       01 CMD-LINE PIC X(100).
       01 LOGO PIC X(50) VALUE "COBOLitos Quantum".
       01 I PIC 99.
       01 RESULT-LINE PIC X(200).
       01 RESULT-FILE PIC X(20) VALUE "result.txt".

       FILE SECTION.
       FD RESULT-TEXT-FILE.
       01 RESULT-RECORD PIC X(200).

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           PERFORM AFFICHER-LOGO.
           PERFORM MAIN-MENU.


       MAIN-MENU.
           DISPLAY "1. Produit Tensoriel".
           DISPLAY "2. Intrication Quantique".
           DISPLAY "3. Porte Hadamard (Superposition)".
           DISPLAY "4. Pauli-X (Inversion)".
           DISPLAY "5. Pauli-Z (Changement de Phase)".
           DISPLAY "6. CNOT (Intrication)".
           DISPLAY "7. Quitter".
           ACCEPT CHOICE.

           EVALUATE CHOICE
               WHEN "1"
                   PERFORM CALCULER-TENSOR
               WHEN "2"
                   PERFORM CALCULER-INTRICATION
               WHEN "3"
                   PERFORM CALCULER-HADAMARD
               WHEN "4"
                   PERFORM CALCULER-PAULI-X
               WHEN "5"
                   PERFORM CALCULER-PAULI-Z
               WHEN "6"
                   PERFORM CALCULER-CNOT
               WHEN "7"
                   DISPLAY "Au revoir !"
                   STOP RUN
               WHEN OTHER
                   DISPLAY "Choix invalide, réessayez."
                   PERFORM MAIN-MENU
           END-EVALUATE.

           AFFICHER-QUBIT.
           DISPLAY " ".
           DISPLAY "Visualisation du qubit :".
           DISPLAY " ".
           EVALUATE QUBIT-1
               WHEN "0"
                   DISPLAY "      |0⟩   "
                   DISPLAY "     -----  "
                   DISPLAY "    |     | "
                   DISPLAY "     -----  "
               WHEN "1"
                   DISPLAY "      |1⟩   "
                   DISPLAY "     -----  "
                   DISPLAY "    |     | "
                   DISPLAY "     -----  "
               WHEN OTHER
                   DISPLAY "Valeur invalide !"
           END-EVALUATE.
           DISPLAY " ".

       CALCULER-TENSOR.
           DISPLAY "Entrez le premier qubit (0 ou 1) : ".
           ACCEPT QUBIT-1.
           PERFORM AFFICHER-QUBIT.
           DISPLAY "Entrez le deuxième qubit (0 ou 1) : ".
           ACCEPT QUBIT-2.
           PERFORM AFFICHER-QUBIT.

           STRING "python3 Quantum_tensor.py " QUBIT-1 " " QUBIT-2
               INTO CMD-LINE.

           CALL "SYSTEM" USING CMD-LINE.
           PERFORM AFFICHER-RESULTAT.
           PERFORM MAIN-MENU.

       CALCULER-INTRICATION.
           DISPLAY "Entrez le premier qubit (0 ou 1) : ".
           ACCEPT QUBIT-1.
           PERFORM AFFICHER-QUBIT.
           DISPLAY "Entrez le deuxième qubit (0 ou 1) : ".
           ACCEPT QUBIT-2.
           PERFORM AFFICHER-QUBIT.

           STRING "python3 Quantum_intrication.py " QUBIT-1 " " QUBIT-2
               INTO CMD-LINE.

           CALL "SYSTEM" USING CMD-LINE.
           PERFORM AFFICHER-RESULTAT.
           PERFORM MAIN-MENU.

       CALCULER-HADAMARD.
           DISPLAY "Entrez un qubit (0 ou 1) : ".
           ACCEPT QUBIT-1.
           PERFORM AFFICHER-QUBIT.

           STRING "python3 Quantum_hadamard.py " QUBIT-1
               INTO CMD-LINE.

           CALL "SYSTEM" USING CMD-LINE.
           PERFORM AFFICHER-RESULTAT.
           PERFORM MAIN-MENU.

       CALCULER-PAULI-X.
           DISPLAY "Entrez un qubit (0 ou 1) : ".
           ACCEPT QUBIT-1.
           PERFORM AFFICHER-QUBIT.

           STRING "python3 Quantum_gates.py X " QUBIT-1
               INTO CMD-LINE.

           CALL "SYSTEM" USING CMD-LINE.
           PERFORM AFFICHER-RESULTAT.
           PERFORM MAIN-MENU.

       CALCULER-PAULI-Z.
           DISPLAY "Entrez un qubit (0 ou 1) : ".
           ACCEPT QUBIT-1.
           PERFORM AFFICHER-QUBIT.

           STRING "python3 Quantum_gates.py Z " QUBIT-1
               INTO CMD-LINE.

           CALL "SYSTEM" USING CMD-LINE.
           PERFORM AFFICHER-RESULTAT.
           PERFORM MAIN-MENU.

       CALCULER-CNOT.
           DISPLAY "Entrez le premier qubit (0 ou 1) : ".
           ACCEPT QUBIT-1.
           PERFORM AFFICHER-QUBIT.
           DISPLAY "Entrez le deuxième qubit (0 ou 1) : ".
           ACCEPT QUBIT-2.
           PERFORM AFFICHER-QUBIT.

           STRING "python3 Quantum_gates.py CNOT " QUBIT-1 " " QUBIT-2
               INTO CMD-LINE.

           CALL "SYSTEM" USING CMD-LINE.
           PERFORM AFFICHER-RESULTAT.
           PERFORM MAIN-MENU.

           AFFICHER-RESULTAT.
           OPEN INPUT RESULT-TEXT-FILE.
           READ RESULT-TEXT-FILE INTO RESULT-LINE.
           DISPLAY "🔹 Résultat : " RESULT-LINE.
           CLOSE RESULT-TEXT-FILE.
           
           AFFICHER-LOGO.
           DISPLAY " ".
           DISPLAY "Bienvenue dans :".
           DISPLAY " ".
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 16
               DISPLAY LOGO (1:I) WITH NO ADVANCING
               CALL "CBL_OC_SLEEP" USING BY VALUE 500000
           END-PERFORM.
           DISPLAY " ".
           DISPLAY "-------------------------".

       