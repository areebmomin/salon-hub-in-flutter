part of '../about_salon_page.dart';

class OwnerDetailsList extends StatefulWidget {
  const OwnerDetailsList({super.key});

  @override
  State<OwnerDetailsList> createState() => _OwnerDetailsListState();
}

class _OwnerDetailsListState extends State<OwnerDetailsList>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Text(
            Strings.owners,
            style: TextStyleConstants.salonInfoCardHeading,
          ),
        ),
        SizedBox(
          height: 264,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 5,
            onPageChanged: (index) => _tabController.index = index,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.appLogo,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      Container(
                        width: double.infinity,
                        height: 64,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryButtonBackground,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Areeb Momin',
                              style: TextStyleConstants.logoutButton,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 5,
            effect: const CustomizableEffect(
              dotDecoration: DotDecoration(
                color: AppColors.inputText,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              activeDotDecoration: DotDecoration(
                color: AppColors.headingTextColor,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                dotBorder: DotBorder(
                  color: AppColors.primaryButtonBackground,
                  width: 2,
                  padding: 3,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _tabController.dispose();
  }
}
