class CategoriesModel {
  String title;
  String collectionId;
  String imageUrl;

  CategoriesModel({
    required this.title,
    required this.collectionId,
    required this.imageUrl
  });
}
class Categories {
  static List<CategoriesModel> categories = [
    CategoriesModel(
      title: 'Nature',
      collectionId: '1319040',
      imageUrl: 'https://images.unsplash.com/photo-1657214059175-53cb22261d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
    ),
    CategoriesModel(
        title: 'Art',
        collectionId: '11531318',
        imageUrl: 'https://images.unsplash.com/photo-1549887552-cb1071d3e5ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
    ),
    CategoriesModel(
        title: 'Office',
        collectionId: '304898',
        imageUrl: 'https://images.unsplash.com/photo-1664575601786-b00156752b61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8b2ZmaWNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
    ),
    CategoriesModel(
        title: 'People',
        collectionId: '402491',
        imageUrl: 'https://images.unsplash.com/photo-1657664073337-31394d7e5c7a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
    ),
    CategoriesModel(
        title: 'Fish',
        collectionId: '17457',
        imageUrl: 'https://images.unsplash.com/photo-1622567817558-3eac5d13fa86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fGZpc2h8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
    ),
    CategoriesModel(
        title: 'Cities',
        collectionId: '6',
        imageUrl: 'https://images.unsplash.com/photo-1516844113229-18646a422956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'
    ),
    CategoriesModel(
        title: 'Cars',
        collectionId: '7',
        imageUrl: 'https://images.unsplash.com/photo-1555353540-64580b51c258?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNhcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'
    ),
    CategoriesModel(
        title: 'Music',
        collectionId: '8',
        imageUrl: 'https://images.unsplash.com/photo-1524650359799-842906ca1c06?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzJ8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
    ),
    CategoriesModel(
        title: 'Eating',
        collectionId: '9',
        imageUrl: 'https://images.unsplash.com/photo-1568901839061-11e2837cd2b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZWF0aW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
    ),
    CategoriesModel(
        title: 'Coding',
        collectionId: '10',
        imageUrl: 'https://images.unsplash.com/photo-1575089976121-8ed7b2a54265?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y29kaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'
    ),

  ];
}