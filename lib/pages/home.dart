import 'package:flutter/material.dart';
import 'package:mobile_developer_test/models/models.dart';
import 'package:mobile_developer_test/services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async{
    final response = await UserService.fetchUsers();
    setState(() {
      users = response;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Mobile Developer'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          final name = user.firstName;
          final imageUrl = user.avatar;
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),),
              title: Text(name),
              subtitle: Text(email),
                ),
          );
        },
      ),
      
    );
  }

}
