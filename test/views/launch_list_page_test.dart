import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/values.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  testWidgets('LaunchListPage displays list of launches',
      (WidgetTester tester) async {
    final mockLaunches = [
      Launch(
        flightNumber: 1,
        missionName: 'FalconSat',
        launchDateUtc: '2006-03-24T22:30:00.000Z',
        upcoming: false,
        rocket: {'rocket_name': 'Falcon 1', 'rocket_type': 'Merlin A'},
        launchSite: {
          'site_name': 'Kwajalein Atoll',
          'site_name_long': 'Kwajalein Atoll Omelek Island'
        },
        links: {
          'mission_patch': 'https://images2.imgbox.com/40/e3/GypSkayF_o.png'
        },
        details: 'Engine failure at 33 seconds and loss of vehicle',
        launchSuccess: false,
      )
    ];

    final repository = LaunchRepository(client: MockClient((request) async {
      return http.Response(
          '[{"flight_number": 1, "mission_name": "FalconSat", "launch_date_utc": "2006-03-24T22:30:00.000Z", "links": {"mission_patch": "https://images2.imgbox.com/40/e3/GypSkayF_o.png", "mission_patch_small": "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png"}, "upcoming": false, "rocket": {"rocket_name": "Falcon 1", "rocket_type": "Merlin A", "first_stage": {"cores": [{"core_serial": "Merlin1A"}]}, "second_stage": {"payloads": [{"payload_id": "FalconSAT-2"}]}}, "launch_site": {"site_name": "Kwajalein Atoll", "site_name_long": "Kwajalein Atoll Omelek Island"}, "launch_success": false, "details": "Engine failure at 33 seconds and loss of vehicle"}]',
          200);
    }));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          launchViewModelProvider.overrideWith(
              (ref) => LaunchViewModel(repository)..state = mockLaunches),
        ],
        child: MaterialApp(
          home: LaunchListPage(),
        ),
      ),
    );

    expect(find.text('FalconSat'), findsOneWidget);
  });
}
