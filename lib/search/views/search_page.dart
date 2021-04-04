import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_weather/search/cubit/search_cubit.dart';
import 'package:very_good_weather/search/widgets/sliver_text.dart';
import 'package:very_good_weather/weather/weather.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => const SearchPage());
  }

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        searchLocation: SearchLocation(
          repository: context.read<WeatherRepository>(),
        ),
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(title: Text('Input a location')),
            SliverToBoxAdapter(
              child: TextField(controller: textController),
            ),
            const SearchConsumer(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class SearchConsumer extends StatelessWidget {
  const SearchConsumer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (_, state) {
        return state.when(
          initial: () => const SliverText(
            message: 'Search for some locations!',
          ),
          loading: () => const Loader(),
          loaded: (locations) => LocationsList(locations: locations),
          error: (error) => SliverText(
            message: error ?? 'Oops, something went wrong!',
          ),
        );
      },
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class LocationsList extends StatelessWidget {
  const LocationsList({
    Key? key,
    required this.locations,
  }) : super(key: key);

  final List<LocationResponse> locations;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        for (final location in locations)
          ListTile(title: Text(location.title ?? '')),
      ]),
    );
  }
}
