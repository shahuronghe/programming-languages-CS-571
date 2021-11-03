class A
{ public void p() { System.out.println("A.p");}
 public void s() { System.out.println("A.s");}
 public void r() { p(); s();}
}
class B extends A
{ public void p() { System.out.println("B.p");}
}
class C extends B
{ public void s() { System.out.println("C.s");}
 public void r() { s(); p();}
}
public class program1{
public static void main(String args[]){
A a = new B();
a.r();
a = new C();
a.r();
}
}
