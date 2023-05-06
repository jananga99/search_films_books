import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Icon(
                      Icons.search,
                      size: 80,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'The search party is just getting started. Tv Series are waiting for you to discover them! join in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _tvBloc.state.status == TvStatus.loading,
              child: Column(
                children: const [
                  SizedBox(height: 225),
                  Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff005c99),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _tvBloc.state.status == TvStatus.succeeded &&
                  _tvBloc.state.tvs.isEmpty,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Icon(
                      Icons.sentiment_neutral,
                      size: 80,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Hmm, seems like we couldn't find any tv series with that name. Don't worry, try again with a different name, and let's make some tv series magic happen.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
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
                  children: state.tvs.map((tv) => TvCard(tv)).toList(),
                )),
            Visibility(
              visible: _tvBloc.state.status == TvStatus.failed,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Icon(FontAwesomeIcons.faceSadTear,
                        size: 80, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      "Oops! Something went wrong. Don't worry, it's not your fault. Please try again, or contact me if the problem persists.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
