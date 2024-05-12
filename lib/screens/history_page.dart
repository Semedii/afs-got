import 'package:afs_gpt/components/history_card.dart';
import 'package:afs_gpt/cubit/history/history_cubit.dart';
import 'package:afs_gpt/service/prompt_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final PromptDataService _promptDataService = PromptDataService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: BlocProvider(
        create: (context) => HistoryCubit(_promptDataService),
        child: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<HistoryCubit>(context);
            if (state is HistoryInitial) {
              cubit.initPage();
            } else if (state is HistoryLoaded) {
              return ListView.builder(
                itemCount: state.prompts.length,
                itemBuilder: (context, index) {
                  final prompt = state.prompts[index];
                return  prompt!=null?
                   HistoryCard(
                    question: prompt.question,
                    response: prompt.response,
                    isFavorite: prompt.isFavorite,
                    onFavoriteTapped: ()=> cubit.onFavoriteTapped(prompt.id, prompt.isFavorite)
                  ): Container();
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}