import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/assets.gen.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/gradient_border_container.dart';
import 'package:task_manager/app/widgets/ripple_effect/ripple_effect.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/home/view/models/home_card_data.dart';

class TMCardsCarousel extends StatefulWidget {
  const TMCardsCarousel({
    required this.items,
    required this.onTapCard,
    required this.onLongPressCard,
    required this.onChangeCard,
    this.isAddNewElement = false,
    this.onTapNewElement,
    super.key,
  });

  final List<TMHomeCardData> items;
  final bool isAddNewElement;
  final VoidCallback onTapCard;
  final VoidCallback onLongPressCard;
  final VoidCallback? onTapNewElement;
  final Function(int index) onChangeCard;

  @override
  State<TMCardsCarousel> createState() => _TMCardsCarouselState();
}

class _TMCardsCarouselState extends State<TMCardsCarousel> {
  late final PageController _controller = PageController(
    viewportFraction: 0.75,
  );
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => _currentPage = _controller.page ?? 0);
      widget.onChangeCard(_controller.page?.round() ?? 0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardHeight = screenWidth * 0.75 - 16;
    final cardWidth = screenWidth * 0.83;

    return SizedBox(
      height: cardHeight,
      child: PageView.builder(
        controller: _controller,
        clipBehavior: Clip.none,
        itemCount: widget.isAddNewElement
            ? widget.items.length + 1
            : widget.items.length,
        itemBuilder: (context, index) {
          final isActive = index == _currentPage.round();
          final leftPadding = index == 0 ? 24.0 : 12.0;
          final rightPadding = index == widget.items.length ? 12.0 : 0.0;
          if (index == widget.items.length) {
            return Hero(
              tag: 'create_project',
              child: Padding(
                padding: EdgeInsets.only(
                  left: leftPadding,
                  right: rightPadding,
                ),
                child: SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isActive ? 1.0 : 0.4,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 300),
                      scale: isActive ? 1.0 : 0.9,
                      child: Clickable(
                        onTap: widget.onTapNewElement,
                        child: GradientBorderContainer(
                          backgroundColor: context.colors.secondary,
                          child: RippleEffect(
                            animationSpeed: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Center(
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) => context
                                      .colors
                                      .primaryGradient
                                      .createShader(bounds),
                                  child: Icon(
                                    Icons.add,
                                    size: 50,
                                    color: context.colors.iconDisable,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
            child: Hero(
              tag: widget.items[index].id,
              child: Material(
                color: context.colors.transparent,
                child: SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isActive ? 1.0 : 0.4,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 300),
                      scale: isActive ? 1.0 : 0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Clickable(
                          onTap: widget.onTapCard,
                          onLongPress: widget.onLongPressCard,
                          child: RippleEffect(
                            animationSpeed: 3,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: SvgPicture.asset(
                                    Assets.images.cardBackground,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned.fill(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: context.colors.white
                                                    .withValues(alpha: .2),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  5,
                                                ),
                                                child: Icon(
                                                  widget.items[index].icon ??
                                                      TmIcons.projectLamp,
                                                  color: context.colors.white,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              widget.items[index].topTitle,
                                              style: context.styles.textStyle
                                                  .copyWith(
                                                    color: context.colors.white,
                                                    fontWeight: FontWeight.w900,
                                                    letterSpacing: 0,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          widget.items[index].name,
                                          style: context.styles.h1.copyWith(
                                            color: context.colors.white,
                                            fontSize: 25,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          widget.items[index].date.toString(),
                                          textAlign: TextAlign.start,
                                          style: context.styles.textStyle
                                              .copyWith(
                                                color: context.colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
