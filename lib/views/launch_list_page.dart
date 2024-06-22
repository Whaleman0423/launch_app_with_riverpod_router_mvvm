part of '../constants/values.dart';

class LaunchListPage extends ConsumerStatefulWidget {
  const LaunchListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LaunchListPageState();
}

class _LaunchListPageState extends ConsumerState<LaunchListPage> {
  bool isNavigating = false;
  bool ascending = true;

  @override
  Widget build(BuildContext context) {
    final launches = ref.watch(launchViewModelProvider);
    final launchViewModel = ref.read(launchViewModelProvider.notifier);

    // 調用 fetchLaunches 方法，取得 launch 資料清單
    WidgetsBinding.instance.addPostFrameCallback((_) {
      launchViewModel.fetchLaunches();
    });

    // 對 launches 按照 flightNumber 排序
    final sortedLaunches = launches
      ..sort((a, b) => ascending
          ? a.flightNumber.compareTo(b.flightNumber)
          : b.flightNumber.compareTo(a.flightNumber));

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Launches'),
      ),
      body: sortedLaunches.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async => await launchViewModel.fetchLaunches(),
              child: launchListWidget(sortedLaunches),
            ),
    );
  }

  Widget launchListWidget(List<Launch> launches) {
    return Column(
      children: [
        sortListTileButton(),
        Expanded(
          child: ListView.builder(
            itemCount: launches.length,
            itemBuilder: (context, index) {
              final launch = launches[index];

              return launchListTile(launch);
            },
          ),
        ),
      ],
    );
  }

  Widget launchListTile(Launch launch) {
    return ListTile(
      trailing: cachedImage(launch.missionPatchSmall ?? ""),
      title: launchListTileTitle(launch),
      subtitle: launchListTileSubtitle(launch),
      onTap: () {
        if (!isNavigating) {
          setState(() => isNavigating = true);

          context.push('/launch/${launch.flightNumber}').then((_) {
            setState(() => isNavigating = false);
          });
        }
      },
    );
  }

  Widget launchListTileTitle(Launch launch) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flight ${launch.flightNumber}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          launch.missionName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget launchListTileSubtitle(Launch launch) {
    final formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss')
        .format(DateTime.parse(launch.launchDateUtc));
    return Text(
      formattedDate,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget sortListTileButton() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SortButton(
        text: 'Flight number',
        ascending: ascending,
        onPressed: () {
          setState(() {
            ascending = !ascending;
          });
        },
      ),
    );
  }
}
