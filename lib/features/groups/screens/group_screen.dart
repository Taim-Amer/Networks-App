// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:networks_app/features/groups/controllers/group_controller.dart';
// import 'package:networks_app/utils/constants/colors.dart';
// import 'package:networks_app/utils/constants/enums.dart';
//
// class GroupScreen extends StatelessWidget {
//   const GroupScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     GroupController groupController = GroupController.instance;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Group Details'),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: TColors.secondary,
//           ),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         actions: <Widget>[
//           Obx(() => groupController.isOwner.value
//               ? IconButton(
//                   icon: const Icon(Icons.person_add, color: TColors.secondary),
//                   onPressed: () {
//                     // Action to add members
//                     // This could open a new screen or a dialog
//                     _navigateToAddMembers(context);
//                   },
//                 )
//               : const SizedBox()),
//         ],
//       ),
//       body: const Center(
//         child: Text(
//             "This is the group view where we will disaply the file in it "),
//       ),
//     );
//   }
//
//   void _navigateToAddMembers(BuildContext context) {
//     GroupController groupController = GroupController.instance;
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Add Members'),
//           content: SizedBox(
//             width: double.maxFinite,
//             child: Obx(() {
//               if (groupController.getUsersOutGroupState.value ==
//                   RequestState.loading) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (groupController.getUsersOutGroupState.value ==
//                   RequestState.error) {
//                 return const Text('Failed to load data');
//               }
//               return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount:
//                     groupController.usersOutGroupModel.value.response?.length ??
//                         0,
//                 itemBuilder: (context, index) {
//                   final user =
//                       groupController.usersOutGroupModel.value.response![index];
//                   return Card(
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(
//                             user.image ?? 'https://via.placeholder.com/150'),
//                       ),
//                       title: Text(user.name ?? 'No Name'),
//                       subtitle: Text(user.email ?? 'No Email'),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.add),
//                         onPressed: () {
//                           groupController.createInvitation(userID: user.id.toString());
//                           Navigator.of(context)
//                               .pop(); // Close the dialog after adding
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
