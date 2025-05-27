package sec03;

import static com.mongodb.client.model.Filters.eq;

import app.Database;
import com.mongodb.client.MongoCollection;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

public class FindOneTest {

  public static void main(String[] args) {
    MongoCollection<Document> collection = Database.getCollection("todo");

    String id = "68353d4ac4bfd574b7407c53";
    Bson query = eq("_id", new ObjectId(id));

    Document doc = collection.find(query).first();
    System.out.println("==> findByIdResult : " + doc);

    Database.close();
  }

}
