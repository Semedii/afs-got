import 'package:afs_gpt/components/history_card.dart';
import 'package:afs_gpt/cubit/favorite/favorite_cubit.dart';
import 'package:afs_gpt/service/prompt_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final PromptDataService _promptDataService = PromptDataService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversation Favorite'),
      ),
      body: BlocProvider(
        create: (context) => FavoriteCubit(_promptDataService),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<FavoriteCubit>(context);
            if (state is FavoriteInitial) {
              cubit.initPage();
            } else if (state is FavoriteLoaded) {
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