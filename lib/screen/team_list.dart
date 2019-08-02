import 'package:fixture/bloc/team_detail_bloc.dart';
import 'package:fixture/bloc/team_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fixture/components/loading.dart';

class TeamList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TeamListBloc teamListBloc = Provider.of<TeamListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Takım Listesi"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: teamListBloc.loading
              ? Loading()
              : ListView.builder(
                  itemCount: teamListBloc.teamList?.length,
                  itemBuilder: (context, itemIndex) => ListTile(
                        title: Text(teamListBloc.teamList[itemIndex].team),
                        onTap: () {
                          final TeamDetailBloc teamDetailBloc =
                              Provider.of<TeamDetailBloc>(context);
                          teamDetailBloc.team =
                              teamListBloc.teamList[itemIndex];
                          Navigator.of(context).pushNamed("team-detail");
                        },
                      )),
        ),
      ),
    );
  }
}
