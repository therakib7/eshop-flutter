import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(
    // uri: 'https://api.github.com/graphql',
    // uri: 'https://examplegraphql.herokuapp.com/graphql'
    uri: 'http://10.0.2.2:4000/api/graphql'
  );

  static AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJlc2hvcCIsImF1dGhfdGltZSI6MTU4OTY4ODE3NiwiZXhwIjoxNTkyMjgwMTc2LCJpYXQiOjE1ODk2ODgxNzYsImlzcyI6ImVzaG9wIiwianRpIjoiNDgxOTdiMzUtMjVkOC00ODBlLTllYWYtMzJkYmZhNzEwMDU0IiwibmJmIjoxNTg5Njg4MTc1LCJzdWIiOiI0IiwidHlwIjoiYWNjZXNzIn0.8psxLYmqlVZzG-i_YfIyGH1RxZ7xqnLyumrumBZGA6elFsWjuymAehkKNr0WAxq9o_8x0ldI4M_TI2jMemHr9g',
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
