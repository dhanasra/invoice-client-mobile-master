import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLObject graphQlObject = GraphQLObject();

class GraphQLObject {
  late Map<String, dynamic> graphqlQuery;
  late GraphQLClient graphQLClient;

  Future<void> loadGraphQLJson(String res) async{
    if(res.toString().split("_").contains("graphql")){
      String data = await rootBundle.loadString("res/$res.json");
      graphqlQuery = json.decode(data);
    }
  }

  ValueNotifier<GraphQLClient> getGraphQlClient() {
    graphQLClient = GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: HttpLink("https://im-api.herokuapp.com/"),
    );
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      graphQLClient,
    );
    return client;
  }


  Future<Map<String, dynamic>?> getQueryValues(GraphQLClient graphQLClient,String query,Map<String, dynamic> variables) async{
    var options = await graphQLClient.query(
      QueryOptions(
        document: gql(graphQlObject.getGraphqlQuery(query)),
        variables: variables,
        fetchPolicy: FetchPolicy.noCache,
        pollInterval: const Duration(seconds: 10),
      ),
    );
    Map<String, dynamic>? data = options.data;
    return data;
  }


  Future<Map<String, dynamic>?> getMutationValues(GraphQLClient graphQLClient,String mutation,Map<String, dynamic> variables) async{
    Map<String, dynamic>? data = (await graphQLClient.mutate(
      MutationOptions(
        document: gql(graphQlObject.getGraphqlQuery(mutation)),
        variables: variables,
      ),
    )).data;
    print(mutation);
    print(variables);
    print(data);
    return data;
  }

  String getGraphqlQuery(String key){
    return graphqlQuery[key];
  }

}