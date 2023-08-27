import 'util.dart';

const String logo = "assets/img/logo512.png";
const String user = "assets/img/ic_user.png";

const backIcon = Icons.arrow_back,
    backIosIcon = Icons.arrow_back_ios_new_rounded,
    phoneIcon = Icons.phone_android_rounded,
    settingsIcon = Icons.settings,
    addIcon = Icons.add,
    accountIcon = Icons.key_rounded,
    friendsIcon = Icons.people,
    notificationIcon = Icons.notifications_rounded,
    dataIcon = Icons.storage,
    helpIcon = Icons.help,
    inviteIcon = Icons.emoji_people_rounded,
    cameraIcon = Icons.camera_alt_rounded,
    galleryIcon = Icons.photo_size_select_actual_rounded,
    cancelIcon = Icons.cancel_rounded,
    personIcon = Icons.person,
    editIcon = Icons.edit,
    infoIcon = Icons.info_outline_rounded,
    callIcon = Icons.call,
    videoCallIcon = Icons.videocam_rounded,
    emojiIcon = Icons.emoji_emotions_rounded,
    attachmentIcon = Icons.attachment_rounded,
    sendIcon = Icons.send_rounded,
    logoutIcon = Icons.logout_rounded;

var drawerIconsList = <IconData>[
  accountIcon,
  friendsIcon,
  notificationIcon,
  dataIcon,
  helpIcon,
];

Image avatarImage = Image.asset(
  user,
  color: white,
);

Image avatarImageBg = Image.asset(
  user,
  color: bgColor,
);
