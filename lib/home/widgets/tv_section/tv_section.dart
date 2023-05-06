import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftb/home/widgets/tv_section/tv_cards/tv_card.dart';

import '../../bloc/tv_bloc/tv_bloc.dart';

class TvSection extends StatefulWidget {
  const TvSection({Key? key}) : super(key: key);

  @override
  State<TvSection> createState() => _TvSectionState();
}

class _TvSectionState extends State<TvSection> {
  late TvBloc _tvBloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (prev, current) => prev != current,
      builder: (context, state) {
        _tvBloc = context.read<TvBloc>();
        return Column(
          children: [
            Visibility(
              visible: _tvBloc.state.status == TvStatus.idle,
              child: const Text("Search to see tv series"),
            ),
            Visibility(
              visible: _tvBloc.state.status == TvStatus.loading,
              child: const CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
            Visibility(
                visible: _tvBloc.state.status == TvStatus.succeeded,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.4,
                  padding: const EdgeInsets.all(16),
                  children: state.tvs.map((tv) => TvCard(tv)).toList(),
                )),
            Visibility(
                visible: _tvBloc.state.status == TvStatus.failed,
                child: const Text("Failed Movie")),
          ],
        );
      },
    );
  }
}
