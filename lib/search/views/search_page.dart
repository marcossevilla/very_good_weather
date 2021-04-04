import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_weather/search/cubit/search_cubit.dart';
import '../widgets/widgets.dart';

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

  void submitQuery() async {
    final query = textController.text;
    await context.read<SearchCubit>().searchLocation(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('Input a location')),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(controller: textController),
            ),
          ),
          const SearchBody(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitQuery,
        child: const Icon(Icons.search),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({
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
          loading: () => const SliverLoader(),
          loaded: (locations) => LocationsList(locations: locations),
          error: (error) => SliverText(
            message: error ?? 'Oops, something went wrong!',
          ),
        );
      },
    );
  }
}
