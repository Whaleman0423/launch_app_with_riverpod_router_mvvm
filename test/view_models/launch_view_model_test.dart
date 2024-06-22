import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/constants/values.dart';

void main() {
  group('LaunchViewModel', () {
    test('fetchLaunches updates state with data from repository', () async {
      final mockClient = MockClient((request) async {
        return http.Response(
            '[{"flight_number": 1, "mission_name": "FalconSat", "launch_date_utc": "2006-03-24T22:30:00.000Z", "links": {"mission_patch": "https://images2.imgbox.com/40/e3/GypSkayF_o.png", "mission_patch_small": "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png"}, "upcoming": false, "rocket": {"rocket_name": "Falcon 1", "rocket_type": "Merlin A", "first_stage": {"cores": [{"core_serial": "Merlin1A"}]}, "second_stage": {"payloads": [{"payload_id": "FalconSAT-2"}]}}, "launch_site": {"site_name": "Kwajalein Atoll", "site_name_long": "Kwajalein Atoll Omelek Island"}, "launch_success": false, "details": "Engine failure at 33 seconds and loss of vehicle"}]',
            200);
      });

      final repository = LaunchRepository(client: mockClient);
      final viewModel = LaunchViewModel(repository);

      await viewModel.fetchLaunches();

      expect(viewModel.state.length, 1);
      expect(viewModel.state.first.missionName, 'FalconSat');
    });

    test('fetchLaunches handles error properly', () async {
      final mockClient = MockClient((request) async {
        return http.Response('Not Found', 404);
      });

      final repository = LaunchRepository(client: mockClient);
      final viewModel = LaunchViewModel(repository);

      await viewModel.fetchLaunches();

      // Check that the state is still an empty list after the error
      expect(viewModel.state, isEmpty);
    });
  });
}
