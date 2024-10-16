      PROGRAM HLLWLD
C
C DEMI ZHENG
C OCTOBER 10, 2024
C
C Project Name: Hello World in FORTRAN 77
C
C Description: Prints "HELLO WORLD" to the console by calling a subroutine.
C

C
C PARAMETERS
C
C None
C

C
C LOCAL VARIABLES
C
C None
C

C
C FUNCTION DECLARATIONS
C
C None
C

C
C COMMON VARIABLES
C
C None
C

C
C DATA STATEMENTS
C
C None
C

C
C MAIN PROGRAM MODULE
C 
C Description: Calls the subroutine PHELLOW to print
C              "HELLO WORLD" to the console.
C
      CALL PHELLOW()
      STOP
      END PROGRAM

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C SUBROUTINES
C

C
C PHELLOW: Prints "HELLO WORLD" to the console
C          1. Uses a WRITE statement to output the message
C          2. a FORMAT statement specifies the format to be
C             of type 'A', denoting a character string.
C
      SUBROUTINE PHELLOW()
C
      WRITE(*,100) 'HELLO WORLD'
 100  FORMAT(A)
C
      RETURN
      END

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C FUNCTIONS
C
C None
C

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C BLOCK DATA
C
C None
C
