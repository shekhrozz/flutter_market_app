import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_market_app/service/dio_network_src.dart';
import 'package:flutter_market_app/model/users_model.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
     body: FutureBuilder<Map<String,dynamic>?>(
      future: DioNetworkSrc.getRequest<Map<String,dynamic>>(
        api:AppNetworkConst.usersssss),
      builder:(context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const CupertinoActivityIndicator();
        }

        if(!snapshot.hasData|| snapshot.hasError){
          return const Text('You have not data or have error');
        }
       UsersWrapper usersWrapper=UsersWrapper.fromJson(snapshot.data!); // tushunarsiz joyi
        return  ListView.builder(
          shrinkWrap: true,
          itemCount: usersWrapper.users!.length,
          itemBuilder:(context, index) {
            Users? user =usersWrapper.users![index];

            return Card(
              child: ListTile(
            leading: Image.network(user.image!,
            loadingBuilder:(context, child, loadingProgress) {
              return child;
              
            },
            errorBuilder:(context, error, stackTrace) => CircularProgressIndicator(),
            ),    
            title: Text(user.firstName?? 'First name' ),
            subtitle: Text(user.userAgent?? 'User agaent'),
              ),
            );
          },
          );  
      },
      ),
    );
  }
}