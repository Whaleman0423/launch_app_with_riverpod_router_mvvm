part of '../constants/values.dart';

class LaunchRepository {
  final http.Client client;
  final String _baseUrl = 'https://api.spacexdata.com/v3/launches';

  LaunchRepository({http.Client? client}) : client = client ?? http.Client();

  Future<List<Launch>> fetchLaunches() async {
    final response = await client.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Launch.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load launches');
    }
  }
}
