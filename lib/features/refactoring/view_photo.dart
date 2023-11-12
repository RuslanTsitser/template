// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class ViewPhoto extends StatefulWidget {
//   // Files_users snapshot;
//   List<FilesUsers>? users_files;
//   int index;
//   ViewPhoto({super.key, required this.users_files, required this.index});

//   @override
//   _ViewPhotoState createState() => _ViewPhotoState();
// }

// class _ViewPhotoState extends State<ViewPhoto> {
//   late bool showBtns;
//   late bool showLoading;
//   bool? showDont;
//   // Отображение нажатия кнопок
//   late bool isPressedUpBtn;
//   late bool isPressedDownBtn;

//   PageController? controller;
//   List<FilesUsers>? users_files_show;
//   int? teck_page;

//   @override
//   void initState() {
//     super.initState();
//     showBtns = false;
//     showLoading = false;
//     showDont = false;
//     isPressedUpBtn = false;
//     isPressedDownBtn = false;

//     users_files_show = List.from(widget.users_files!);
//     users_files_show!.removeAt(0);
//     // widget.users_files.forEach((element) {
//     //   if (element.id != 0) {
//     //     users_files_show.add(element);
//     //   }
//     // });
//     controller = PageController(initialPage: widget.index);
//     teck_page = widget.index;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     users_files_show = null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Image.network(
//           //   AppConstAPI.server_without + widget.snapshot.original,
//           //   width: size.width,
//           //   height: size.height,
//           //   loadingBuilder: (BuildContext context, Widget child,
//           //       ImageChunkEvent loadingProgress) {
//           //     if (loadingProgress == null) return child;
//           //     return Center(
//           //       child: ObjIndicator(),
//           //     );
//           //   },
//           //   fit: BoxFit.cover,
//           // ),
//           PageView.builder(
//             onPageChanged: (int page) {
//               teck_page = page;
//             },
//             controller: controller,
//             itemBuilder: (context, position) {
//               Color topColor = Color.fromRGBO(
//                   users_files_show![position].backgroundColors!.top!.red!,
//                   users_files_show![position].backgroundColors!.top!.green!,
//                   users_files_show![position].backgroundColors!.top!.blue!,
//                   1);
//               Color bottomColor = Color.fromRGBO(
//                   users_files_show![position].backgroundColors!.bottom!.red!,
//                   users_files_show![position].backgroundColors!.bottom!.green!,
//                   users_files_show![position].backgroundColors!.bottom!.blue!,
//                   1);

//               return Stack(children: [
//                 Container(
//                   width: size.width,
//                   height: size.height,
//                   color: AppColors.bgColor,
//                 ),
//                 SizedBox(
//                   height: size.height,
//                   width: size.width,
//                   child: Column(
//                     children: [
//                       Container(
//                         height: size.height / 2,
//                         width: size.width,
//                         color: topColor,
//                       ),
//                       Container(
//                         height: size.height / 2,
//                         width: size.width,
//                         color: bottomColor,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Center(
//                   child: SizedBox(
//                     width: size.width,
//                     height: size.width,
//                     child: PhotoView(
//                       imageProvider: NetworkImage(
//                         AppConstAPI.serverWithout + users_files_show![position].original!,
//                       ),
//                       minScale: PhotoViewComputedScale.contained,
//                       maxScale: PhotoViewComputedScale.covered,
//                       enableRotation: false,
//                       loadingBuilder: (BuildContext context, ImageChunkEvent? loadingProgress) {
//                         return const Center(
//                           child: ObjIndicator(),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 // Image.network(
//                 //   AppConstAPI.server_without +
//                 //       users_files_show[position].original,
//                 //   width: size.width,
//                 //   height: size.height,
//                 //   loadingBuilder: (BuildContext context, Widget child,
//                 //       ImageChunkEvent loadingProgress) {
//                 //     if (loadingProgress == null) {
//                 //       return child;
//                 //     }
//                 //     return Center(
//                 //       child: ObjIndicator(),
//                 //     );
//                 //   },
//                 //   fit: BoxFit.scaleDown,
//                 // ),
//               ]);
//             },
//             itemCount: users_files_show!.length,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 24),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 InkWell(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: SizedBox(
//                       width: 80,
//                       height: 80,
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           top: 24,
//                           left: 24,
//                           right: 24,
//                           bottom: 24,
//                         ),
//                         child: Image.asset(
//                           'assets/images/btn_close_round.png',
//                           width: 31,
//                           height: 31,
//                         ),
//                       ),
//                     )),
//               ],
//             ),
//           ),
//           Positioned(
//               bottom: 32,
//               child: SizedBox(
//                 width: size.width,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           showBtns = !showBtns;
//                         });
//                       },
//                       child: SizedBox(
//                         width: 80,
//                         height: 80,
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                             top: 24,
//                             left: 24,
//                             right: 24,
//                             bottom: 24,
//                           ),
//                           child: Image.asset(
//                             'assets/images/info_round.png',
//                             width: 31,
//                             height: 31,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )),
//           Positioned(
//               bottom: 32,
//               child: showLoading
//                   ? SizedBox(
//                       width: size.width,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           ObjIndicator(),
//                         ],
//                       ),
//                     )
//                   : showBtns
//                       ? SizedBox(
//                           width: size.width,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Column(
//                                 children: [
//                                   SizedBox(
//                                     width: size.width / 2,
//                                     height: 40,
//                                     child: GestureDetector(
//                                       onTap: () async {
//                                         setState(() {
//                                           showLoading = true;
//                                         });
//                                         //Определить фото на сервере, как главное фото
//                                         EditProfileApi.fetchPhotoForProfile(users_files_show![teck_page!])
//                                             .then((answer) async {
//                                           SharedPreferences prefs = await SharedPreferences.getInstance();
//                                           prefs.setString(PrefsConst.photoSmall, answer.data!.user!.mainImage!.small);
//                                           Navigator.of(context).pop(true);
//                                           getIt<NavBarAvatarChangeNotifier>().updatePhoto();
//                                         }).onError((dynamic error, stackTrace) {
//                                           setState(() {
//                                             showLoading = false;
//                                           });
//                                         });
//                                       },
//                                       onTapDown: (TapDownDetails details) {
//                                         setState(() {
//                                           isPressedUpBtn = true;
//                                         });
//                                       },
//                                       onTapUp: (TapUpDetails details) {
//                                         setState(() {
//                                           isPressedUpBtn = false;
//                                         });
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             color: isPressedUpBtn ? AppColors.greyColor : AppColors.orangeColor,
//                                             borderRadius: const BorderRadius.all(Radius.circular(4.0))),
//                                         child: const Center(
//                                           child: Text(
//                                             'Сделать главным',
//                                             style: TextStyle(
//                                                 color: AppColors.whiteColor, fontSize: 13, fontWeight: FontWeight.w600),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   SizedBox(
//                                     width: size.width / 2,
//                                     height: 40,
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           showLoading = true;
//                                         });
//                                         // Удалить фото на сервере
//                                         DeleteFile.delete_file(users_files_show![teck_page!].id).then((answer) {
//                                           if (answer == 'Successfully deleted') {
//                                             setState(() {
//                                               users_files_show!.removeAt(teck_page!);
//                                               if (teck_page == 1) {
//                                                 controller!.jumpToPage(teck_page! + 1);
//                                               } else {
//                                                 controller!.jumpToPage(teck_page! - 1);
//                                               }
//                                               showLoading = false;
//                                               getIt<NavBarAvatarChangeNotifier>().updatePhoto();
//                                               context.read<EditAccountBloc>().add(EditAccountLoadedEvent());
//                                             });
//                                           } else if (answer == 'Cannot remove') {
//                                             setState(() {
//                                               showLoading = false;
//                                               showBtns = !showBtns;
//                                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                                 content:
//                                                     const Text('Для удаления файла необходимо установить новый аватар'),
//                                                 backgroundColor: AppColors.orangeColor,
//                                                 action: SnackBarAction(
//                                                   label: 'OK',
//                                                   textColor: AppColors.whiteColor,
//                                                   onPressed: () {},
//                                                 ),
//                                               ));
//                                             });
//                                           } else {
//                                             setState(() {
//                                               showLoading = false;
//                                             });
//                                           }
//                                         }).onError((dynamic error, stackTrace) {
//                                           setState(() {
//                                             showLoading = false;
//                                           });
//                                         });
//                                       },
//                                       onTapDown: (TapDownDetails details) {
//                                         setState(() {
//                                           isPressedDownBtn = true;
//                                         });
//                                       },
//                                       onTapUp: (TapUpDetails details) {
//                                         setState(() {
//                                           isPressedDownBtn = false;
//                                         });
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             color: isPressedDownBtn ? AppColors.greyColor : AppColors.darkColor,
//                                             borderRadius: const BorderRadius.all(Radius.circular(4.0))),
//                                         child: const Center(
//                                           child: Text(
//                                             'Удалить',
//                                             style: TextStyle(
//                                                 color: AppColors.whiteColor, fontSize: 13, fontWeight: FontWeight.w600),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         )
//                       : const SizedBox()),
//         ],
//       ),
//     );
//   }
// }
