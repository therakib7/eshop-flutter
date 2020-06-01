import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:eshop/graphql/roleQueryMutation.dart';

class Role extends StatefulWidget {
  @override
  _RoleState createState() => _RoleState();
}

class _RoleState extends State<Role> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Roles'),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'New Role',
        child: Icon(Icons.add),
      ),
      endDrawer: Drawer(
          child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    margin: new EdgeInsetsDirectional.only(bottom: 15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 1,
                          color: Colors.grey[300],
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['One', 'Two', 'Free', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ButtonTheme(
                          buttonColor: Theme.of(context).primaryColor,
                          minWidth: double.infinity,
                          height: 40.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Apply Filters",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )),
      body: Query(
        options: QueryOptions(
          documentNode:
              gql(getRoles), // this is the query string you just created
          variables: {
            'nRepositories': 50,
          },
          pollInterval: 10,
        ),
        // Just like in apollo refetch() could be used to manually trigger a refetch
        // while fetchMore() can be used for pagination purpose
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading) {
            return Text('Loading');
          }

          // it can be either Map or List
          List repositories = result.data['roles'];

          return ListView.builder(
              // shrinkWrap: true,
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                final repository = repositories[index];

                return Card(
                  child: ListTile(
                    title: Text(repository['name']),
                  ),
                );
              });
        },
      ),
    );
  }
}
