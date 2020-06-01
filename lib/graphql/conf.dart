import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(
    // uri: 'https://api.github.com/graphql',
    // uri: 'https://examplegraphql.herokuapp.com/graphql'
    uri: 'http://10.0.2.2:4000/api/graphql'
  );

  static AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer 75e7adacf4f85fd2a5e857428212ef956133fddb',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  static Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );
}
