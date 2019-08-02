import 'package:flutter/material.dart';
import 'package:fixture/bloc/team_detail_bloc.dart';
import 'package:provider/provider.dart';

class TeamDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TeamDetailBloc teamDetailBloc = Provider.of<TeamDetailBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: teamDetailBloc.playerList.length,
          itemBuilder: (context, index) =>
              ListTile(subtitle: Text(teamDetailBloc.playerList[index].name))),
    );
  }
}
