import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/constants/values.dart';

void main() {
  group('Launch', () {
    test('fromJson creates a Launch instance from a valid JSON object', () {
      final json = {
        'flight_number': 42,
        'mission_name': 'Test Mission',
        'launch_date_utc': '2022-03-14T00:00:00Z',
        'links': {
          'mission_patch': 'https://example.com/patch.png',
          'mission_patch_small': 'https://example.com/patch_small.png',
        },
        'upcoming': true,
        'launch_success': null,
        'rocket': {'rocket_name': 'Falcon 9', 'rocket_type': 'FT'},
        'launch_site': {
          'site_name': 'KSC LC 39A',
          'site_name_long': 'Kennedy Space Center Launch Complex 39A'
        },
        'details': 'This is a test mission.',
      };

      final launch = Launch.fromJson(json);

      expect(launch.flightNumber, 42);
      expect(launch.missionName, 'Test Mission');
      expect(launch.launchDateUtc, '2022-03-14T00:00:00Z');
      expect(launch.missionPatch, 'https://example.com/patch.png');
      expect(launch.missionPatchSmall, 'https://example.com/patch_small.png');
      expect(launch.upcoming, true);
      expect(launch.launchSuccess, null);
      expect(launch.rocket['rocket_name'], 'Falcon 9');
      expect(launch.launchSite['site_name'], 'KSC LC 39A');
      expect(launch.details, 'This is a test mission.');
    });
  });
}
