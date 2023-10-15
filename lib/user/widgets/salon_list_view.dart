part of '../user_home_page.dart';

class SalonListView extends StatelessWidget {
  const SalonListView({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserHomePageCubit>();
    var showSalonState = cubit.state as ShowSalonList;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      itemCount: showSalonState.salonList.length,
      prototypeItem: SalonListViewItem(
        cubit,
        UserHomePageSalonInfo.getDefault(),
      ),
      itemBuilder: (context, index) {
        return SalonListViewItem(
          cubit,
          showSalonState.salonList[index],
        );
      },
    );
  }
}

class SalonListViewItem extends StatelessWidget {
  final UserHomePageSalonInfo _userHomePageSalonInfo;
  final UserHomePageCubit cubit;

  const SalonListViewItem(this.cubit, this._userHomePageSalonInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.bookPage);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Card(
          color: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: _getSalonImage(
                    _userHomePageSalonInfo.salonProfilePictureUrl),
                height: 192,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 16, bottom: 16, right: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: _getOwnerImage(
                          _userHomePageSalonInfo.ownerProfilePictureUrl),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _userHomePageSalonInfo.salonName,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: Strings.firaSans,
                                fontWeight: FontWeight.w600,
                                color: AppColors.headingTextColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.location_on_sharp,
                                      color: Colors.grey.shade600,
                                      size: 18,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' ${_userHomePageSalonInfo.salonAddress}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lightTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      color: _userHomePageSalonInfo
                                                  .availabilityStatus ==
                                              AvailabilityStatus.open
                                          ? AppColors.checkboxActive
                                          : Colors.red,
                                      size: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' ${_userHomePageSalonInfo.availabilityStatus.name}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.inputText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ImageProvider<Object> _getOwnerImage(String url) {
    if (url.isNotEmpty) {
      return NetworkImage(url);
    } else {
      return const AssetImage(Assets.userProfileDummy);
    }
  }

  ImageProvider<Object> _getSalonImage(String url) {
    if (url.isNotEmpty) {
      return NetworkImage(url);
    } else {
      return const AssetImage(Assets.appLogo);
    }
  }
}
