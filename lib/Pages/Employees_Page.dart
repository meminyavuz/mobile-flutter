import 'package:flutter/material.dart';
import 'package:untitled/Repository/Employees_Repository.dart';

class EmployeePage extends StatefulWidget {
  final EmployeeRepository employeeRepository;
  const EmployeePage(this.employeeRepository,{super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DigiNova Employees Page'),
        backgroundColor: Colors.green,
      ),
      body:Stack(
        children:[
          Positioned.fill(
            child: Image.network('https://media.licdn.com/dms/image/C4D0BAQE9tzqrAoU5oA/company-logo_200_200/0/1630465534843?e=2147483647&v=beta&t=bsQsKs0GYfDuHeVRboLb3ug_81qGnk1iRjcdYFpxujQ', // Arka plan resminin dosya yolu
              fit: BoxFit.none,
            ),
          ),
          Column(
            children: [
              PhysicalModel(
                color: Colors.white,
                elevation: 10,
                child: Center(
                  child: Padding(
                    padding:EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                    child: Text('${widget.employeeRepository.employees.length} Employees'),
                  )
                ),
              ),
              Expanded(child:
              ListView.separated(
                itemBuilder: (context,index)=>EmployeeLine(
                  widget.employeeRepository.employees[index],
                  widget.employeeRepository,
                ),
                separatorBuilder: (context,index)=>const Divider(),
                itemCount: widget.employeeRepository.employees.length,
              )

              )
            ],
          ),
        ],
      )

    );
  }
}

class EmployeeLine extends StatefulWidget {
  final Employee employee;
  final EmployeeRepository employeeRepository;
  const EmployeeLine(this.employee, this.employeeRepository, {
    super.key,
  });

  @override
  State<EmployeeLine> createState() => _EmployeeLineState();
}

class _EmployeeLineState extends State<EmployeeLine> {
  @override
  Widget build(BuildContext context) {
    bool amILike = widget.employeeRepository.amILike(widget.employee);
    return ListTile(
      title: Text('${widget.employee.name} ${widget.employee.surname}'),
      leading: Text(widget.employee.gender == 'Female' ? 'F' : 'M'),

      trailing: IconButton(
      onPressed: (){
        setState(() {
          widget.employeeRepository.like(widget.employee, !amILike);
        });
        },
      icon: Icon(widget.employeeRepository.amILike(widget.employee) ? Icons.favorite : Icons.favorite_border)
      ),
    );
  }
}
