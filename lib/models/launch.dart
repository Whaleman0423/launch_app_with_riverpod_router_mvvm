part of '../constants/values.dart';

class Launch {
  final int flightNumber;
  final String missionName;
  final String launchDateUtc;
  final String? missionPatch;
  final String? missionPatchSmall;
  final bool upcoming;
  final bool? launchSuccess;
  final Map<String, dynamic>? launchFailureDetails;
  final Map<String, dynamic> rocket;
  final Map<String, dynamic> launchSite;
  final Map<String, dynamic> links;
  final String? details;

  Launch({
    required this.flightNumber,
    required this.missionName,
    required this.launchDateUtc,
    this.missionPatch,
    this.missionPatchSmall,
    required this.upcoming,
    this.launchSuccess,
    this.launchFailureDetails,
    required this.rocket,
    required this.launchSite,
    required this.links,
    this.details,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      flightNumber: json['flight_number'],
      missionName: json['mission_name'],
      launchDateUtc: json['launch_date_utc'],
      missionPatch: json['links']['mission_patch'],
      missionPatchSmall: json['links']['mission_patch_small'],
      upcoming: json['upcoming'],
      launchSuccess: json['launch_success'],
      launchFailureDetails: json['launch_failure_details'] != null
          ? json['launch_failure_details'] as Map<String, dynamic>
          : null,
      rocket: json['rocket'] as Map<String, dynamic>,
      launchSite: json['launch_site'] as Map<String, dynamic>,
      links: json['links'] as Map<String, dynamic>,
      details: json['details'],
    );
  }
}
