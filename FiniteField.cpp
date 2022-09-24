#include <iostream>
#include <iomanip>
#include "FiniteField.h"

int FiniteField::add( int a, int b ) {
    return a ^ b;
}

int FiniteField::sub( int a, int b ) {
    return a ^ b;
}

int FiniteField::mult( int a, int b ) {
    int a_auxiliar = 0;
    int b_auxiliar = 0;
    int c;

    while ( a != 1 && a > 0  ) {
        if( a % 2 ) {
            c = c ^ b;
            a_auxiliar = a >> 1;
            b_auxiliar = b << 1;

            a = a_auxiliar;
            b = b_auxiliar;
        }
    }
    return c;
}


int FiniteField::div( int a, int b  ) {
    
}