import 'package:flutter/material.dart';
import 'package:untitled/Repository/Managers_Repository.dart';

class ManagerPage extends StatefulWidget {
  final ManagerRepository managerRepository;
  const ManagerPage(this.managerRepository,{super.key});

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DigiNova Managers Page'),
        backgroundColor: Colors.green,
      ),
      body:Stack(
        children: [
          Positioned.fill(
            child: Image.network('https://media.licdn.com/dms/image/C4D0BAQE9tzqrAoU5oA/company-logo_200_200/0/1630465534843?e=2147483647&v=beta&t=bsQsKs0GYfDuHeVRboLb3ug_81qGnk1iRjcdYFpxujQ',
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
                    padding:const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                    child: Text('${widget.managerRepository.managers.length} Managers'),
                  )
                ),
              ),
              Expanded(child:
              ListView.separated(
                itemBuilder: (context,index)=>ManagerLine(
                  widget.managerRepository.managers[index],
                  widget.managerRepository
                ),
                separatorBuilder: (context,index)=>const Divider(),
                itemCount: widget.managerRepository.managers.length,
              )

              )
            ],
          ),
        ],
      )

    );
  }
}

class ManagerLine extends StatefulWidget {
  final Manager manager;
  final ManagerRepository managerRepository;
  const ManagerLine(this.manager, this.managerRepository,{
    super.key,
  });

  @override
  State<ManagerLine> createState() => _ManagerLineState();
}

class _ManagerLineState extends State<ManagerLine> {
  @override
  Widget build(BuildContext context) {
    bool amILike = widget.managerRepository.amILike(widget.manager);
    return ListTile(
      title: Text('${widget.manager.name} ${widget.manager.surname}'),
      leading: Text(widget.manager.gender == 'Female' ? 'F' : 'M'),
      trailing: IconButton(
          onPressed:(){
            setState(() {
              widget.managerRepository.like(widget.manager, !amILike);
            });
          },
          icon: Icon(widget.managerRepository.amILike(widget.manager) ? Icons.favorite : Icons.favorite_border)
      ),
    );
  }
}
