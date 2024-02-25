class ManagerRepository{
  List managers = [
    Manager('Uğur','Yıldız',25,'Male'),
    Manager('İrem', 'Deniz', 22, 'Female')
  ];

  final Set<Manager> likedManagers = {};

  void like(Manager manager, bool amILike) {
    if(amILike){
      likedManagers.add(manager);
    }
    else likedManagers.remove(manager);
  }

  bool amILike(Manager manager){
    return likedManagers.contains(manager);
  }
}

class Manager{
  String name;
  String surname;
  int age;
  String gender;

  Manager(this.name,this.surname,this.age,this.gender);
}