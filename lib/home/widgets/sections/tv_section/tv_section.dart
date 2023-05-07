import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftb/home/widgets/cards/tv_card/tv_card.dart';

import '../../../../common/constants/route_constants.dart';
import '../../../../common/enums/enums.dart';
import '../../../../common/models/tv_models/tv.dart';
import '../../../bloc/tv_bloc/tv_bloc.dart';
import '../../empty_text/empty_text.dart';
import '../../error_text/error_text.dart';
import '../../idle_text/idle_text.dart';
import '../../loader/home_page_loader.dart';

class TvSection extends StatefulWidget {
  const TvSection({Key? key}) : super(key: key);

  @override
  State<TvSection> createState() => _TvSectionState();
}

class _TvSectionState extends State<TvSection> {
  late TvBloc _tvBloc;
  @override
  Widget build(BuildContext context) {
    void handleCardTap(Tv tv) {
      Navigator.of(context).pushNamed(RouteConstants.tvRoute, arguments: tv);
    }

    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (prev, current) => prev != current,
      builder: (context, state) {
        _tvBloc = context.read<TvBloc>();
        return Column(
          children: [
            Visibility(
              visible: _tvBloc.state.status == TvStatus.idle,
              child: const IdleText(SectionType.tv),
            ),
            Visibility(
              visible: _tvBloc.state.status == TvStatus.loading,
              child: const HomePageLoader(SectionType.tv),
            ),
            Visibility(
              visible: _tvBloc.state.status == TvStatus.succeeded &&
                  _tvBloc.state.tvs.isEmpty,
              child: const EmptyText(SectionType.tv),
            ),
            Visibility(
                visible: _tvBloc.state.status == TvStatus.succeeded &&
                    _tvBloc.state.tvs.isNotEmpty,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.43,
                  padding: const EdgeInsets.all(16),
                  physics: const NeverScrollableScrollPhysics(),
                  children: state.tvs
                      .map((tv) => GestureDetector(
                          onTap: () => handleCardTap(tv), child: TvCard(tv)))
                      .toList(),
                )),
            Visibility(
              visible: _tvBloc.state.status == TvStatus.failed,
              child: const ErrorText(SectionType.tv),
            )
          ],
        );
      },
    );
  }
}
