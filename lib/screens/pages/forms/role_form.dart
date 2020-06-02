import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:eshop/graphql/roleQueryMutation.dart';

class RoleForm extends StatefulWidget {
  @override
  _RoleFormState createState() => _RoleFormState();
}

class _RoleFormState extends State<RoleForm> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Role'),
        actions: <Widget>[
          // Builder(
          //   builder: (context) => IconButton(
          //     icon: Icon(Icons.check),
          //     tooltip: 'New Role',
          //     onPressed: () {
          //       if (_formKey.currentState.validate()) {

          //         // If the form is valid, display a Snackbar.
          //         Scaffold.of(context).showSnackBar(SnackBar(
          //             content: Text('Processing Data ${myController.text}')));
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
      body: Builder(
        builder: (context) => Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: myController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Mutation(
                options: MutationOptions(
                  documentNode: gql(createRole),
                  // or do something with the result.data on completion
                  onCompleted: (dynamic resultData) {
                    print(resultData);
                  },
                ),
                builder: (
                  RunMutation runMutation,
                  QueryResult result,
                ) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          runMutation({
                            'name': myController.text,
                          });
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('You have successfully added')));
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Submit'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
