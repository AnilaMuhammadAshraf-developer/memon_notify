import 'package:flutter/material.dart';
import 'package:memon_notify/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CustomAppBar({super.key,required this.title});
  @override
  Widget build(BuildContext context ){
    return AppBar(
      title:Text(title,style:TextStyle(color:AppColors.whiteTextColor,fontWeight: FontWeight.bold)),
      centerTitle:true,
      backgroundColor: AppColors.appBarColor,
    );
  }
  
  @override
   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

} 

