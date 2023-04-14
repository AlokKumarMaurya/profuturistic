abstract class BaseApiService {
  Future<dynamic> getGetApiResponse({required String url});

  Future<dynamic> getPostApiResponse({required String url,required dynamic body});
}