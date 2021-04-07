import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_weather/l10n/l10n.dart';

import '../cubit/search_cubit.dart';
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
    final l10n = context.l10n;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text(l10n.searchLocation)),
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
    final l10n = context.l10n;

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (_, state) {
        return state.when(
          initial: () => SliverText(message: l10n.noLocations),
          loading: () => const SliverLoader(),
          loaded: (locations) => LocationsList(locations: locations),
          error: (error) => SliverText(message: error ?? l10n.generalError),
        );
      },
    );
  }
}
