import 'package:chopper/chopper.dart';
import 'dart:async';
import 'package:infinity_list/core/utils/url.dart';

part 'api_services.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class ApiService extends ChopperService {
  static ApiService create() {
    final client = ChopperClient(
      baseUrl: Url.publicUrl,
      services: [
        _$ApiService(),
      ],
      converter: JsonConverter(),
    );

    return _$ApiService(client);
  }

  @Get(path: '/2.2/questions?page={page}&pagesize=20&order=desc&sort=activity&site=stackoverflow')
  Future<Response> getPosts(@Path() int page);

  @Get(path: '/entries?https=true')
  Future<Response> getRandomData();
}