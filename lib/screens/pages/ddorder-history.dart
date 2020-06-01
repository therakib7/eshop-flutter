import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:eshop/graphql/queryMutation.dart';

class OrderHistory extends StatefulWidget {
  OrderHistory({Key key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final newTaskController = TextEditingController();

  Future<String> onCreate(BuildContext context, id) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Mutation(
            options: MutationOptions(
              documentNode: gql(createTaskMutation),
            ),
            builder: (RunMutation runMutation, QueryResult result) {
              return AlertDialog(
                title: Text('Enter a new task'),
                content: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(
                            autofocus: true,
                            decoration: new InputDecoration(
                                labelText: 'Task description',
                                hintText: 'Do stuff',
                                errorText: result.hasException
                                    ? result.exception.toString()
                                    : null),
                            controller: newTaskController))
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      runMutation({'name': newTaskController.text});
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Query(
        options:
            QueryOptions(documentNode: gql(getTasksQuery), pollInterval: 5),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return Scaffold(
              appBar: AppBar(
                title: Text("TODO App With GraphQL"),
              ),
              body: Center(
                  child: result.hasException
                      ? Text(result.exception.toString())
                      : result.loading
                          ? CircularProgressIndicator()
                          : TaskList(
                              list: result.data['roles'], onRefresh: refetch)),
              floatingActionButton: FloatingActionButton(
                onPressed: () => !result.hasException && !result.loading
                    ? this.onCreate(context, result.data['roles'].length)
                    : () {},
                tooltip: 'New Task',
                child: Icon(Icons.add),
              ));
        });
  }
}

class TaskList extends StatelessWidget {
  TaskList({@required this.list, @required this.onRefresh});

  final list;
  final onRefresh;

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(documentNode: gql(updateTaskMutation)),
      builder: (RunMutation runMutation, QueryResult result) {
        return ListView.builder(
          itemCount: this.list.length,
          itemBuilder: (context, index) {
            final task = this.list[index];
             return ListTile(
                title: Text(task['name']), );
            // return CheckboxListTile(
            //     title: Text(task['name']),
            //     value: task['completed'],
            //     onChanged: (_) {
            //       runMutation(
            //           {'id': index + 1, 'completed': !task['completed']});
            //       onRefresh();
            //     });
          },
        );
      },
    );
  }
}
