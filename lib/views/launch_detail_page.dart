part of '../constants/values.dart';

class LaunchDetailPage extends ConsumerWidget {
  final String id;

  const LaunchDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final launches = ref.read(launchViewModelProvider);
    Launch launch =
        launches.firstWhere((element) => element.flightNumber.toString() == id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Launch Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mission Name: ${launch.missionName}',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 10),
              Text('Flight Number: ${launch.flightNumber}',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text(
                  'Launch Date: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(launch.launchDateUtc))}',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text(
                  'Launch Success: ${launch.launchSuccess != null ? (launch.launchSuccess! ? "Yes" : "No") : "N/A"}',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('Details',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 10),
              Text(launch.details ?? "No details available",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),
              Text('Rocket Information',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 10),
              Text('Rocket Name: ${launch.rocket['rocket_name']}',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text('Rocket Type: ${launch.rocket['rocket_type']}',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 10),
              Text('First Stage Cores',
                  style: Theme.of(context).textTheme.bodyLarge),
              ...launch.rocket['first_stage']['cores'].map<Widget>((core) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text('Core Serial: ${core['core_serial']}',
                      style: Theme.of(context).textTheme.bodyMedium),
                );
              }).toList(),
              const SizedBox(height: 10),
              Text('Second Stage Payloads',
                  style: Theme.of(context).textTheme.bodyLarge),
              ...launch.rocket['second_stage']['payloads']
                  .map<Widget>((payload) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text('Payload ID: ${payload['payload_id']}',
                      style: Theme.of(context).textTheme.bodyMedium),
                );
              }).toList(),
              const SizedBox(height: 20),
              Text('Launch Site',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 10),
              Text('Site Name: ${launch.launchSite['site_name']}',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text('Site Name Long: ${launch.launchSite['site_name_long']}',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text('Links & Media',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 10),
              if (launch.missionPatch != null)
                cachedImage(launch.missionPatch!),
              if (launch.links['article_link'] != null)
                TextButton(
                  onPressed: () =>
                      _navigateToWebView(context, launch.links['article_link']),
                  child: Text('Article Link',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.blue)),
                ),
              if (launch.links['video_link'] != null)
                TextButton(
                  onPressed: () =>
                      _navigateToWebView(context, launch.links['video_link']),
                  child: Text('Video Link',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.blue)),
                ),
              if (launch.links['wikipedia'] != null)
                TextButton(
                  onPressed: () =>
                      _navigateToWebView(context, launch.links['wikipedia']),
                  child: Text('Wikipedia Link',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.blue)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToWebView(BuildContext context, String url) {
    context.push('/webview', extra: url);
  }
}
