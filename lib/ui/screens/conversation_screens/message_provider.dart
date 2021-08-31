import 'package:charts_flutter/flutter.dart';
import 'package:sage/core/models/conversation.dart';
import 'package:sage/core/view_models/base_view_model.dart';

class MessageProvider extends BaseViewModal{

  bool isSearching=false;
  List<Conversation> searchedUsers=[];


  List<Conversation> messages = [
    Conversation(
      name: "Eugene Hanson",
      messageText: "Hey! What' sup? ",
      time: '10:55 PM',
      imageUrl: null,
      isMessageRead: false,
      messageType: 'receiver'
    ),
    Conversation(
      name: "Toney Stark",
      messageText: "I am fine. How are you doing?",
      time: '4:12 PM',
      imageUrl: null,
      isMessageRead: true,
      messageType: "sender"
    ),
    Conversation(
      name: "Eugene Hanson",
      messageText: "Hey! What' sup? ",
      time: '10:55 PM',
      imageUrl: null,
      isMessageRead: false,
      messageType: 'sender'
    ),
    Conversation(
      name: "Jack chin",
      messageText: "No problem we will talk about it",
      time: '6:12 PM',
      imageUrl: null,
      isMessageRead: true,
      messageType: 'receiver'
    ),
    Conversation(
      name: "Toney Stark",
      messageText: "I am fine. How are you doing?",
      time: '4:12 PM',
      imageUrl: null,
      isMessageRead: true,
        messageType: 'receiver'
    ),
    Conversation(
      name: "Toney Stark",
      messageText: "I am fine. How are you doing?",
      time: '4:12 PM',
      imageUrl: null,
      isMessageRead: true,
        messageType: 'receiver'
    ),
    Conversation(
      name: "Eugene Hanson",
      messageText: "Hey! What' sup? ",
      time: '10:55 PM',
      imageUrl: null,
      isMessageRead: false,
        messageType: 'receiver'
    ),
    Conversation(
      name: "Toney Stark",
      messageText: "I am fine. How are you doing?",
      time: '4:12 PM',
      imageUrl: null,
      isMessageRead: true,
        messageType: 'receiver'
    ),
    Conversation(
      name: "Toney Stark",
      messageText: "I am fine. How are you doing?",
      time: '4:12 PM',
      imageUrl: null,
      isMessageRead: true,
        messageType: 'receiver'
    ),
    Conversation(
      name: "Jan",
      messageText: "I am fine. How are you doing?",
      time: '4:12 PM',
      imageUrl: null,
      isMessageRead: true,
        messageType: 'receiver'
    ),
  ];

  ///
/// convert appbar into searching mode
///
  searchingMode(){
    if(isSearching)
      {
        isSearching=false;
      }
    else{
      isSearching=true;
    }
    notifyListeners();
  }
  ///
/// search user by name
///
  searchUserByName(String keyword){
    print("Searched keyword : $keyword");
    keyword.isEmpty ? isSearching = false : isSearching = true;
    searchedUsers = messages.where((e) =>
    (e.name!.toLowerCase().contains(keyword.toLowerCase()))).toList();
    notifyListeners();
  }


}