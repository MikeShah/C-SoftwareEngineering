#include <iostream>
class T{
    public:
        static int counter;
        static void test(){
            counter++;
            std::cout << "how many T's are there? " << counter << std::endl;
        }

    T(){
        test();
    }

};

int T::counter = 0;

void foo(){
    static int i=0;
    i++;

    std::cout << "i is: " << i << std::endl;
}

int main(){

    T::test();
    T::test();
    T::test();
    T::test();
    T::test();
    T::test();


    return 0;
}
