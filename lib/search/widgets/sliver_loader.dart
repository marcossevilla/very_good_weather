import 'package:flutter/material.dart';

class SliverLoader extends StatelessWidget {
  const SliverLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
