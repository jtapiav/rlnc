#ifndef FINITE_H_
#define FINITE_H_

#include <fstream>
#include <iostream>

class FiniteField {
    public:
        int add( int a, int b );
        int sub( int a, int b );
        int mult( int a, int b );
        int div( int a, int b );
        int modulo( int a, int b );
    //private:    
};

#endif /* FINITEFIELD_H_ */