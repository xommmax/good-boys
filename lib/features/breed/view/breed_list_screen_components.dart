part of 'breed_list_screen.dart';

class BreedListEmpty extends StatelessWidget {
  const BreedListEmpty({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text('Initial'));
}

class BreedListLoading extends StatelessWidget {
  const BreedListLoading({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: CircularProgressIndicator());
}

class BreedListPopulated extends StatefulWidget {
  const BreedListPopulated({super.key, required this.breeds});

  final List<Breed> breeds;

  @override
  State<BreedListPopulated> createState() => _BreedListPopulatedState();
}

class _BreedListPopulatedState extends State<BreedListPopulated> {
  final _scrollController = ScrollController();

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
      context.read<BreedListCubit>().fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        controller: _scrollController,
        itemCount: widget.breeds.length,
        itemBuilder: (context, index) {
          final breed = widget.breeds[index];
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Text('Name: ${breed.name}'),
          );
        },
      );
}

class BreedListError extends StatelessWidget {
  const BreedListError({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text('Initial'));
}
