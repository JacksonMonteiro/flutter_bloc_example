import 'package:bloc/app/blocs/users/user_bloc.dart';
import 'package:bloc/app/blocs/users/user_state.dart';
import 'package:bloc/app/blocs/users/users_events.dart';
import 'package:bloc/app/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final UserBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = UserBloc();
    bloc.inputUser.add(LoadUsersEvent());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.inputUser.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: StreamBuilder<UserState>(
            stream: bloc.stream,
            builder: (context, snapshot) {
              return (snapshot.data?.isLoading == true)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data?.users.length,
                      itemBuilder: (context, i) => ListTile(
                            leading: CircleAvatar(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Text(
                                    "${snapshot.data?.users[i].name.substring(0, 1)}"),
                              ),
                            ),
                            title: Text("${snapshot.data?.users[i].name}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                bloc.inputUser.add(RemoveUserEvent(
                                    user:
                                        snapshot.data?.users[i] as UserModel));
                              },
                            ),
                          ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.inputUser
                .add(AddUserEvent(user: UserModel(name: 'Usuário adicionado')));
          },
          child: const Icon(Icons.add)),
    );
  }
}
