import 'package:flutter/material.dart';
import 'blocs/json_bloc.dart';
import 'blocs/json_bloc_provider.dart';
import 'models/post_item.dart';
import 'models/loader_state.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderResponse(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("home Screen"),
          ),
          body: _HomeScreen(),
        ),
      ),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  JsonBloc bloc;


  @override
  Widget build(BuildContext context) {

    bloc = ProviderResponse.of(context);
    bloc.fetchAllPost();

    return StreamBuilder(
      stream: bloc.jsonList,
      builder: (BuildContext context, AsyncSnapshot<List<JsonItem>> snap) {
        return StreamBuilder(
          stream: bloc.state,
          builder: (context,AsyncSnapshot<StateLoader> state){
            if(state.data == StateLoader.loading){
                return Center(child: CircularProgressIndicator(),);
            }else{
              if (snap.hasData && snap.data.length > 0) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemCount: snap.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snap.data[index].title),
                          subtitle: Text(snap.data[index].body),
                        );
                      }),
                );
              } else {
                return Center(
                  child: Text('No Data'),
                );
              }
            }
          },
        );

      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }
}
