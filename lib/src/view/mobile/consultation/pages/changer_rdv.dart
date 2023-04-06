import 'package:afya/src/viewModel/rendez_vous_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:afya/src/application_state.dart';
import 'package:afya/src/view/mobile/consultation/components/components.dart';

class ChangerRdv extends StatefulWidget {
  const ChangerRdv({super.key, this.title = 'Changer de rendez-vous'});

  final String title;

  @override
  State<ChangerRdv> createState() => _ChangerRdvState();
}

class _ChangerRdvState extends State<ChangerRdv> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(builder: (context, appState, child) {
      User? user;
      //si l'user est connecté uid contient son uid
      if (appState.loggedIn) {
        user = appState.currentUser!;
      }
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              titleChangerRdv(),
              ChangeNotifierProvider(
                create: (context) => RendezVousViewModel(),
                builder: ((context, child) => FormChangerRdv(
                      user: user,
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
