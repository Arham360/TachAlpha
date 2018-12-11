class Contact {
  final int id;
  final String name;
  final String image;
  final String picture;

  const Contact({this.id, this.name, this.image, this.picture});
}

List<Contact> contacts = [
  const Contact(
      id: 0,
      name: "Batman",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWUzMeRAXt60FzrM4YBKvO-wM_hIri7eVTR1-Ka9jqY-Ttvy4Ktg",
      picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3-ck-qjxkjS5MIoP4KuM2lbmsJ_6b37u-2RQsCsTVE1enYKu50Q"
  ),
  const Contact(
      id: 1,
      name: "Wonder Woman",
      image: "https://images-na.ssl-images-amazon.com/images/I/71ki0-wGijL._SX425_.jpg",
      picture: "https://cdn.vox-cdn.com/thumbor/Ia_Cyth1PDyN8nLltrMSFv85rwY=/0x0:1280x640/1200x800/filters:focal(467x58:671x262)/cdn.vox-cdn.com/uploads/chorus_image/image/55115281/wonderwoman2.0.jpg"
  ),
  const Contact(
      id:2,
      name: "Flash",
      image: "https://images-na.ssl-images-amazon.com/images/I/61mH0NFTEHL._SY450_.jpg",
      picture: "https://www.sideshowtoy.com/assets/products/200516-the-flash/lg/dc-comics-the-flash-statue-prime1-studio-200516-03.jpg"
  ),
  const Contact(
      id: 3,
      name: "Super Man",
      image: "https://i.ytimg.com/vi/4Dg6QQOSsPA/maxresdefault.jpg",
      picture: "https://static3.srcdn.com/wordpress/wp-content/uploads/2018/04/Superman-by-Dan-Jurgens-in-Action-Comics-1000.jpg"
  ),
  const Contact(
      id: 4,
      name: "Green Lantern",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr0EJYM6PhC_0TF6l73bt1yRi1SYpNAlzIYCfHIbmWdixCwyx0GQ",
      picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-cEAVia9o4hw3ODKqhey7KwDntu2x4ybdtEAMnVy72ag4PRWelQ"
  ),
];