#ifndef TESTCLASS_H
#define TESTCLASS_H

class TestClass {
    public:
    
        int x, y;
    
        TestClass();

	TestClass(int a);
        
        virtual ~TestClass();

	bool signOfa();
        
        inline int Multiply(int a, int b){
            return a*b;
        }
    private:
	
	int a;
};

#endif

