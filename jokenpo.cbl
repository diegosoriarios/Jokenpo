       IDENTIFICATION DIVISION.
       PROGRAM-ID. JOKENPO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 RAND-NUM PIC 9(2).
           01 PLAYER PIC A(10).
           01 PC PIC A(10).
           01 ROCK PIC A(8) VALUE "Pedra".
           01 SISSORS PIC A(8) VALUE "Tesoura".
           01 PAPPER PIC A(8) VALUE "Papel".
           01 BLAH PIC 99.
           01 CHOICE-INDEX PIC 9.
           01 CHOICES.
               05 CHOICE PIC A(8) OCCURS 3 TIMES.
           01 CURRENT-TIME.
                  05 T-MS PIC 999.
           01 RESULTADO PIC A(20) VALUE "Perdeu pra o Cobol ".
           
       PROCEDURE DIVISION.
           MOVE ROCK TO CHOICE(1).
           MOVE SISSORS TO CHOICE(2).
           MOVE PAPPER TO CHOICE(3).
           DISPLAY "Pedra, papel ou tesoura?".
           ACCEPT PLAYER.
           
           COMPUTE RAND-NUM = FUNCTION RANDOM (T-MS) * 100.
           DIVIDE RAND-NUM BY 3 GIVING BLAH REMAINDER CHOICE-INDEX.
           MOVE CHOICE(CHOICE-INDEX + 1) TO PC.
           
           IF PLAYER = PC
               MOVE "Empate!" TO RESULTADO
           END-IF.
           
           IF PLAYER = "Pedra" AND PC = "Tesoura"
               MOVE "Ganhou \o/" TO RESULTADO
           END-IF.
           
           IF PLAYER = "Tesoura" AND PC = "Papel"
               MOVE "Ganhou \o/" TO RESULTADO
           END-IF.
           
           IF PLAYER = "Papel" AND PC = "Pedra"
               MOVE "Ganhou \o/" TO RESULTADO
           END-IF.
           
           DISPLAY RESULTADO.
       STOP RUN.
       