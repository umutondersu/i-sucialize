import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_sucialize/util/colors.dart';
import 'chat_home.dart';

class ChatScreen extends StatefulWidget {
  String name;
  ChatScreen(this.name);
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController textEditingController = new TextEditingController();
  final List<ChatMessage> _messages= <ChatMessage>[];


  void _handleSubmit(String text) {
    textEditingController.clear();
    ChatMessage chatMessage1 = new ChatMessage(text: text,name: widget.name,time:"4:19 PM",isMe: false,);
    ChatMessage chatMessage2 = new ChatMessage(text: text,name: "redissus",time:"4:20 PM",isMe: true,);
    setState(() {
      //used to rebuild our widget
      _messages.insert(0, chatMessage1);
      _messages.insert(0, chatMessage2);
    });
  }

  Widget _textComposerWidget() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "   Enter your message"),
                controller: textEditingController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send,color:AppColors.primary,),
                onPressed: () => _handleSubmit(textEditingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainbackgroundcolor,
      appBar: AppBar(title: Text(widget.name),backgroundColor: AppColors.primary,),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder:(_,int index)=>_messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0,),
          new Container(
            decoration: new BoxDecoration(
              color: AppColors.textcolor,
            ),
            child: _textComposerWidget(),
          )
        ],
      ),
    );
  }
}
class ChatMessage extends StatelessWidget {
  final String text ;
  final String name ;
  final String time ;
  final bool isMe;
  //for optional params we use curly braces
  ChatMessage({required this.text,required this.name,required this.isMe, required this.time});
  @override
  Widget build(BuildContext context) {
    String txt =  getPrettyString(text);
    if(isMe){
      return Card(
        color: AppColors.mainbackgroundcolor,
        elevation: 0.5,
        child: ListTile(
          isThreeLine: true,
          trailing: new CircleAvatar(
            child: new Text(name[0],),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(time,style: TextStyle(color: AppColors.secondary.withOpacity(1)),),
              Text(" "),
              Text(name,style: TextStyle(color: AppColors.n_primary.withOpacity(1)),),

            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(" "),
              Text("$txt",style: TextStyle(color: Colors.white.withOpacity(1)),),
            ],
          ),
        ),
      );
    }
    return  ListTile(
      contentPadding: EdgeInsets.only(left: 15.0,),
      isThreeLine: true,
      leading: new CircleAvatar(
        child: new Text(name[0],),
        backgroundColor: AppColors.textColor,
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(name,style: TextStyle(color: AppColors.n_primary.withOpacity(1)),),
          Text(" "),
          Text(time,style: TextStyle(color: AppColors.secondary.withOpacity(1)),),
        ],

      ),
      subtitle: Text("$txt",style: TextStyle(color: Colors.white.withOpacity(1)),),
    );
  }

  String getPrettyString(String str){
    for(int i = 1; i<str.length;i++){
      if(i%30 == 0){
        str = "${str.substring(0,i)} \n ${str.substring(i)}";
      }
    }
    return str;
  }
}