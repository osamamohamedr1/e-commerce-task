import 'package:e_commerce_task/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:e_commerce_task/core/utils/colors_manager.dart';
import 'package:e_commerce_task/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_task/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce_task/features/favorites/presentation/views/favorites_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [const HomeView(), const CartView(), const FavoritesView()];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Assets.svgsHome,
          width: 20.w,
          height: 20.h,
          colorFilter: ColorFilter.mode(ColorsManger.primary, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          Assets.svgsHome,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            ColorsManger.secondaryText,
            BlendMode.srcIn,
          ),
        ),
        title: "Home",
        activeColorPrimary: ColorsManger.primary,
        inactiveColorPrimary: ColorsManger.secondaryText,
        textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Assets.svgsCart,
          width: 20.w,
          height: 20.h,
          colorFilter: ColorFilter.mode(ColorsManger.primary, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          Assets.svgsCart,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            ColorsManger.secondaryText,
            BlendMode.srcIn,
          ),
        ),
        title: "Cart",
        activeColorPrimary: ColorsManger.primary,
        inactiveColorPrimary: ColorsManger.secondaryText,
        textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Assets.svgsFavorite,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(ColorsManger.primary, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          Assets.svgsFavorite,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            ColorsManger.secondaryText,
            BlendMode.srcIn,
          ),
        ),
        title: "Favorites",
        activeColorPrimary: ColorsManger.primary,
        inactiveColorPrimary: ColorsManger.secondaryText,
        textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      backgroundColor: ColorsManger.background,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight + 10.h,
      navBarStyle: NavBarStyle.style1,
      decoration: NavBarDecoration(
        colorBehindNavBar: ColorsManger.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
    );
  }
}
