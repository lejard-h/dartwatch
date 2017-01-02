// GENERATED CODE - DO NOT MODIFY BY HAND

part of api;

// **************************************************************************
// Generator: ApiGenerator
// Target: class DartWatchApi
// **************************************************************************

abstract class _$JaguarDartWatchApi implements RequestHandler {
  static const List<RouteBase> routes = const <RouteBase>[
    const Route('/list-posts',
        methods: const ["GET"],
        headers: const {"Access-Control-Allow-Origin": "*"}),
    const Route('/list-pub',
        methods: const ["GET"],
        headers: const {"Access-Control-Allow-Origin": "*"})
  ];

  String listPosts(
      {int limit: 10,
      String from,
      String to,
      int sort: -1,
      bool so: true,
      bool dl: true,
      bool da: true});

  String listPub();

  Future<bool> handleRequest(HttpRequest request, {String prefix: ''}) async {
    PathParams pathParams = new PathParams();
    bool match = false;
    QueryParams queryParams = new QueryParams(request.uri.queryParameters);

    match =
        routes[0].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response rRouteResponse = new Response(null);
      rRouteResponse.statusCode = 200;
      rRouteResponse.headers['Access-Control-Allow-Origin'] = '*';
      rRouteResponse.value = listPosts(
        limit: stringToInt(queryParams.getField('limit')) ?? 10,
        from: (queryParams.getField('from')),
        to: (queryParams.getField('to')),
        sort: stringToInt(queryParams.getField('sort')) ?? -1,
        so: stringToBool(queryParams.getField('so')) ?? true,
        dl: stringToBool(queryParams.getField('dl')) ?? true,
        da: stringToBool(queryParams.getField('da')) ?? true,
      );
      await rRouteResponse.writeResponse(request.response);
      return true;
    }

    match =
        routes[1].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response rRouteResponse = new Response(null);
      rRouteResponse.statusCode = 200;
      rRouteResponse.headers['Access-Control-Allow-Origin'] = '*';
      rRouteResponse.value = listPub();
      await rRouteResponse.writeResponse(request.response);
      return true;
    }

    return false;
  }
}
