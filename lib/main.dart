import 'package:fixture/bloc/team_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fixture/screen/team_list.dart';
import 'package:fixture/screen/team_detail.dart';
import 'package:fixture/bloc/team_list_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => TeamListBloc()),
        ChangeNotifierProvider(builder: (_) => TeamDetailBloc()),
      ],
      child: Consumer<TeamListBloc>(
        builder: (context, counter, _) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: TeamList(),
            routes: {
              "team-detail": (context) => TeamDetail(),
            },
          );
        },
      ),
    );
  }
}
