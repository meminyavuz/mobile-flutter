import 'dart:html';

class EmployeeRepository{
  List employees = [
    Employee('Mehmet','Yavuz',21,'Male'),
    Employee('Zeynep', 'Yavuz', 23, 'Female')
  ];

  final Set<Employee> likedEmployees = {};

  void like(Employee employee, bool amILike) {
    if(amILike){
      likedEmployees.add(employee);
    }
    else likedEmployees.remove(employee);
  }

  bool amILike(Employee employee){
    return likedEmployees.contains(employee);
  }
}

class Employee{
  String name;
  String surname;
  int age;
  String gender;

  Employee(this.name,this.surname,this.age,this.gender);
}