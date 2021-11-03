#include <iostream>

using namespace std;
class A{
 public:
 virtual void p(){cout << "A.p"<< endl;}
 void t(){cout << "A.t" << endl;}
 virtual void r(){p(); t();}
};
class B: public A{
 public:
void p(){cout << "B.p" << endl;}
};
class C: public B{
 public:
void t(){cout << "C.t" << endl;}
void r(){t(); p();}
};
int main(){
A a; C c; a = c; a.r();
A* ap = new B; ap -> r();
A* ap1 = new C; ap1 -> r();
}
