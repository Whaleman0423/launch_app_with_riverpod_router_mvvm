import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:flutter_application_1/constants/values.dart';

void main() {
  group('LaunchRepository', () {
    test(
        'fetchLaunches returns a list of Launch objects on successful response',
        () async {
      final mockClient = MockClient((request) async {
        return http.Response(
            '[{"flight_number": 1, "mission_name": "FalconSat", "launch_date_utc": "2006-03-24T22:30:00.000Z", "links": {"mission_patch": "https://images2.imgbox.com/40/e3/GypSkayF_o.png", "mission_patch_small": "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png"}, "upcoming": false, "rocket": {"rocket_name": "Falcon 1", "rocket_type": "Merlin A", "first_stage": {"cores": [{"core_serial": "Merlin1A"}]}, "second_stage": {"payloads": [{"payload_id": "FalconSAT-2"}]}}, "launch_site": {"site_name": "Kwajalein Atoll", "site_name_long": "Kwajalein Atoll Omelek Island"}, "launch_success": false, "details": "Engine failure at 33 seconds and loss of vehicle"}]',
            200);
      });

      final repository = LaunchRepository(client: mockClient);
      final launches = await repository.fetchLaunches();

      // Check that the type of launches is List<Launch>
      expect(launches, isA<List<Launch>>());
      // Check that the first element is of type Launch
      expect(launches.first, isA<Launch>());
      // Check specific properties of the first launch
      expect(launches.first.missionName, 'FalconSat');
      expect(launches.first.flightNumber, 1);
      expect(launches.first.launchDateUtc, '2006-03-24T22:30:00.000Z');
      expect(launches.first.launchSuccess, false);
      expect(launches.first.details,
          'Engine failure at 33 seconds and loss of vehicle');
    });

    test('fetchLaunches throws an exception on error response', () async {
      final mockClient = MockClient((request) async {
        return http.Response('Not Found', 404);
      });

      final repository = LaunchRepository(client: mockClient);

      expect(repository.fetchLaunches, throwsA(isA<Exception>()));
    });
  });
}
