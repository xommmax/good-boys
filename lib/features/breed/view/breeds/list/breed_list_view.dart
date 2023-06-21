part of '../breeds_components.dart';

class _ListView extends StatefulWidget {
  const _ListView();

  @override
  State<_ListView> createState() => _ListViewState();
}

class _ListViewState extends State<_ListView> {
  final _scrollController = ScrollController();
  BreedsCubit get _cubit => context.read<BreedsCubit>();

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
  Widget build(BuildContext context) => BlocBuilder<BreedsCubit, BreedsState>(
        builder: (context, state) {
          return AnimationLimiter(
            child: ListView.separated(
              controller: _scrollController,
              itemCount: state.status == BreedsStatus.fetchMore
                  ? state.breeds.length + 1
                  : state.breeds.length,
              itemBuilder: (_, index) => index == state.breeds.length
                  ? const Center(child: CircularProgressIndicator())
                  : _ListViewAnimator(
                      position: index,
                      child: BreedListItem(
                        breed: state.breeds[index],
                        callback: () =>
                            context.go('/breeds/breedDetails', extra: state.breeds[index]),
                      ),
                    ),
              separatorBuilder: (_, index) => _ListViewAnimator(
                position: index,
                child: FadeInAnimation(
                  child: Divider(
                    height: 24,
                    color: Colors.black.withAlpha(40),
                  ),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
            ),
          );
        },
      );
}

class _ListViewAnimator extends StatelessWidget {
  const _ListViewAnimator({required this.child, required this.position});

  final Widget child;
  final int position;

  @override
  Widget build(BuildContext context) => AnimationConfiguration.staggeredList(
        position: position,
        duration: const Duration(milliseconds: 300),
        delay: const Duration(milliseconds: 100),
        child: SlideAnimation(
          verticalOffset: 80,
          child: FadeInAnimation(
            child: child,
          ),
        ),
      );
}
