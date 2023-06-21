part of '../breeds_components.dart';

class _GridView extends StatefulWidget {
  const _GridView();

  @override
  State<_GridView> createState() => _GridViewState();
}

class _GridViewState extends State<_GridView> {
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
            child: GridView.builder(
              controller: _scrollController,
              itemCount: state.status == BreedsStatus.fetchMore
                  ? state.breeds.length + 1
                  : state.breeds.length,
              itemBuilder: (_, index) => index == state.breeds.length
                  ? const Center(child: CircularProgressIndicator())
                  : _GridViewAnimator(
                      position: index,
                      columnCount: 2,
                      child: BreedGridItem(
                        breed: state.breeds[index],
                        callback: () =>
                            context.go('/breeds/breedDetails', extra: state.breeds[index]),
                      ),
                    ),
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 48),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            ),
          );
        },
      );
}

class _GridViewAnimator extends StatelessWidget {
  const _GridViewAnimator({required this.child, required this.position, required this.columnCount});

  final Widget child;
  final int position;
  final int columnCount;

  @override
  Widget build(BuildContext context) => AnimationConfiguration.staggeredGrid(
        position: position,
        duration: const Duration(milliseconds: 400),
        delay: const Duration(milliseconds: 100),
        columnCount: columnCount,
        child: ScaleAnimation(
          child: FadeInAnimation(
            child: child,
          ),
        ),
      );
}
