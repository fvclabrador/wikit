/// A placeholder class that represents an entity or model.
class WikitItem {
  const WikitItem(this.category, this.title, this.description);

  final String category;
  final String title;
  final String description;
}

const allItems = [
  WikitItem("General3", "IAAS", "a"),
  WikitItem("General2", "PAAS", "b"),
  WikitItem("General", "SAAS", "c")
];

const wikis = [
  {
    "category": "API",
    "title": "REST API",
    "description":
        "is a web service that support XML and JSON and it uses method/resources like post, get, update, and delete"
  },
  {
    "category": "API",
    "title": "SOAP API",
    "description":
        "is a web service that supports XML only and it uses WSDL file as a contract"
  },
];
