      PROGRAM DAC
      IMPLICIT NONE
C
C DEMI ZHENG
C OCTOBER 14, 2024
C
C Title: File Line Counter in FORTRAN 77
C
C Description: A program that reads from a file and
C              prints out the number of lines in it
C

C
C PARAMETERS
C
C FUNIT represents the File Unit number used with
C the OPEN, READ, and REWIND statements
C
      INTEGER*8 FUNIT
      PARAMETER(FUNIT=18)

C
C LOCAL VARIABLES
C 
C FNAME is the name of the file you are opening
C
      CHARACTER*16 FNAME

C
C FUNCTION DECLARATIONS
C
C The function CNTER counts the number of lines in a file
C
      INTEGER*8 CNTER

C
C COMMON VARIABLES
C
C None
C

C
C DATA STATEMENTS
C
C Populates FNAME with the name of the file, 'array.txt'
C
      DATA FNAME /'array1.txt'/

C
C MAIN PROGRAM MODULE
C
C Description: Prints the number of line numbers in a file
C 1. Open the text file FNAME with unit FUNIT
C 2. Call the function CNTER, which returns the number of lines in the file
C 3. Print out the returned integer
C 4. A FORMAT statement specifies the format
C    to be of type 'I0', denoting an integer.
C 5. Close the file
C
      OPEN(FUNIT, FILE=FNAME)
      WRITE(*,1000) CNTER(FUNIT)
 1000 FORMAT(I0)
      CALL CREATE(FUNIT, CNTER(FUNIT))
      CLOSE(FUNIT)
      STOP
      END PROGRAM

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C SUBROUTINES
C
C None
C

      SUBROUTINE CREATE(FUNIT, COUNT)
      INTEGER*8 FUNIT
      INTEGER*8 COUNT
C
      INTEGER*4 ARRAY(COUNT)
      REAL*8 AVG
      REAL*8 MEAN
      REAL*8 STDDEV

      CALL LOAD(FUNIT, COUNT, ARRAY) 
      AVG = MEAN(COUNT, ARRAY)
      STDDEV = DEVIAT(COUNT, ARRAY)
C
      WRITE(*, 900) ARRAY(1)
      WRITE(*, 900) ARRAY(COUNT)
      WRITE(*, *) AVG
      RETURN
 900  FORMAT(I0)
      END SUBROUTINE

      SUBROUTINE LOAD(FUNIT, COUNT, ARRAY)
      INTEGER*8 FUNIT
      INTEGER*8 COUNT
      INTEGER*4 ARRAY(COUNT)
C
      INTEGER*8 IND

      IND=1
 400     READ(FUNIT, *, END=600) ARRAY(IND)
         IND=IND+1
         GO TO 400
 600  REWIND(FUNIT)
C
      RETURN
      END SUBROUTINE

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C FUNCTIONS
C

C
C CNTER: Counts the number of lines in a file
C @params FUNIT is the file unit
C @precondition the file is already open
C
      FUNCTION CNTER(FUNIT)
      INTEGER*8 CNTER
      INTEGER*8 FUNIT
C
      CNTER=0
      REWIND(FUNIT)
 500     READ(FUNIT, *, END=100)
         CNTER = CNTER + 1
         GO TO 500
 100  REWIND(FUNIT)
C
      RETURN
      END FUNCTION

      FUNCTION MEAN(COUNT, ARRAY)
      REAL*8 MEAN
      INTEGER*8 COUNT
      INTEGER*4 ARRAY(COUNT)
C
      INTEGER*8 IND

      MEAN=0
      IND=1
 700  IF (IND <= COUNT) THEN
         MEAN = MEAN + DBLE(ARRAY(IND))
         IND = IND + 1
         GOTO 700
      END IF
      MEAN = MEAN / DBLE(COUNT)
C
      RETURN
      END FUNCTION

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C BLOCK DATA
C
C None
C
