import 'package:task_3/models/sent_recieve.dart';
import 'package:task_3/models/user_model.dart';

class Msg {
  final User sender;
  final String time;
  final String text;
  final SentMsg sentRecieveMsg;
  Msg({
    required this.sender,
    required this.time,
    required this.text,
    required this.sentRecieveMsg,
  });
}

List<Msg> chats = [
  Msg(
    sender: QuadratoTeam,
    time: '11:23am',
    text: 'how are you?',
    sentRecieveMsg: SentMsg(
      msgtxt: 'sent',
      msgType: 'audio',
      timetxt: '12pm',
      isSent: true,
    ),
  ),
  Msg(
      sender: Joyce,
      time: '11:09am',
      text: 'Where are you?',
      sentRecieveMsg: SentMsg(
        msgtxt: 'recieve',
        msgType: 'text',
        timetxt: '12pm',
        isSent: false,
      )),
  Msg(
      sender: yasinulH,
      time: '10:23am',
      text: 'not it cant be it is',
      sentRecieveMsg: SentMsg(
        msgtxt: 'sent',
        msgType: 'text',
        timetxt: '5am',
        isSent: true,
      )),
  Msg(
      sender: axyter,
      time: 'yesterday',
      text: 'No other time to talk now there is no time i am busy',
      sentRecieveMsg: SentMsg(
        msgtxt: 'recieve',
        msgType: 'text',
        timetxt: '6am',
        isSent: true,
      )),
  Msg(
      sender: shShakill,
      time: '03/05/2022',
      text: 'You looks so beautiful',
      sentRecieveMsg: SentMsg(
        msgtxt: 'recieve',
        msgType: 'text',
        timetxt: '1pm',
        isSent: false,
      )),
  Msg(
      sender: currentUser,
      time: '04/02/2022',
      text: 'see you tomorrow after office hours',
      sentRecieveMsg: SentMsg(
        msgtxt: 'sent',
        msgType: 'text',
        timetxt: '05pm',
        isSent: true,
      )),
  Msg(
      sender: markDev,
      time: '04/02/2022',
      text: 'see you tomorrow after office hours',
      sentRecieveMsg: SentMsg(
        msgtxt: 'recieve',
        msgType: 'audio',
        timetxt: '10pm',
        isSent: false,
      ))
];
