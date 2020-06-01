import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:eshop/graphql/queryMutation.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Query(
        options: QueryOptions(
          documentNode: gql(QueryMutation()
              .getAll()), // this is the query string you just created
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
