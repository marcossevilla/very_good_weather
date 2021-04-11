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
  final formKey = GlobalKey<FormFieldState>();
  final textController = TextEditingController();

  void submitQuery() async {
    if (formKey.currentState!.validate()) {
      final query = textController.text;
      await context.read<SearchCubit>().searchLocation(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text(l10n.appName)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SearchField(
                formKey: formKey,
                textController: textController,
              ),
            ),
          ),
          const SearchBody(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitQuery,
        child: const Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.formKey,
    required this.textController,
  }) : super(key: key);

  final GlobalKey<FormFieldState> formKey;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return TextFormField(
      key: formKey,
      controller: textController,
      validator: (value) => value!.isEmpty ? l10n.writeSomething : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        hintText: l10n.searchLocation,
        enabledBorder: InputBorder.none,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.accentColor, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
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
          initial: () => SliverText(
            key: const Key('searchPage_noLocationsText'),
            message: l10n.noLocations,
          ),
          loading: () => const SliverLoader(),
          loaded: (locations) => LocationsList(locations: locations),
          error: (error) => SliverText(
            key: const Key('searchPage_errorSearchText'),
            message: error ?? l10n.generalError,
          ),
        );
      },
    );
  }
}
