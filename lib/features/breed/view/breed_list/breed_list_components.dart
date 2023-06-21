part of 'breed_list_screen.dart';

class BreedListLoading extends StatelessWidget {
  const BreedListLoading({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: CircularProgressIndicator());
}

class BreedListPopulated extends StatefulWidget {
  const BreedListPopulated({super.key});

  @override
  State<BreedListPopulated> createState() => _BreedListPopulatedState();
}

class _BreedListPopulatedState extends State<BreedListPopulated> {
  final _scrollController = ScrollController();
  BreedListCubit get _cubit => context.read<BreedListCubit>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _cubit.fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<BreedListCubit, BreedListState>(
        builder: (context, state) {
          return ListView.separated(
            key: const PageStorageKey('breedListKey'),
            controller: _scrollController,
            itemCount: state.status == BreedListStatus.fetchMore
                ? state.breeds.length + 1
                : state.breeds.length,
            itemBuilder: (_, index) => index == state.breeds.length
                ? const Center(child: CircularProgressIndicator())
                : BreedListItem(
                    breed: state.breeds[index],
                    callback: () =>
                        context.go('/breedList/breedDetails', extra: state.breeds[index]),
                  ),
            separatorBuilder: (_, index) => Divider(
              height: 24,
              color: Colors.black.withAlpha(40),
            ),
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
          );
        },
      );
}
